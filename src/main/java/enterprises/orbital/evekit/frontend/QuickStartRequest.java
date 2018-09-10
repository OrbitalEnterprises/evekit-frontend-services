package enterprises.orbital.evekit.frontend;

import enterprises.orbital.base.OrbitalProperties;
import enterprises.orbital.base.PersistentProperty;
import enterprises.orbital.base.Stamper;
import enterprises.orbital.evekit.account.EveKitUserAccountProvider;

import javax.persistence.*;
import java.io.IOException;
import java.util.Objects;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Record of a quick start access key selection.  This record is created on request
 * from a third party application and allows for time boxed delivery of access key
 * credentials back to the third party.
 */
@Entity
@Table(
    name = "evekit_qs_selection",
    indexes = {
        @Index(
            name = "hashIndex",
            columnList = "token"),
    })
@NamedQueries({
    @NamedQuery(
        name = "QuickStartRequest.sid",
        query = "SELECT c FROM QuickStartRequest c where c.sid = :sid"),
    @NamedQuery(
        name = "QuickStartRequest.token",
        query = "SELECT c FROM QuickStartRequest c where c.token = :token"),
    @NamedQuery(
        name = "QuickStartRequest.expired",
        query = "SELECT c FROM QuickStartRequest c where c.selectionTime < :limit"),
})
public class QuickStartRequest {
  private static final Logger log = Logger.getLogger(QuickStartRequest.class.getName());
  private static final String PROP_MAX_REQUEST_DELAY = "enterprises.orbital.evekit.frontend.quickstart_request_limit";
  private static final long DEF_MAX_REQUEST_DELAY = TimeUnit.MILLISECONDS.convert(10, TimeUnit.MINUTES);

  // Unique selection ID
  @Id
  @GeneratedValue(
      strategy = GenerationType.SEQUENCE,
      generator = "ek_seq")
  @SequenceGenerator(
      name = "ek_seq",
      initialValue = 100000,
      allocationSize = 1,
      sequenceName = "account_sequence")
  protected long sid;

  // DateTime when selection created (ms UTC)
  private long selectionTime;

  // Name of requestor
  private String requestor;

  // Third party access token used to retrieve access credentials when complete
  private String token;

  // If true, then we're still waiting for the user to complete key selection.
  private boolean pending;

  // The access key selected by the user.
  private long accessKey;

  // The access hash selected by the user.
  private String accessHash;

  @SuppressWarnings("unused")
  protected QuickStartRequest() {}

  @SuppressWarnings("WeakerAccess")
  public QuickStartRequest(long selectionTime, String requestor, String token, boolean pending,
                           long accessKey, String accessHash) {
    this.selectionTime = selectionTime;
    this.requestor = requestor;
    this.token = token;
    this.pending = pending;
    this.accessKey = accessKey;
    this.accessHash = accessHash;
  }

  @SuppressWarnings("WeakerAccess")
  public long getSid() {
    return sid;
  }

  @SuppressWarnings("unused")
  public long getSelectionTime() {
    return selectionTime;
  }

  @SuppressWarnings("unused")
  public String getRequestor() {
    return requestor;
  }

  @SuppressWarnings("WeakerAccess")
  public String getQsURL() {
    return OrbitalProperties.getGlobalProperty("enterprises.orbital.evekit.frontend.apppath") +
        "/#/qs?id=" + String.valueOf(getSid());
  }

  @SuppressWarnings("WeakerAccess")
  public String getToken() {
    return token;
  }

  @SuppressWarnings("WeakerAccess")
  public boolean isPending() {
    return pending;
  }

  @SuppressWarnings("WeakerAccess")
  public long getAccessKey() {
    return accessKey;
  }

  @SuppressWarnings("WeakerAccess")
  public String getAccessHash() {
    return accessHash;
  }

  @SuppressWarnings("WeakerAccess")
  public void setPending(boolean pending) {
    this.pending = pending;
  }

  @SuppressWarnings("WeakerAccess")
  public void setAccessKey(long accessKey) {
    this.accessKey = accessKey;
  }

  @SuppressWarnings("WeakerAccess")
  public void setAccessHash(String accessHash) {
    this.accessHash = accessHash;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    QuickStartRequest that = (QuickStartRequest) o;
    return sid == that.sid &&
        selectionTime == that.selectionTime &&
        pending == that.pending &&
        accessKey == that.accessKey &&
        Objects.equals(requestor, that.requestor) &&
        Objects.equals(token, that.token) &&
        Objects.equals(accessHash, that.accessHash);
  }

  @Override
  public int hashCode() {
    return Objects.hash(sid, selectionTime, requestor, token, pending, accessKey, accessHash);
  }

  @Override
  public String toString() {
    return "QuickStartRequest{" +
        "sid=" + sid +
        ", selectionTime=" + selectionTime +
        ", requestor='" + requestor + '\'' +
        ", qsURL='" + getQsURL() + '\'' +
        ", token='" + token + '\'' +
        ", pending=" + pending +
        ", accessKey=" + accessKey +
        ", accessHash='" + accessHash + '\'' +
        '}';
  }

  QuickStartResponse asResponse() {
    return new QuickStartResponse(getToken(), getQsURL());
  }

  QuickStartSelection asSelection() {
    return new QuickStartSelection(getToken(), isPending(), getAccessKey(), getAccessHash());
  }

  static QuickStartRequest makeSelectionRequest(final String requestor) throws IOException {
    try {
      return EveKitUserAccountProvider.getFactory()
                                      .runTransaction(() -> {
                                        long selectTime = OrbitalProperties.getCurrentTime();
                                        long seed_one = new Random(OrbitalProperties.getCurrentTime()).nextLong();
                                        long seed_two = new Random(OrbitalProperties.getCurrentTime()).nextLong();
                                        String token = Stamper.digest(
                                            String.valueOf(OrbitalProperties.getCurrentTime()) +
                                                String.valueOf(seed_two) + String.valueOf(seed_one));
                                        QuickStartRequest newRequest = new QuickStartRequest(selectTime, requestor,
                                                                                             token, true, -1, null);
                                        return EveKitUserAccountProvider.getFactory()
                                                                        .getEntityManager()
                                                                        .merge(newRequest);
                                      });
    } catch (Exception e) {
      if (e.getCause() instanceof IOException) throw (IOException) e.getCause();
      log.log(Level.SEVERE, "query error", e);
      throw new IOException(e.getCause());
    }
  }

  static QuickStartRequest getByToken(final String token) throws UnknownQuickStartRequestException, IOException {
    try {
      return EveKitUserAccountProvider.getFactory()
                                      .runTransaction(() -> {
                                        TypedQuery<QuickStartRequest> getter = EveKitUserAccountProvider.getFactory()
                                                                                                        .getEntityManager()
                                                                                                        .createNamedQuery(
                                                                                                            "QuickStartRequest.token",
                                                                                                            QuickStartRequest.class);
                                        getter.setParameter("token", token);
                                        try {
                                          return getter.getSingleResult();
                                        } catch (NoResultException e) {
                                          throw new UnknownQuickStartRequestException();
                                        }
                                      });
    } catch (Exception e) {
      if (e.getCause() instanceof IOException) throw (IOException) e.getCause();
      if (e.getCause() instanceof UnknownQuickStartRequestException)
        throw (UnknownQuickStartRequestException) e.getCause();
      log.log(Level.SEVERE, "query error", e);
      throw new IOException(e.getCause());
    }
  }

  static String requestor(final long sid) throws UnknownQuickStartRequestException, IOException {
    try {
      return EveKitUserAccountProvider.getFactory()
                               .runTransaction(() -> {
                                 TypedQuery<QuickStartRequest> getter = EveKitUserAccountProvider.getFactory()
                                                                                                 .getEntityManager()
                                                                                                 .createNamedQuery(
                                                                                                     "QuickStartRequest.sid",
                                                                                                     QuickStartRequest.class);
                                 getter.setParameter("sid", sid);
                                 try {
                                   return getter.getSingleResult().getRequestor();
                                 } catch (NoResultException e) {
                                   throw new UnknownQuickStartRequestException();
                                 }
                               });
    } catch (Exception e) {
      if (e.getCause() instanceof IOException) throw (IOException) e.getCause();
      if (e.getCause() instanceof UnknownQuickStartRequestException)
        throw (UnknownQuickStartRequestException) e.getCause();
      log.log(Level.SEVERE, "query error", e);
      throw new IOException(e.getCause());
    }
  }

  static void recordCredentials(final long sid, final long accessKey,
                                final String accessHash) throws UnknownQuickStartRequestException, IOException {
    try {
      EveKitUserAccountProvider.getFactory()
                               .runTransaction(() -> {
                                 TypedQuery<QuickStartRequest> getter = EveKitUserAccountProvider.getFactory()
                                                                                                 .getEntityManager()
                                                                                                 .createNamedQuery(
                                                                                                     "QuickStartRequest.sid",
                                                                                                     QuickStartRequest.class);
                                 getter.setParameter("sid", sid);
                                 try {
                                   QuickStartRequest result = getter.getSingleResult();
                                   if (!result.isPending()) throw new IOException(
                                       "Credentials already set.  Start a new request if another credential is desired.");
                                   result.setPending(false);
                                   result.setAccessKey(accessKey);
                                   result.setAccessHash(accessHash);
                                   EveKitUserAccountProvider.getFactory()
                                                            .getEntityManager()
                                                            .merge(result);
                                 } catch (NoResultException e) {
                                   throw new UnknownQuickStartRequestException();
                                 }
                               });
    } catch (Exception e) {
      if (e.getCause() instanceof IOException) throw (IOException) e.getCause();
      if (e.getCause() instanceof UnknownQuickStartRequestException)
        throw (UnknownQuickStartRequestException) e.getCause();
      log.log(Level.SEVERE, "query error", e);
      throw new IOException(e.getCause());
    }
  }

  /**
   * Remove all selection requests which have expired (completed or otherwise).
   */
  public static void cleanExpired() throws IOException {
    long limit = OrbitalProperties.getCurrentTime() - PersistentProperty.getLongPropertyWithFallback(
        PROP_MAX_REQUEST_DELAY, DEF_MAX_REQUEST_DELAY);
    try {
      EveKitUserAccountProvider.getFactory()
                               .runTransaction(() -> {
                                 TypedQuery<QuickStartRequest> getter = EveKitUserAccountProvider.getFactory()
                                                                                                 .getEntityManager()
                                                                                                 .createNamedQuery(
                                                                                                     "QuickStartRequest.expired",
                                                                                                     QuickStartRequest.class);
                                 getter.setParameter("limit", limit);
                                 for (QuickStartRequest next : getter.getResultList()) {
                                   EveKitUserAccountProvider.getFactory()
                                                            .getEntityManager()
                                                            .remove(next);
                                 }
                               });
    } catch (Exception e) {
      if (e.getCause() instanceof IOException) throw (IOException) e.getCause();
      log.log(Level.SEVERE, "query error", e);
      throw new IOException(e.getCause());
    }
  }

  // Set to true when the cleaner thread has been started
  private static boolean cleanerStarted = false;

  public static void init() {
    synchronized (QuickStartRequest.class) {
      if (cleanerStarted) return;
      new Thread(() -> {
        //noinspection InfiniteLoopStatement
        while (true) {
          try {
            long now = OrbitalProperties.getCurrentTime();
            cleanExpired();
            Thread.sleep(TimeUnit.MILLISECONDS.convert(5, TimeUnit.MINUTES));
          } catch (Throwable e) {
            // Catch everything but log it
            log.log(Level.WARNING, "caught error in state cleanup loop (ignoring)", e);
          }
        }
      }).start();
      cleanerStarted = true;
    }
  }

}

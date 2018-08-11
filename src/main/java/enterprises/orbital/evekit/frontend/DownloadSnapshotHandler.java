package enterprises.orbital.evekit.frontend;

import enterprises.orbital.evekit.account.AccountNotFoundException;
import enterprises.orbital.evekit.account.EveKitUserAccount;
import enterprises.orbital.evekit.account.SynchronizedEveAccount;
import enterprises.orbital.evekit.snapshot.SnapshotScheduler;
import enterprises.orbital.oauth.AuthUtil;
import enterprises.orbital.oauth.UserAccount;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.logging.Logger;

/**
 * Handle request to download latest snapshot for the synch account id provided by the caller. This handler first verifies that the request is authenticated and
 * has access to the requested object. If true, then the download is allowed to proceed.
 */
public class DownloadSnapshotHandler extends HttpServlet {
  private static final long serialVersionUID = -328015872525110528L;
  private static final Logger log = Logger.getLogger(DownloadSnapshotHandler.class.getName());
  private static final String PARAM_ACCT = "acct";

  /**
   * Used below to determine the size of chucks to read in. Should be > 1kb and < 10MB
   */
  private static final int BUFFER_SIZE = 2 * 1024 * 1024;

  @Override
  public void doGet(
      HttpServletRequest req,
      HttpServletResponse res) throws IOException {
    // Verify authenticated.
    UserAccount user = AuthUtil.getCurrentUser(req);
    if (user == null) {
      // Not authenticated, fail.
      res.getWriter()
         .write("User not authenticated.  Please login to EveKit and try again.");
      res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    // Verify the specified account exists and belongs to the authenticated user.
    String acctParam = req.getParameter(PARAM_ACCT);
    long acctid = -1;
    try {
      acctid = Long.valueOf(acctParam);
    } catch (Exception e) {
      // ignore
    }
    if (acctid == -1) {
      res.getWriter()
         .write("Account ID garbled.  Please refresh and try again.");
      res.setStatus(HttpServletResponse.SC_NOT_FOUND);
      return;
    }

    try {
      SynchronizedEveAccount acct = SynchronizedEveAccount.getSynchronizedAccount((EveKitUserAccount) user, acctid, true);
      if (!acct.getUserAccount()
               .getUid()
               .equals(user.getUid())) {
        res.getWriter()
           .write("Authenticated user is not associated with this account.  Please verify you are logged into EveKit and try again.");
        res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        return;
      }

      try {
        // Find the latest snapshot for this account and return it, or not found if nothing snapped yet.
        // Files are sorted increasing by time. Last file (if it exists) is the one we want to return.
        List<File> files = SnapshotScheduler.findSnapshotFiles(acct);
        File latestFile = files.size() > 0 ? files.get(files.size() - 1) : null;

        if (latestFile == null) {
          res.getWriter()
             .write("No snapshot was found for the specified account.  If this is a new account, you may have to wait up to six hours for the first snapshot.");
          res.setStatus(HttpServletResponse.SC_NOT_FOUND);
          return;
        }

        // Looks good, serve data.
        long fileSize = latestFile.length();
        res.setContentType("application/zip");
        res.setContentLength((int) fileSize);
        res.setHeader("Content-Disposition", "attachment; filename=" + latestFile.getName());
        FileInputStream readStream = new FileInputStream(latestFile);
        copy(readStream, res.getOutputStream());
        log.info("Transmitted " + latestFile.getName() + " with length: " + fileSize);
      } catch (Exception e) {
        // Couldn't match, Return error.
        log.warning("Error retrieving snapshot for acct: " + acctid + " with error: " + e);
        res.getWriter()
           .write("Error retrieving snapshot file.  Please contact the EveKit administrator if this error continues to occur.");
        res.setStatus(HttpServletResponse.SC_NOT_FOUND);
        return;
      }
    } catch (AccountNotFoundException e) {
      res.getWriter()
         .write("Specified account not found.  If you believe this is an error, please refresh and try again.");
      res.setStatus(HttpServletResponse.SC_NOT_FOUND);
      return;
    }
  }

  /**
   * Transfer the data from the inputStream to the outputStream. Then close both streams.
   */
  private void copy(
      InputStream input,
      OutputStream output) throws IOException {
    try {
      byte[] buffer = new byte[BUFFER_SIZE];
      int bytesRead = input.read(buffer);
      while (bytesRead != -1) {
        output.write(buffer, 0, bytesRead);
        bytesRead = input.read(buffer);
      }
    } finally {
      input.close();
      output.close();
    }
  }

}

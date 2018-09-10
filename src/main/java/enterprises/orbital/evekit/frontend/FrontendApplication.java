package enterprises.orbital.evekit.frontend;

import enterprises.orbital.base.OrbitalProperties;
import enterprises.orbital.base.PersistentProperty;
import enterprises.orbital.db.DBPropertyProvider;
import enterprises.orbital.evekit.account.EveKitUserAccountProvider;
import enterprises.orbital.evekit.ws.account.AccountWS;
import enterprises.orbital.evekit.ws.account.CredentialWS;
import enterprises.orbital.evekit.ws.model.ESISyncTrackerWS;
import enterprises.orbital.oauth.AuthUtil;
import org.glassfish.jersey.server.monitoring.ApplicationEvent;
import org.glassfish.jersey.server.monitoring.ApplicationEventListener;
import org.glassfish.jersey.server.monitoring.RequestEvent;
import org.glassfish.jersey.server.monitoring.RequestEventListener;

import javax.servlet.ServletContext;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Context;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Logger;

public class FrontendApplication extends Application {
  private static final Logger log = Logger.getLogger(FrontendApplication.class.getName());

  // Property which holds the name of the persistence unit for properties
  public static final String PROP_PROPERTIES_PU = "enterprises.orbital.evekit.frontend.properties.persistence_unit";
  public static final String PROP_APP_PATH = "enterprises.orbital.evekit.frontend.apppath";
  public static final String DEF_APP_PATH = "http://localhost/controller";
  public static final String PROP_APP_NAME = "enterprises.orbital.evekit.frontend.appname";

  public FrontendApplication() throws IOException {
    // Populate properties
    OrbitalProperties.addPropertyFile("EveKitFrontend.properties");
    // Sent persistence unit for properties
    PersistentProperty.setProvider(new DBPropertyProvider(OrbitalProperties.getGlobalProperty(PROP_PROPERTIES_PU)));
    // Sent UserAccountProvider provider
    AuthUtil.setUserAccountProvider(new EveKitUserAccountProvider());
    // Start quickstart request cleanup thread
    QuickStartRequest.init();
  }

  @Override
  public Set<Class<?>> getClasses() {
    Set<Class<?>> resources = new HashSet<>();
    // App start listener
    resources.add(ConfigureCookieListener.class);
    // Local resources
    resources.add(AccountWS.class);
    resources.add(CredentialWS.class);
    resources.add(ESISyncTrackerWS.class);
    resources.add(AuthenticationWS.class);
    resources.add(ReleaseWS.class);
    resources.add(AdminWS.class);
    // Swagger additions
    resources.add(io.swagger.jaxrs.listing.ApiListingResource.class);
    resources.add(io.swagger.jaxrs.listing.SwaggerSerializers.class);
    // Return resource set
    return resources;
  }

  public static class ConfigureCookieListener implements ApplicationEventListener {

    @Context
    private ServletContext ctx; //not null anymore :)

    @Override
    public void onEvent(ApplicationEvent event) {
      switch (event.getType()) {
        case INITIALIZATION_FINISHED:
          // Configure session cookie path so it works properly behind a proxy
          log.info("Setting cookie path to: " + "/" + OrbitalProperties.getGlobalProperty(PROP_APP_NAME));
          ctx.getSessionCookieConfig()
             .setPath("/" + OrbitalProperties.getGlobalProperty(PROP_APP_NAME));
          break;
      }
    }

    @Override
    public RequestEventListener onRequest(RequestEvent requestEvent) {
      return null;
    }
  }
}

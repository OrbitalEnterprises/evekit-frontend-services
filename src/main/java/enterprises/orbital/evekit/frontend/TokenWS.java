package enterprises.orbital.evekit.frontend;

import enterprises.orbital.base.OrbitalProperties;
import enterprises.orbital.evekit.ws.common.ServiceError;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import javax.json.JsonObject;
import javax.json.JsonValue;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@Path("/ws/v1/token")
@Consumes({
    "application/json"
})
@Produces({
    "application/json"
})
@Api(
    tags = {
        "Token"
},
    produces = "application/json",
    consumes = "application/json")
public class TokenWS {
  private static final Logger log = Logger.getLogger(TokenWS.class.getName());

  // Location of ESI server
  @SuppressWarnings("WeakerAccess")
  public static final String PROP_ESI_SERVER_PATH = "enterprises.orbital.evekit.accountws.esiServerPath";
  @SuppressWarnings("WeakerAccess")
  public static final String DEF_ESI_SERVER_PATH = "https://esi.tech.ccp.is/latest";

  @Path("/get_esi_scopes")
  @GET
  @ApiOperation(
      value = "Get available scopes from the ESI servers.",
      notes = "Retrieve map of available scopes from the ESI servers.")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "map retrieved successfully"),
          @ApiResponse(
              code = 500,
              message = "internal service error",
              response = ServiceError.class),
      })
  public Response getESIScopes(
      @Context HttpServletRequest request) {
    // Retrieve swagger.json from server
    JsonObject data;
    try {
      String serverPath = OrbitalProperties.getGlobalProperty(PROP_ESI_SERVER_PATH, DEF_ESI_SERVER_PATH) + "/swagger.json";
      URL               target = new URL(serverPath);
      HttpURLConnection conn;
      conn = (HttpURLConnection) target.openConnection();
      conn.setUseCaches(true);
      javax.json.JsonReader reader = javax.json.Json.createReader(new InputStreamReader(target.openStream()));
      data = reader.readObject();
      reader.close();
    } catch (IOException e) {
      log.log(Level.WARNING, "Failed to retrieve scope list", e);
      ServiceError errMsg = new ServiceError(Status.INTERNAL_SERVER_ERROR.getStatusCode(), "failed to retrieve and parse swagger.json");
      return Response.status(Status.INTERNAL_SERVER_ERROR).entity(errMsg).build();
    }
    // Extract security object and scopes
    Map<String, String> scopeMap = new HashMap<>();
    JsonObject          rawMap   = data.getJsonObject("securityDefinitions").getJsonObject("evesso").getJsonObject("scopes");
    for (Map.Entry<String, JsonValue> next : rawMap.entrySet()) {
      scopeMap.put(next.getKey(), next.getValue().toString());
    }
    // Return result
    return Response.ok().entity(scopeMap).build();
  }


}

package enterprises.orbital.evekit.frontend;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import enterprises.orbital.base.OrbitalProperties;

/**
 * API for release information.
 */
@Path("/ws/v1/release")
@Produces({
    "application/json"
})
@io.swagger.annotations.Api(
    tags = {
        "Release"
},
    produces = "application/json")
public class ReleaseWS {
  public static final String PROP_BUILD_DATE = "enterprises.orbital.evekit.frontend.build";
  public static final String PROP_VERSION    = "enterprises.orbital.evekit.frontend.version";

  @Path("/build_date")
  @GET
  @io.swagger.annotations.ApiOperation(
      value = "Return the build date of the current release")
  @io.swagger.annotations.ApiResponses(
      value = {
          @io.swagger.annotations.ApiResponse(
              code = 200,
              message = "Build date of current release",
              response = String.class)
  })
  public Response buildDate() {
    return Response.ok().entity(new Object() {
      @SuppressWarnings("unused")
      public final String buildDate = OrbitalProperties.getGlobalProperty(PROP_BUILD_DATE, "unknown");
    }).build();
  }

  @Path("/version")
  @GET
  @io.swagger.annotations.ApiOperation(
      value = "Return the version of the current release")
  @io.swagger.annotations.ApiResponses(
      value = {
          @io.swagger.annotations.ApiResponse(
              code = 200,
              message = "Version of current release",
              response = String.class)
  })
  public Response version() {
    return Response.ok().entity(new Object() {
      @SuppressWarnings("unused")
      public final String version = OrbitalProperties.getGlobalProperty(PROP_VERSION, "unknown");
    }).build();
  }

}

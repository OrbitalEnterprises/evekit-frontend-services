package enterprises.orbital.evekit.frontend;

import enterprises.orbital.base.NoPersistentPropertyException;
import enterprises.orbital.base.PersistentProperty;
import enterprises.orbital.evekit.account.EveKitUserAccount;
import enterprises.orbital.evekit.account.UserNotFoundException;
import enterprises.orbital.evekit.ws.common.ServiceError;
import enterprises.orbital.oauth.AuthUtil;
import io.swagger.annotations.*;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * API for admin features.
 */
@Path("/ws/v1/admin")
@Consumes({
    "application/json"
})
@Produces({
    "application/json"
})
@Api(
    tags = {
        "Admin"
    },
    produces = "application/json",
    consumes = "application/json")
public class AdminWS {

  @Path("/sysprop")
  @GET
  @ApiOperation(
      value = "Return list of all system properties")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "List of system properties",
              response = PersistentProperty.class,
              responseContainer = "array"),
          @ApiResponse(
              code = 401,
              message = "Requestor not logged in or not an admin",
              response = ServiceError.class),
      })
  public Response getSysProps(
      @Context HttpServletRequest request) {
    // Verify caller is an admin
    EveKitUserAccount admin = (EveKitUserAccount) AuthUtil.getCurrentUser(request);
    if (admin == null || !admin.isAdmin()) {
      ServiceError errMsg = new ServiceError(Status.UNAUTHORIZED.getStatusCode(),
                                             "Requestor not logged in or not an admin");
      return Response.status(Status.UNAUTHORIZED)
                     .entity(errMsg)
                     .build();
    }
    // Retrieve list of properties, filter out per-user properties
    final List<PersistentProperty> result = new ArrayList<>();
    for (PersistentProperty next : PersistentProperty.getAll()) {
      if (!next.getPropertyName()
               .startsWith("EveKitUserAccount.")) result.add(next);
    }
    return Response.ok()
                   .entity(result)
                   .build();
  }

  @Path("/sysprop/{key}")
  @PUT
  @ApiOperation(
      value = "Store system property")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "Property saved"),
          @ApiResponse(
              code = 401,
              message = "Requestor not logged in or not an admin",
              response = ServiceError.class),
      })
  public Response setSysProp(
      @Context HttpServletRequest request,
      @PathParam("key") @ApiParam(
          name = "key",
          required = true,
          value = "System property key") String key,
      @ApiParam(
          name = "value",
          required = true,
          value = "System property value") String value) {
    // Verify caller is an admin
    EveKitUserAccount admin = (EveKitUserAccount) AuthUtil.getCurrentUser(request);
    if (admin == null || !admin.isAdmin()) {
      ServiceError errMsg = new ServiceError(Status.UNAUTHORIZED.getStatusCode(),
                                             "Requestor not logged in or not an admin");
      return Response.status(Status.UNAUTHORIZED)
                     .entity(errMsg)
                     .build();
    }
    PersistentProperty.setProperty(key, value);
    return Response.ok()
                   .build();
  }

  @Path("/sysprop/{key}")
  @DELETE
  @ApiOperation(
      value = "Remove a system property.  Fails silently if the given property can not be found.")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "Property removed."),
          @ApiResponse(
              code = 401,
              message = "Requestor not logged in or not an admin",
              response = ServiceError.class),
      })
  public Response deleteSysProp(
      @Context HttpServletRequest request,
      @PathParam("key") @ApiParam(
          name = "key",
          required = true,
          value = "System property key") String key) {
    // Verify caller is an admin
    EveKitUserAccount admin = (EveKitUserAccount) AuthUtil.getCurrentUser(request);
    if (admin == null || !admin.isAdmin()) {
      ServiceError errMsg = new ServiceError(Status.UNAUTHORIZED.getStatusCode(),
                                             "Requestor not logged in or not an admin");
      return Response.status(Status.UNAUTHORIZED)
                     .entity(errMsg)
                     .build();
    }
    PersistentProperty.removeProperty(key);
    return Response.ok()
                   .build();
  }

  @Path("/configprop")
  @GET
  @ApiOperation(
      value = "Return list of all configuration properties")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "List of configuration properties",
              response = PersistentProperty.class,
              responseContainer = "array")
      })
  public Response getConfigProps(
      @Context HttpServletRequest request) {
    // Retrieve list of properties, filter out non-config properties
    final String keyPrefix = "EveKitConfigProp.";
    final List<PersistentProperty> result = new ArrayList<>();
    for (PersistentProperty next : PersistentProperty.getAll()) {
      if (next.getPropertyName()
              .startsWith(keyPrefix))
        // Add the property with the key prefix stripped. This hides the property naming scheme from the caller.
        result.add(new PersistentProperty(next.getPropertyName()
                                              .substring(keyPrefix.length()),
                                          next.getPropertyValue()));
    }
    return Response.ok()
                   .entity(result)
                   .build();
  }

  @Path("/configprop/{key}")
  @GET
  @ApiOperation(
      value = "Return the requested configuration property.  These properties do not require admin privileges to view.")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "Requested configuration property, or empty response if no such property exists",
              response = PersistentProperty.class)
      })
  public Response getConfigProperty(
      @Context HttpServletRequest request,
      @PathParam("key") @ApiParam(
          name = "key",
          required = true,
          value = "Property key") String key) {
    // Config properties start with the special prefix "EveKitConfigProp."
    final String keyPrefix = "EveKitConfigProp.";
    String keyName = keyPrefix + key;
    String value = PersistentProperty.getProperty(keyName, "");
    // Add the property with the key prefix stripped. This hides the property naming scheme from the caller.
    return Response.ok()
                   .entity(new PersistentProperty(key, value))
                   .build();
  }

  @SuppressWarnings("Duplicates")
  @Path("/userprop/{uid}")
  @GET
  @ApiOperation(
      value = "Return system properties for the given uid")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "List of properties for the given user",
              response = PersistentProperty.class,
              responseContainer = "array"),
          @ApiResponse(
              code = 401,
              message = "Requestor not logged in or not an admin",
              response = ServiceError.class),
          @ApiResponse(
              code = 404,
              message = "User with the given UID not found",
              response = ServiceError.class),
      })
  public Response getUserProps(
      @Context HttpServletRequest request,
      @PathParam("uid") @ApiParam(
          name = "uid",
          required = true,
          value = "UID of user for which properties will be returned") long uid) {
    // Verify caller is an admin or is the owner of uid
    EveKitUserAccount admin = (EveKitUserAccount) AuthUtil.getCurrentUser(request);
    if (admin == null || (!admin.isAdmin() && admin.getID() != uid)) {
      ServiceError errMsg = new ServiceError(Status.UNAUTHORIZED.getStatusCode(),
                                             "Requestor not logged in or not an admin");
      return Response.status(Status.UNAUTHORIZED)
                     .entity(errMsg)
                     .build();
    }
    // Find target user
    try {
      // Verify target user exists
      EveKitUserAccount.getAccount(uid);

      // Return list of properties
      final List<PersistentProperty> result = new ArrayList<>();
      final String keyPrefix = "EveKitUserAccount." + uid + ".";
      for (PersistentProperty next : PersistentProperty.getAll()) {
        if (next.getPropertyName()
                .startsWith(keyPrefix)) {
          // Add the property with the key prefix stripped. This hides the user property naming scheme from the caller.
          result.add(new PersistentProperty(next.getPropertyName()
                                                .substring(keyPrefix.length()), next.getPropertyValue()));
        }
      }
      return Response.ok()
                     .entity(result)
                     .build();
    } catch (UserNotFoundException e) {
      ServiceError errMsg = new ServiceError(Status.NOT_FOUND.getStatusCode(), "No user with given UID found");
      return Response.status(Status.NOT_FOUND)
                     .entity(errMsg)
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error retrieving user properties, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

  @SuppressWarnings("Duplicates")
  @Path("/userprop/{uid}/{key}")
  @GET
  @ApiOperation(
      value = "Return system property for the given uid")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "Requested property value.  Value is null if not found.",
              response = PersistentProperty.class),
          @ApiResponse(
              code = 401,
              message = "Requestor not logged in or not an admin",
              response = ServiceError.class),
          @ApiResponse(
              code = 404,
              message = "User with the given UID not found",
              response = ServiceError.class),
      })
  public Response getUserProp(
      @Context HttpServletRequest request,
      @PathParam("uid") @ApiParam(
          name = "uid",
          required = true,
          value = "UID of user for which property will be returned") long uid,
      @PathParam("key") @ApiParam(
          name = "key",
          required = true,
          value = "System property key") String key) {
    // Verify caller is an admin or the owner of uid
    EveKitUserAccount admin = (EveKitUserAccount) AuthUtil.getCurrentUser(request);
    if (admin == null || (!admin.isAdmin() && admin.getID() != uid)) {
      ServiceError errMsg = new ServiceError(Status.UNAUTHORIZED.getStatusCode(),
                                             "Requestor not logged in or not an admin");
      return Response.status(Status.UNAUTHORIZED)
                     .entity(errMsg)
                     .build();
    }
    // Find target user
    try {
      // Return requested property value, or null if property not found
      EveKitUserAccount target = EveKitUserAccount.getAccount(uid);
      String result = PersistentProperty.getProperty(target, key);
      return Response.ok()
                     .entity(new PersistentProperty(key, result))
                     .build();
    } catch (NoPersistentPropertyException e) {
      return Response.ok()
                     .entity(new PersistentProperty(key, null))
                     .build();
    } catch (UserNotFoundException e) {
      ServiceError errMsg = new ServiceError(Status.NOT_FOUND.getStatusCode(), "No user with given UID found");
      return Response.status(Status.NOT_FOUND)
                     .entity(errMsg)
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error retrieving user properties, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

  @SuppressWarnings("Duplicates")
  @Path("/userprop/{uid}/{key}")
  @PUT
  @ApiOperation(
      value = "Set user system property")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "System property set"),
          @ApiResponse(
              code = 401,
              message = "Requestor not logged in or not an admin",
              response = ServiceError.class),
          @ApiResponse(
              code = 404,
              message = "User with the given UID not found",
              response = ServiceError.class),
      })
  public Response setUserProp(
      @Context HttpServletRequest request,
      @PathParam("uid") @ApiParam(
          name = "uid",
          required = true,
          value = "UID of user for which a property will be set") long uid,
      @PathParam("key") @ApiParam(
          name = "key",
          required = true,
          value = "System property key") String key,
      @ApiParam(
          name = "value",
          required = true,
          value = "System property value") String value) {
    // Verify caller is an admin or owner of uid
    EveKitUserAccount admin = (EveKitUserAccount) AuthUtil.getCurrentUser(request);
    if (admin == null || (!admin.isAdmin() && admin.getID() != uid)) {
      ServiceError errMsg = new ServiceError(Status.UNAUTHORIZED.getStatusCode(),
                                             "Requestor not logged in or not an admin");
      return Response.status(Status.UNAUTHORIZED)
                     .entity(errMsg)
                     .build();
    }
    try {
      // Find target user
      EveKitUserAccount target = EveKitUserAccount.getAccount(uid);
      PersistentProperty.setProperty(target, key, value);
      return Response.ok()
                     .build();
    } catch (UserNotFoundException e) {
      ServiceError errMsg = new ServiceError(Status.NOT_FOUND.getStatusCode(), "No user with given UID found");
      return Response.status(Status.NOT_FOUND)
                     .entity(errMsg)
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error setting user properties, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

  @SuppressWarnings("Duplicates")
  @Path("/userprop/{uid}/{key}")
  @DELETE
  @ApiOperation(
      value = "Remove user property.")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "Property removed"),
          @ApiResponse(
              code = 401,
              message = "Requestor not logged in or not an admin",
              response = ServiceError.class),
          @ApiResponse(
              code = 404,
              message = "User with the given UID not found",
              response = ServiceError.class),
      })
  public Response deleteUserProp(
      @Context HttpServletRequest request,
      @PathParam("uid") @ApiParam(
          name = "uid",
          required = true,
          value = "UID of user for which a property will be deleted") long uid,
      @PathParam("key") @ApiParam(
          name = "key",
          required = true,
          value = "System property key") String key) {
    // Verify caller is an admin or owner of uid
    EveKitUserAccount admin = (EveKitUserAccount) AuthUtil.getCurrentUser(request);
    if (admin == null || (!admin.isAdmin() && admin.getID() != uid)) {
      ServiceError errMsg = new ServiceError(Status.UNAUTHORIZED.getStatusCode(),
                                             "Requestor not logged in or not an admin");
      return Response.status(Status.UNAUTHORIZED)
                     .entity(errMsg)
                     .build();
    }
    try {
      // Find target user
      EveKitUserAccount target = EveKitUserAccount.getAccount(uid);
      PersistentProperty.removeProperty(target, key);
      return Response.ok()
                     .build();
    } catch (UserNotFoundException e) {
      ServiceError errMsg = new ServiceError(Status.NOT_FOUND.getStatusCode(), "No user with given UID found");
      return Response.status(Status.NOT_FOUND)
                     .entity(errMsg)
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error deleting user property, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

  @Path("/qs_request")
  @GET
  @ApiOperation(
      value = "Request a quickstart access key selection")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "User URL and token",
              response = QuickStartResponse.class),
          @ApiResponse(
              code = 500,
              message = "Internal error creating request",
              response = ServiceError.class),
      })
  public Response startQuickStartRequest(
      @Context HttpServletRequest request,
      @QueryParam("requestor") @ApiParam(
          name = "requestor",
          required = true,
          value = "Access key requestor")
          String requestor) {

    // Start a new quickstart access key request
    try {
      QuickStartRequest req = QuickStartRequest.makeSelectionRequest(requestor);
      return Response.status(Status.OK)
                     .entity(req.asResponse())
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error creating quickstart request, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

  @Path("/qs_get_requestor/{sid}")
  @GET
  @ApiOperation(
      value = "Get the name of the requestor for a given qs request ID.")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "the name of the requestor",
              response = QuickStartRequestor.class),
          @ApiResponse(
              code = 404,
              message = "No request was found with the given ID.  Request may have already expired.",
              response = ServiceError.class),
          @ApiResponse(
              code = 500,
              message = "Internal error retrieving requestor",
              response = ServiceError.class),
      })
  public Response quickStartSelectionRequestor(
      @Context HttpServletRequest request,
      @PathParam("sid") @ApiParam(
          name = "sid",
          required = true,
          value = "Quickstart request ID")
          long sid) {

    // Store access key selection
    try {
      return Response.status(Status.OK)
                     .entity(new QuickStartRequestor(sid, QuickStartRequest.requestor(sid)))
                     .build();
    } catch (UnknownQuickStartRequestException e) {
      ServiceError errMsg = new ServiceError(
          Status.NOT_FOUND.getStatusCode(),
          "No quickstart request was found with the given ID.  The request may have expired.");
      return Response.status(Status.NOT_FOUND)
                     .entity(errMsg)
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error retrieving requestor, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

  @Path("/qs_store_selection/{sid}")
  @PUT
  @ApiOperation(
      value = "Request a quickstart access key selection")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "selection stored"),
          @ApiResponse(
              code = 404,
              message = "No request was found with the given ID.  Request may have already expired.",
              response = ServiceError.class),
          @ApiResponse(
              code = 500,
              message = "Internal error storing results",
              response = ServiceError.class),
      })
  public Response storeQuickStartSelection(
      @Context HttpServletRequest request,
      @PathParam("sid") @ApiParam(
          name = "sid",
          required = true,
          value = "Quickstart request ID")
      long sid,
      @QueryParam("accessKey")
      @ApiParam(
          name = "accessKey",
          required = true,
          value = "Selected access key ID")
      long accessKey,
      @QueryParam("accessHash")
      @ApiParam(
          name = "accessHash",
          required = true,
          value = "Selected access key hash")
      String accessHash) {

    // Store access key selection
    try {
      QuickStartRequest.recordCredentials(sid, accessKey, accessHash);
      return Response.status(Status.OK)
                     .build();
    } catch (UnknownQuickStartRequestException e) {
      ServiceError errMsg = new ServiceError(
          Status.NOT_FOUND.getStatusCode(),
          "No quickstart request was found with the given ID.  The request may have expired.");
      return Response.status(Status.NOT_FOUND)
                     .entity(errMsg)
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error storing access key selection, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

  @Path("/qs_retrieve_selection/{token}")
  @GET
  @ApiOperation(
      value = "Retrieve a quickstart access key selection")
  @ApiResponses(
      value = {
          @ApiResponse(
              code = 200,
              message = "Selection results (status may indicate pending).",
              response = QuickStartSelection.class),
          @ApiResponse(
              code = 404,
              message = "No request was found with the given ID.  Request may have already expired.",
              response = ServiceError.class),
          @ApiResponse(
              code = 500,
              message = "Internal error storing results",
              response = ServiceError.class),
      })
  public Response retrieveQuickStartSelection(
      @Context HttpServletRequest request,
      @PathParam("token") @ApiParam(
          name = "token",
          required = true,
          value = "Quickstart retrieval token")
          String token) {

    // Store access key selection
    try {
      return Response.status(Status.OK)
                     .entity(QuickStartRequest.getByToken(token).asSelection())
                     .build();
    } catch (UnknownQuickStartRequestException e) {
      ServiceError errMsg = new ServiceError(
          Status.BAD_REQUEST.getStatusCode(),
          "No quickstart request was found with the given token.  The request may have expired.");
      return Response.status(Status.BAD_REQUEST)
                     .entity(errMsg)
                     .build();
    } catch (IOException e) {
      ServiceError errMsg = new ServiceError(
          Status.INTERNAL_SERVER_ERROR.getStatusCode(),
          "Error retrieving access key selection, contact admin if this problem persists");
      return Response.status(Status.INTERNAL_SERVER_ERROR)
                     .entity(errMsg)
                     .build();
    }
  }

}

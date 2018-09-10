package enterprises.orbital.evekit.frontend;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * Response to a quickstart selection request.  The third party requestor should
 * route the user to the specified URL.  The token can be used to request the user's
 * selected credentials.
 */
@ApiModel(
    description = "Quickstart selection request response")
public class QuickStartResponse {
  @ApiModelProperty(
      value = "Token for retrieving selection results")
  @JsonProperty("token")
  private final String token;

  @ApiModelProperty(
      value = "User redirect URL")
  @JsonProperty("url")
  private final String url;

  public QuickStartResponse(String token, String url) {
    this.token = token;
    this.url = url;
  }

  public String getToken() {
    return token;
  }

  public String getUrl() {
    return url;
  }
}

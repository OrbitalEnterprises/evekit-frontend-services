package enterprises.orbital.evekit.frontend;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * Name of a quickstart requestor associated with a given request ID.
 */
@ApiModel(
    description = "Quickstart selection requestor")
public class QuickStartRequestor {
  @ApiModelProperty(
      value = "Selection ID")
  @JsonProperty("sid")
  private final long sid;

  @ApiModelProperty(
      value = "Requestor name")
  @JsonProperty("requestor")
  private final String requestor;

  public QuickStartRequestor(long sid, String requestor) {
    this.sid = sid;
    this.requestor = requestor;
  }

  public long getSid() {
    return sid;
  }

  public String getRequestor() {
    return requestor;
  }
}

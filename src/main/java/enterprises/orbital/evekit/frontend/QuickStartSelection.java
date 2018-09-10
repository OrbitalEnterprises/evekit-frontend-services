package enterprises.orbital.evekit.frontend;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * Results of a quickstart selection.
 */
@ApiModel(
    description = "Quickstart selection results")
public class QuickStartSelection {
  @ApiModelProperty(
      value = "Token used to retrieve results")
  @JsonProperty("token")
  private final String token;

  @ApiModelProperty(
      value = "If true, then results are not final yet.  Otherwise, results are final.")
  @JsonProperty("pending")
  private final boolean pending;

  @ApiModelProperty(
      value = "Access key ID of access key chosen for this selection")
  @JsonProperty("accessKeyID")
  private final long accessKeyID;

  @ApiModelProperty(
      value = "Access hash of access key chosen for this selection")
  @JsonProperty("accessHash")
  private final String accessHash;

  public QuickStartSelection(String token, boolean pending, long accessKeyID, String accessHash) {
    this.token = token;
    this.pending = pending;
    this.accessKeyID = accessKeyID;
    this.accessHash = accessHash;
  }

  public String getToken() {
    return token;
  }

  public boolean isPending() {
    return pending;
  }

  public long getAccessKeyID() {
    return accessKeyID;
  }

  public String getAccessHash() {
    return accessHash;
  }
}

package enterprises.orbital.evekit;

import com.google.gson.Gson;

import java.awt.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.concurrent.TimeUnit;

/**
 * This simple tool demonstrates using EveKit's quickstart functionality
 * to retrieve credentials for a synchronized account.
 */
public class QuickstartSample {
  private static final String quickstartRequestURL = "https://evekit.orbital.enterprises/api//ws/v1/admin/qs_request";
  private static final String quickstartRetrieveURL = "https://evekit.orbital.enterprises/api//ws/v1/admin/qs_retrieve_selection/";
  private static final long SELECTION_WAIT_TIMEOUT = TimeUnit.MILLISECONDS.convert(5, TimeUnit.MINUTES);

  static class QuickstartRequest {
    String token;
    String url;
  }

  static class QuickstartResult {
    String token;
    boolean pending;
    int accessKeyID;
    String accessHash;
  }

  public static void main(String[] argv) throws Exception {
    // 1. Request a quickstart token and URL
    String requestorName = "quickstart demo";
    URL request = new URL(quickstartRequestURL + "?requestor=" + URLEncoder.encode(requestorName, "UTF-8"));
    URLConnection reqConn = request.openConnection();
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(reqConn.getInputStream()));
    StringBuilder response = new StringBuilder();

    String line;
    while ((line = bufferedReader.readLine()) != null) {
      response.append(line);
    }
    bufferedReader.close();

    Gson gson = new Gson();
    QuickstartRequest responseObject = gson.fromJson(response.toString(), QuickstartRequest.class);
    System.out.println("Request token: " + responseObject.token);
    System.out.println("Request url: " + responseObject.url);

    // 2. Open a browser to the specified URL
    if (Desktop.isDesktopSupported()) {
      System.out.println("Opening browser to initiate quickstart.");
      Desktop.getDesktop().browse(new URI(responseObject.url));
    } else {
      System.out.println("Opening browser not supported, please copy the URL above into a browser window.");
    }

    // 3. Wait for the user to complete their selection, or we timeout.
    System.out.println("Waiting for user to finish quickstart selection.");
    request = new URL(quickstartRetrieveURL + responseObject.token);
    long startTime = System.currentTimeMillis();
    long now = System.currentTimeMillis();
    while (now - startTime < SELECTION_WAIT_TIMEOUT) {
      System.out.println("Checking for quickstart finish");
      reqConn = request.openConnection();
      bufferedReader = new BufferedReader(new InputStreamReader(reqConn.getInputStream()));
      response = new StringBuilder();
      while ((line = bufferedReader.readLine()) != null) {
        response.append(line);
      }
      bufferedReader.close();
      QuickstartResult resultObject = gson.fromJson(response.toString(), QuickstartResult.class);

      if (!resultObject.pending) {
        System.out.println("Selection complete!");
        System.out.println("Selected key ID: " + resultObject.accessKeyID);
        System.out.println("Selected key hash: " + resultObject.accessHash);
        System.exit(0);
      }
      System.out.println("No selection yet, waiting");
      Thread.sleep(10000L);
    }

  }
}

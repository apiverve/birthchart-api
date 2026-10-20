import com.apiverve.birthchart.BirthChartAPIClient;
import com.apiverve.birthchart.APIResponse;
import com.apiverve.birthchart.APIException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class BasicExample {
    public static void main(String[] args) {
        // Initialize the API client with your API key
        BirthChartAPIClient client = new BirthChartAPIClient("YOUR_API_KEY_HERE");

        try {
            // Query parameters
            Map&lt;String, Object&gt; parameters &#x3D; new HashMap&lt;&gt;();
        parameters.put(&quot;date&quot;, &quot;1990-06-15&quot;);
        parameters.put(&quot;time&quot;, &quot;14:30&quot;);
        parameters.put(&quot;lat&quot;, 40.7128);
        parameters.put(&quot;lon&quot;, -74.006);
        parameters.put(&quot;timezone&quot;, &quot;America/New_York&quot;);
        parameters.put(&quot;houseSystem&quot;, &quot;placidus&quot;);

            // Execute the API request
            APIResponse response = client.execute(parameters);

            // Check if the request was successful
            if (response.isSuccess()) {
                System.out.println("✅ Success!");

                // Get the response data
                JSONObject data = response.getData();
                if (data != null) {
                    System.out.println("Response data:");
                    System.out.println(data.toString(2)); // Pretty print with 2-space indent
                }

                // Or get specific fields from the data
                // String value = data.optString("fieldName");

            } else {
                // Handle API errors
                System.err.println("❌ API Error: " + response.getError());
                System.err.println("Status: " + response.getStatus());
                System.err.println("Code: " + response.getCode());
            }

        } catch (APIException e) {
            // Handle exceptions
            System.err.println("❌ Error: " + e.getMessage());

            // Handle specific error types
            if (e.isAuthenticationError()) {
                System.err.println("Invalid API key. Get your key at: https://apiverve.com");
            } else if (e.isRateLimitError()) {
                System.err.println("Rate limit exceeded. Please try again later.");
            } else if (e.isServerError()) {
                System.err.println("Server error (5xx). Please try again later.");
            } else if (e.isClientError()) {
                System.err.println("Client error (4xx). Check your request parameters.");
            }

            // Get HTTP status code if available
            if (e.getStatusCode() > 0) {
                System.err.println("HTTP Status Code: " + e.getStatusCode());
            }
        }
    }
}

/**
 * Birth Chart API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Birth Chart API.
 * API Documentation: https://docs.apiverve.com/ref/birthchart
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/birthchart';

/**
 * Make a GET request to the Birth Chart API
 */
async function callBirthChartAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            date: &#x27;1990-06-15&#x27;,
            time: &#x27;14:30&#x27;,
            lat: 40.7128,
            lon: -74.006,
            timezone: &#x27;America/New_York&#x27;,
            houseSystem: &#x27;placidus&#x27;
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callBirthChartAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });

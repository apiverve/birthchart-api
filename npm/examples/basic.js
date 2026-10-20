/**
 * Basic Example - Birth Chart API
 *
 * This example demonstrates how to use the Birth Chart API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const birthchartAPI = require('../index.js');

// Initialize the API client
const api = new birthchartAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  date: "1990-06-15",
  time: "14:30",
  lat: 40.7128,
  lon: -74.006,
  timezone: "America/New_York",
  houseSystem: "placidus"
};

// Make the API request using callback
console.log('Making request to Birth Chart API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});

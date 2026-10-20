Birth Chart API
============

Birth Chart calculates a tropical natal chart from a birth date, time and location. It returns the sun, moon and rising signs, the ascendant and midheaven, and each planet's sign, degree and retrograde flag. Paid plans add the 12 house cusps, each planet's house, the major aspects and the element and modality balance.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.BirthChart.svg)](https://www.nuget.org/packages/APIVerve.API.BirthChart)

This is a .NET wrapper for the [Birth Chart API](https://apiverve.com/marketplace/birthchart?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.BirthChart
```

Using the Package Manager:
```
nuget install APIVerve.API.BirthChart
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.BirthChart
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.BirthChart"
5. Click on the APIVerve.API.BirthChart package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Birth Chart API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.BirthChart;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BirthChartQueryOptions {
            Date = "1990-06-15",
            Time = "14:30",
            Lat = 40.7128,
            Lon = -74.006,
            Timezone = "America/New_York",
            HouseSystem = "placidus"
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Birth Chart API documentation is found here: [https://docs.apiverve.com/ref/birthchart](https://docs.apiverve.com/ref/birthchart?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Birth Chart API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.BirthChart;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BirthChartQueryOptions {
            Date = "1990-06-15",
            Time = "14:30",
            Lat = 40.7128,
            Lon = -74.006,
            Timezone = "America/New_York",
            HouseSystem = "placidus"
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.BirthChart;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BirthChartQueryOptions {
            Date = "1990-06-15",
            Time = "14:30",
            Lat = 40.7128,
            Lon = -74.006,
            Timezone = "America/New_York",
            HouseSystem = "placidus"
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.BirthChart;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BirthChartQueryOptions {
            Date = "1990-06-15",
            Time = "14:30",
            Lat = 40.7128,
            Lon = -74.006,
            Timezone = "America/New_York",
            HouseSystem = "placidus"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.BirthChart;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new BirthChartQueryOptions {
            Date = "1990-06-15",
            Time = "14:30",
            Lat = 40.7128,
            Lon = -74.006,
            Timezone = "America/New_York",
            HouseSystem = "placidus"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new BirthChartQueryOptions {
    Date = "1990-06-15",
    Time = "14:30",
    Lat = 40.7128,
    Lon = -74.006,
    Timezone = "America/New_York",
    HouseSystem = "placidus"
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new BirthChartQueryOptions {
    Date = "1990-06-15",
    Time = "14:30",
    Lat = 40.7128,
    Lon = -74.006,
    Timezone = "America/New_York",
    HouseSystem = "placidus"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new BirthChartQueryOptions {
    Date = "1990-06-15",
    Time = "14:30",
    Lat = 40.7128,
    Lon = -74.006,
    Timezone = "America/New_York",
    HouseSystem = "placidus"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new BirthChartQueryOptions {
    Date = "1990-06-15",
    Time = "14:30",
    Lat = 40.7128,
    Lon = -74.006,
    Timezone = "America/New_York",
    HouseSystem = "placidus"
};

using (var apiClient = new BirthChartAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "birth": {
      "localTime": "1990-06-15T14:30",
      "utcTime": "1990-06-15T18:30:00Z",
      "timezone": "America/New_York",
      "utcOffset": "-04:00",
      "offsetSource": "location",
      "latitude": 40.7128,
      "longitude": -74.006
    },
    "houseSystem": "placidus",
    "sunSign": "Gemini",
    "moonSign": "Pisces",
    "risingSign": "Libra",
    "ascendant": {
      "sign": "Libra",
      "degree": 13.7,
      "longitude": 193.6954,
      "formatted": "13°42' Libra"
    },
    "midheaven": {
      "sign": "Cancer",
      "degree": 15.92,
      "longitude": 105.9221,
      "formatted": "15°55' Cancer"
    },
    "planets": [
      {
        "name": "Sun",
        "sign": "Gemini",
        "degree": 24.39,
        "longitude": 84.3882,
        "formatted": "24°23' Gemini",
        "house": 9,
        "retrograde": false,
        "speed": 0.9551
      },
      {
        "name": "Moon",
        "sign": "Pisces",
        "degree": 18.99,
        "longitude": 348.9903,
        "formatted": "18°59' Pisces",
        "house": 6,
        "retrograde": false,
        "speed": 13.4613
      },
      {
        "name": "Mercury",
        "sign": "Gemini",
        "degree": 6.16,
        "longitude": 66.1572,
        "formatted": "6°09' Gemini",
        "house": 8,
        "retrograde": false,
        "speed": 1.7285
      },
      {
        "name": "Venus",
        "sign": "Taurus",
        "degree": 19.1,
        "longitude": 49.0959,
        "formatted": "19°06' Taurus",
        "house": 8,
        "retrograde": false,
        "speed": 1.1763
      },
      {
        "name": "Mars",
        "sign": "Aries",
        "degree": 11.24,
        "longitude": 11.2357,
        "formatted": "11°14' Aries",
        "house": 6,
        "retrograde": false,
        "speed": 0.7186
      },
      {
        "name": "Jupiter",
        "sign": "Cancer",
        "degree": 15.95,
        "longitude": 105.9482,
        "formatted": "15°57' Cancer",
        "house": 10,
        "retrograde": false,
        "speed": 0.2168
      },
      {
        "name": "Saturn",
        "sign": "Capricorn",
        "degree": 24.02,
        "longitude": 294.016,
        "formatted": "24°01' Capricorn",
        "house": 4,
        "retrograde": true,
        "speed": -0.0589
      },
      {
        "name": "Uranus",
        "sign": "Capricorn",
        "degree": 8.15,
        "longitude": 278.1534,
        "formatted": "8°09' Capricorn",
        "house": 3,
        "retrograde": true,
        "speed": -0.039
      },
      {
        "name": "Neptune",
        "sign": "Capricorn",
        "degree": 13.71,
        "longitude": 283.7101,
        "formatted": "13°43' Capricorn",
        "house": 3,
        "retrograde": true,
        "speed": -0.0251
      },
      {
        "name": "Pluto",
        "sign": "Scorpio",
        "degree": 15.4,
        "longitude": 225.3967,
        "formatted": "15°24' Scorpio",
        "house": 2,
        "retrograde": true,
        "speed": -0.0201
      },
      {
        "name": "North Node",
        "sign": "Aquarius",
        "degree": 9.68,
        "longitude": 309.68,
        "formatted": "9°41' Aquarius",
        "house": 4,
        "retrograde": true,
        "speed": -0.053
      }
    ],
    "houses": [
      {
        "house": 1,
        "sign": "Libra",
        "degree": 13.7,
        "longitude": 193.6954,
        "formatted": "13°42' Libra"
      },
      {
        "house": 2,
        "sign": "Scorpio",
        "degree": 10.77,
        "longitude": 220.7713,
        "formatted": "10°46' Scorpio"
      },
      {
        "house": 3,
        "sign": "Sagittarius",
        "degree": 11.92,
        "longitude": 251.9193,
        "formatted": "11°55' Sagittarius"
      },
      {
        "house": 4,
        "sign": "Capricorn",
        "degree": 15.92,
        "longitude": 285.9221,
        "formatted": "15°55' Capricorn"
      },
      {
        "house": 5,
        "sign": "Aquarius",
        "degree": 19.31,
        "longitude": 319.3054,
        "formatted": "19°18' Aquarius"
      },
      {
        "house": 6,
        "sign": "Pisces",
        "degree": 18.9,
        "longitude": 348.9027,
        "formatted": "18°54' Pisces"
      },
      {
        "house": 7,
        "sign": "Aries",
        "degree": 13.7,
        "longitude": 13.6954,
        "formatted": "13°42' Aries"
      },
      {
        "house": 8,
        "sign": "Taurus",
        "degree": 10.77,
        "longitude": 40.7713,
        "formatted": "10°46' Taurus"
      },
      {
        "house": 9,
        "sign": "Gemini",
        "degree": 11.92,
        "longitude": 71.9193,
        "formatted": "11°55' Gemini"
      },
      {
        "house": 10,
        "sign": "Cancer",
        "degree": 15.92,
        "longitude": 105.9221,
        "formatted": "15°55' Cancer"
      },
      {
        "house": 11,
        "sign": "Leo",
        "degree": 19.31,
        "longitude": 139.3054,
        "formatted": "19°18' Leo"
      },
      {
        "house": 12,
        "sign": "Virgo",
        "degree": 18.9,
        "longitude": 168.9027,
        "formatted": "18°54' Virgo"
      }
    ],
    "aspects": [
      {
        "planet1": "Moon",
        "planet2": "Venus",
        "aspect": "sextile",
        "angle": 60,
        "orb": 0.11,
        "applying": true
      },
      {
        "planet1": "Jupiter",
        "planet2": "Pluto",
        "aspect": "trine",
        "angle": 120,
        "orb": 0.55,
        "applying": false
      },
      {
        "planet1": "Mars",
        "planet2": "North Node",
        "aspect": "sextile",
        "angle": 60,
        "orb": 1.56,
        "applying": false
      },
      {
        "planet1": "Neptune",
        "planet2": "Pluto",
        "aspect": "sextile",
        "angle": 60,
        "orb": 1.69,
        "applying": false
      },
      {
        "planet1": "Jupiter",
        "planet2": "Neptune",
        "aspect": "opposition",
        "angle": 180,
        "orb": 2.24,
        "applying": false
      },
      {
        "planet1": "Mars",
        "planet2": "Neptune",
        "aspect": "square",
        "angle": 90,
        "orb": 2.47,
        "applying": true
      },
      {
        "planet1": "Moon",
        "planet2": "Jupiter",
        "aspect": "trine",
        "angle": 120,
        "orb": 3.04,
        "applying": false
      },
      {
        "planet1": "Mars",
        "planet2": "Uranus",
        "aspect": "square",
        "angle": 90,
        "orb": 3.08,
        "applying": false
      },
      {
        "planet1": "Venus",
        "planet2": "Jupiter",
        "aspect": "sextile",
        "angle": 60,
        "orb": 3.15,
        "applying": false
      },
      {
        "planet1": "Mercury",
        "planet2": "North Node",
        "aspect": "trine",
        "angle": 120,
        "orb": 3.52,
        "applying": true
      },
      {
        "planet1": "Moon",
        "planet2": "Pluto",
        "aspect": "trine",
        "angle": 120,
        "orb": 3.59,
        "applying": false
      },
      {
        "planet1": "Venus",
        "planet2": "Pluto",
        "aspect": "opposition",
        "angle": 180,
        "orb": 3.7,
        "applying": false
      },
      {
        "planet1": "Mars",
        "planet2": "Jupiter",
        "aspect": "square",
        "angle": 90,
        "orb": 4.71,
        "applying": true
      },
      {
        "planet1": "Venus",
        "planet2": "Saturn",
        "aspect": "trine",
        "angle": 120,
        "orb": 4.92,
        "applying": true
      },
      {
        "planet1": "Moon",
        "planet2": "Saturn",
        "aspect": "sextile",
        "angle": 60,
        "orb": 5.03,
        "applying": true
      },
      {
        "planet1": "Mercury",
        "planet2": "Mars",
        "aspect": "sextile",
        "angle": 60,
        "orb": 5.08,
        "applying": true
      },
      {
        "planet1": "Moon",
        "planet2": "Neptune",
        "aspect": "sextile",
        "angle": 60,
        "orb": 5.28,
        "applying": false
      },
      {
        "planet1": "Venus",
        "planet2": "Neptune",
        "aspect": "trine",
        "angle": 120,
        "orb": 5.39,
        "applying": false
      },
      {
        "planet1": "Sun",
        "planet2": "Moon",
        "aspect": "square",
        "angle": 90,
        "orb": 5.4,
        "applying": true
      },
      {
        "planet1": "Uranus",
        "planet2": "Neptune",
        "aspect": "conjunction",
        "angle": 0,
        "orb": 5.56,
        "applying": false
      },
      {
        "planet1": "Pluto",
        "planet2": "North Node",
        "aspect": "square",
        "angle": 90,
        "orb": 5.72,
        "applying": false
      },
      {
        "planet1": "Jupiter",
        "planet2": "Uranus",
        "aspect": "opposition",
        "angle": 180,
        "orb": 7.79,
        "applying": false
      }
    ],
    "elements": {
      "fire": 1,
      "earth": 4,
      "air": 2,
      "water": 3
    },
    "modalities": {
      "cardinal": 5,
      "fixed": 2,
      "mutable": 3
    }
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

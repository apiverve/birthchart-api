# Birth Chart API - PHP Package

Birth Chart calculates a tropical natal chart from a birth date, time and location. It returns the sun, moon and rising signs, the ascendant and midheaven, and each planet's sign, degree and retrograde flag. Paid plans add the 12 house cusps, each planet's house, the major aspects and the element and modality balance.

## Installation

Install via Composer:

```bash
composer require apiverve/birthchart
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Birthchart\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'date' => '1990-06-15',
    'time' => '14:30',
    'lat' => 40.7128,
    'lon' => -74.006,
    'timezone' => 'America/New_York',
    'houseSystem' => 'placidus'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Birthchart\Client;
use APIVerve\Birthchart\Exceptions\APIException;
use APIVerve\Birthchart\Exceptions\ValidationException;

try {
    $response = $client->execute(['date' => '1990-06-15', 'time' => '14:30', 'lat' => 40.7128, 'lon' => -74.006, 'timezone' => 'America/New_York', 'houseSystem' => 'placidus']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/birthchart?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/birthchart?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/birthchart?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).

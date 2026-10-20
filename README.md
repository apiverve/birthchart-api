# [Birth Chart API](https://apiverve.com/marketplace/birthchart?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Birth Chart calculates a tropical natal chart from a birth date, time and location. It returns the sun, moon and rising signs, the ascendant and midheaven, and each planet&#x27;s sign, degree and retrograde flag. Paid plans add the 12 house cusps, each planet&#x27;s house, the major aspects and the element and modality balance.

The Birth Chart API provides a simple, reliable way to integrate birth chart functionality into your applications. Built for developers who need production-ready birth chart capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/birthchart?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/birthchart?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/birthchart)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.BirthChart)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-birthchart/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_birthchart)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/birthchart)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_birthchart)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callBirthChartAPI() {
    try {
        const params = new URLSearchParams({
            date: '1990-06-15',
            time: '14:30',
            lat: 40.7128,
            lon: -74.006,
            timezone: 'America/New_York',
            houseSystem: 'placidus'
        });

        const response = await fetch(`https://api.apiverve.com/v1/birthchart?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callBirthChartAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/birthchart?date=1990-06-15&time=14%3A30&lat=40.7128&lon=-74.006&timezone=America%2FNew_York&houseSystem=placidus" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/birthchart
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/birthchart) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.BirthChart
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.BirthChart) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-birthchart
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-birthchart/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_birthchart
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_birthchart) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/birthchart
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/birthchart) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_birthchart
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_birthchart) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:birthchart-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/birthchart-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Birth Chart API](https://apiverve.com/marketplace/birthchart?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/birthchart](https://docs.apiverve.com/ref/birthchart)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Birth Chart API is commonly used for:

- **Web Applications** - Add birth chart features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with birth chart capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Birth Chart API:

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

## Support & Community

- 🏠 **API Home**: [Birth Chart API](https://apiverve.com/marketplace/birthchart?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.

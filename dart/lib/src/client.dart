import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class BirthchartValidationException implements Exception {
  final List<String> errors;

  BirthchartValidationException(this.errors);

  @override
  String toString() => 'BirthchartValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Birth Chart API client.
///
/// For more information, visit: https://apiverve.com/marketplace/birthchart?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [date] (required) - The birth date (YYYY-MM-DD or MM-DD-YYYY), between 1700 and 2200
/// * [time] (required) - The local birth time in 24-hour HH:mm format
/// * [lat] (required) - The latitude of the birthplace [min: -90, max: 90]
/// * [lon] (required) - The longitude of the birthplace (east positive) [min: -180, max: 180]
/// * [timezone] - An IANA timezone name (America/New_York) or a UTC offset (+05:30). Looked up from the coordinates when omitted [format: timezone]
/// * [houseSystem] - The house system to use
class BirthchartClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'date': ValidationRule(type: 'string', required: true),
    'time': ValidationRule(type: 'string', required: true),
    'lat': ValidationRule(type: 'number', required: true, min: -90, max: 90),
    'lon': ValidationRule(type: 'number', required: true, min: -180, max: 180),
    'timezone': ValidationRule(type: 'string', required: false, format: 'timezone'),
    'houseSystem': ValidationRule(type: 'string', required: false),
  };

  BirthchartClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/birthchart',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [BirthchartValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw BirthchartValidationException(errors);
    }
  }

  /// Execute a request to the Birth Chart API.
  ///
  /// Parameters are validated before sending the request.
  Future<BirthchartResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw BirthchartException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return BirthchartResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw BirthchartException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw BirthchartException('Resource not found');
      } else {
        throw BirthchartException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is BirthchartException) rethrow;
      throw BirthchartException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Birth Chart API client.
class BirthchartException implements Exception {
  final String message;

  BirthchartException(this.message);

  @override
  String toString() => 'BirthchartException: $message';
}

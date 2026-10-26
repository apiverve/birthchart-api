/// Response models for the Birth Chart API.

/// API Response wrapper.
class BirthchartResponse {
  final String status;
  final dynamic error;
  final BirthchartData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  BirthchartResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory BirthchartResponse.fromJson(Map<String, dynamic> json) => BirthchartResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? BirthchartData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Birth Chart API.

class BirthchartData {
  BirthchartDataBirth? birth;
  String? houseSystem;
  String? sunSign;
  String? moonSign;
  String? risingSign;
  BirthchartDataAscendant? ascendant;
  BirthchartDataMidheaven? midheaven;
  List<BirthchartDataPlanetsItem>? planets;
  List<BirthchartDataHousesItem>? houses;
  List<BirthchartDataAspectsItem>? aspects;
  BirthchartDataElements? elements;
  BirthchartDataModalities? modalities;

  BirthchartData({
    this.birth,
    this.houseSystem,
    this.sunSign,
    this.moonSign,
    this.risingSign,
    this.ascendant,
    this.midheaven,
    this.planets,
    this.houses,
    this.aspects,
    this.elements,
    this.modalities,
  });

  factory BirthchartData.fromJson(Map<String, dynamic> json) => BirthchartData(
      birth: json['birth'] != null ? BirthchartDataBirth.fromJson(json['birth']) : null,
      houseSystem: json['houseSystem'],
      sunSign: json['sunSign'],
      moonSign: json['moonSign'],
      risingSign: json['risingSign'],
      ascendant: json['ascendant'] != null ? BirthchartDataAscendant.fromJson(json['ascendant']) : null,
      midheaven: json['midheaven'] != null ? BirthchartDataMidheaven.fromJson(json['midheaven']) : null,
      planets: (json['planets'] as List?)?.map((e) => BirthchartDataPlanetsItem.fromJson(e)).toList(),
      houses: (json['houses'] as List?)?.map((e) => BirthchartDataHousesItem.fromJson(e)).toList(),
      aspects: (json['aspects'] as List?)?.map((e) => BirthchartDataAspectsItem.fromJson(e)).toList(),
      elements: json['elements'] != null ? BirthchartDataElements.fromJson(json['elements']) : null,
      modalities: json['modalities'] != null ? BirthchartDataModalities.fromJson(json['modalities']) : null,
    );
}

class BirthchartDataBirth {
  String? localTime;
  String? utcTime;
  String? timezone;
  String? utcOffset;
  String? offsetSource;
  num? latitude;
  num? longitude;

  BirthchartDataBirth({
    this.localTime,
    this.utcTime,
    this.timezone,
    this.utcOffset,
    this.offsetSource,
    this.latitude,
    this.longitude,
  });

  factory BirthchartDataBirth.fromJson(Map<String, dynamic> json) => BirthchartDataBirth(
      localTime: json['localTime'],
      utcTime: json['utcTime'],
      timezone: json['timezone'],
      utcOffset: json['utcOffset'],
      offsetSource: json['offsetSource'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
}

class BirthchartDataAscendant {
  String? sign;
  num? degree;
  num? longitude;
  String? formatted;

  BirthchartDataAscendant({
    this.sign,
    this.degree,
    this.longitude,
    this.formatted,
  });

  factory BirthchartDataAscendant.fromJson(Map<String, dynamic> json) => BirthchartDataAscendant(
      sign: json['sign'],
      degree: json['degree'],
      longitude: json['longitude'],
      formatted: json['formatted'],
    );
}

class BirthchartDataMidheaven {
  String? sign;
  num? degree;
  num? longitude;
  String? formatted;

  BirthchartDataMidheaven({
    this.sign,
    this.degree,
    this.longitude,
    this.formatted,
  });

  factory BirthchartDataMidheaven.fromJson(Map<String, dynamic> json) => BirthchartDataMidheaven(
      sign: json['sign'],
      degree: json['degree'],
      longitude: json['longitude'],
      formatted: json['formatted'],
    );
}

class BirthchartDataPlanetsItem {
  String? name;
  String? sign;
  num? degree;
  num? longitude;
  String? formatted;
  num? house;
  bool? retrograde;
  num? speed;

  BirthchartDataPlanetsItem({
    this.name,
    this.sign,
    this.degree,
    this.longitude,
    this.formatted,
    this.house,
    this.retrograde,
    this.speed,
  });

  factory BirthchartDataPlanetsItem.fromJson(Map<String, dynamic> json) => BirthchartDataPlanetsItem(
      name: json['name'],
      sign: json['sign'],
      degree: json['degree'],
      longitude: json['longitude'],
      formatted: json['formatted'],
      house: json['house'],
      retrograde: json['retrograde'],
      speed: json['speed'],
    );
}

class BirthchartDataHousesItem {
  num? house;
  String? sign;
  num? degree;
  num? longitude;
  String? formatted;

  BirthchartDataHousesItem({
    this.house,
    this.sign,
    this.degree,
    this.longitude,
    this.formatted,
  });

  factory BirthchartDataHousesItem.fromJson(Map<String, dynamic> json) => BirthchartDataHousesItem(
      house: json['house'],
      sign: json['sign'],
      degree: json['degree'],
      longitude: json['longitude'],
      formatted: json['formatted'],
    );
}

class BirthchartDataAspectsItem {
  String? planet1;
  String? planet2;
  String? aspect;
  num? angle;
  num? orb;
  bool? applying;

  BirthchartDataAspectsItem({
    this.planet1,
    this.planet2,
    this.aspect,
    this.angle,
    this.orb,
    this.applying,
  });

  factory BirthchartDataAspectsItem.fromJson(Map<String, dynamic> json) => BirthchartDataAspectsItem(
      planet1: json['planet1'],
      planet2: json['planet2'],
      aspect: json['aspect'],
      angle: json['angle'],
      orb: json['orb'],
      applying: json['applying'],
    );
}

class BirthchartDataElements {
  num? fire;
  num? earth;
  num? air;
  num? water;

  BirthchartDataElements({
    this.fire,
    this.earth,
    this.air,
    this.water,
  });

  factory BirthchartDataElements.fromJson(Map<String, dynamic> json) => BirthchartDataElements(
      fire: json['fire'],
      earth: json['earth'],
      air: json['air'],
      water: json['water'],
    );
}

class BirthchartDataModalities {
  num? cardinal;
  num? fixed;
  num? mutable;

  BirthchartDataModalities({
    this.cardinal,
    this.fixed,
    this.mutable,
  });

  factory BirthchartDataModalities.fromJson(Map<String, dynamic> json) => BirthchartDataModalities(
      cardinal: json['cardinal'],
      fixed: json['fixed'],
      mutable: json['mutable'],
    );
}

class BirthchartRequest {
  String date;
  String time;
  double lat;
  double lon;
  String? timezone;
  String? houseSystem;

  BirthchartRequest({
    required this.date,
    required this.time,
    required this.lat,
    required this.lon,
    this.timezone,
    this.houseSystem,
  });

  Map<String, dynamic> toJson() => {
      'date': date,
      'time': time,
      'lat': lat,
      'lon': lon,
      if (timezone != null) 'timezone': timezone,
      if (houseSystem != null) 'houseSystem': houseSystem,
    };
}

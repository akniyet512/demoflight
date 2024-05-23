import 'package:demoflight/entities/location.dart';

class Airport {
  final String cityName;
  final String airportCode;
  final AirportAddress address;
  final Location? geoCode;

  Airport({
    required this.cityName,
    required this.airportCode,
    required this.address,
    this.geoCode,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      cityName: json['name'] as String,
      airportCode: json['iataCode'] as String,
      address: AirportAddress.fromJson(json['address'] as Map<String, dynamic>),
      geoCode: json['geoCode'] != null
          ? Location.fromJson(json['geoCode'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = cityName;
    data['iataCode'] = airportCode;
    data['address'] = address.toJson();
    if (geoCode != null) {
      data['geoCode'] = geoCode!.toJson();
    }
    return data;
  }
}

class AirportAddress {
  final String cityName;
  final String cityCode;
  final String countryName;
  final String countryCode;
  final String regionCode;

  AirportAddress({
    this.cityName = '',
    required this.cityCode,
    this.countryName = '',
    this.countryCode = '',
    this.regionCode = '',
  });

  factory AirportAddress.fromJson(Map<String, dynamic> json) {
    return AirportAddress(
      cityName: json['cityName'] as String? ?? '',
      cityCode: json['cityCode'] as String,
      countryName: json['countryName'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      regionCode: json['regionCode'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cityName'] = cityName;
    data['cityCode'] = cityCode;
    data['countryName'] = countryName;
    data['countryCode'] = countryCode;
    data['regionCode'] = regionCode;
    return data;
  }
}

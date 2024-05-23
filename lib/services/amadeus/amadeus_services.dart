import 'dart:convert';

import 'package:demoflight/entities/airport.dart';
import 'package:demoflight/entities/flight_offer.dart';
import 'package:demoflight/services/amadeus/api_services.dart';
import 'package:demoflight/services/amadeus/remote_data.dart';
import 'package:flutter/material.dart';

class AmadeusServices {
  late AmadeusRemoteDataProvider amadeusBaseDataProvider =
      AmadeusRemoteDataProvider(ApiService());

  Future<List<FlightOffer>> getFlightOffersSearch({
    required String originCity,
    required String destinationCity,
    required String departureDate,
    String? returnDate,
    required int adults,
    int children = 0,
    int infants = 0,
    String? travelClass,
    bool? nonStop,
    String currencyCode = 'EUR',
    int? maxPrice,
  }) async {
    final rawData = await amadeusBaseDataProvider.getRawFlightOffersSearch(
      originCity: originCity,
      destinationCity: destinationCity,
      departureDate: departureDate,
      returnDate: returnDate,
      adults: adults,
      children: children,
      infants: infants,
      travelClass: travelClass,
      nonStop: nonStop,
      currencyCode: currencyCode,
      maxPrice: maxPrice,
    );
    final data = json.decode(rawData)['data'];
    final Map<String, dynamic> carriersDictionary =
        json.decode(rawData)['dictionaries']['carriers'];

    final flightOffers = (data as List).map((item) {
      try {
        return FlightOffer.fromJson(item).copyWith(
          carriersDictionary: carriersDictionary,
        );
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return List<FlightOffer>.from(flightOffers);
  }

  Future<List<Airport>> getAirportCitySearch(
    String textSearchKeyword,
  ) async {
    final rawData = await amadeusBaseDataProvider
        .getRawAirportCitySearch(textSearchKeyword);
    final data = json.decode(rawData)['data'];

    final uniqueCityList = <String>{};
    // TODO: Remove list check. User can search for city and also airport code in Search flights offer API
    final airports = (data as List).map((item) {
      try {
        final airport = Airport.fromJson(item);
        final cityCode = airport.address.cityCode;

        if (uniqueCityList.contains(cityCode)) {
          return null;
        }

        uniqueCityList.add(cityCode);
        return airport;
      } catch (e) {
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return List<Airport>.from(airports);
  }
}

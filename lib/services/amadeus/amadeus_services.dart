import 'dart:convert';

import 'package:demoflight/entities/flight_offer.dart';
import 'package:demoflight/services/amadeus/api_services.dart';
import 'package:demoflight/services/amadeus/remote_data.dart';
import 'package:flutter/material.dart';

class AmadeusServices {
  final AmadeusRemoteDataProvider amadeusBaseDataProvider =
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
}

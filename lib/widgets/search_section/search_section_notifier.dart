import 'package:demoflight/entities/airport.dart';
import 'package:demoflight/services/amadeus/amadeus_services.dart';
import 'package:flutter/material.dart';

class SearchSectionNotifier extends ChangeNotifier {
  final AmadeusServices _amadeusServices = AmadeusServices();

  List<String> fromList = [];
  List<String> toList = [];

  Future<void> onFromChanged(String value) async {
    List<Airport> airports = await _amadeusServices.getAirportCitySearch(value);
    fromList = airports.map((e) => e.cityName).toList();
    print(fromList);
    notifyListeners();
  }

  Future<void> onToChanged(String value) async {
    List<Airport> airports = await _amadeusServices.getAirportCitySearch(value);
    toList = airports.map((e) => e.cityName).toList();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class SearchNotifier extends ChangeNotifier {
  final String? cityCodeFrom;
  final String? cityCodeTo;
  final String? fromDate;
  final String? toDate;
  final String? adults;
  final String? children;
  final String? infants;
  final String? cabinClass;
  final String? tripType;

  SearchNotifier({
    required this.cityCodeFrom,
    required this.cityCodeTo,
    required this.fromDate,
    required this.toDate,
    required this.adults,
    required this.children,
    required this.infants,
    required this.cabinClass,
    required this.tripType,
  }) {
    print(cityCodeFrom);
    print(cityCodeTo);
  }
}

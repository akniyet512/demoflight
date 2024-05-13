import 'package:demoflight/pages/search/search_notifier.dart';
import 'package:demoflight/widgets/navigation_bar/navigation_bar_widget.dart';
import 'package:demoflight/widgets/search_section/search_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  final String? cityCodeFrom;
  final String? cityCodeTo;
  final String? fromDate;
  final String? toDate;
  final String? adults;
  final String? children;
  final String? infants;
  final String? cabinClass;
  final String? tripType;

  const SearchWidget({
    super.key,
    this.cityCodeFrom,
    this.cityCodeTo,
    this.fromDate,
    this.toDate,
    this.adults,
    this.children,
    this.infants,
    this.cabinClass,
    this.tripType,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchNotifier(
        cityCodeFrom: cityCodeFrom,
        cityCodeTo: cityCodeTo,
        fromDate: fromDate,
        toDate: toDate,
        adults: adults,
        children: children,
        infants: infants,
        cabinClass: cabinClass,
        tripType: tripType,
      ),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    SearchNotifier notifier = context.watch<SearchNotifier>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: const NavigationBarWidget(),
            ),
            const Divider(),
            SizedBox(
              width: size.width * 0.8,
              child: const SearchSectionWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
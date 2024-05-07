class FlightOffer {
  final bool oneWay;
  final int numberOfBookableSeats;
  final FlightOfferDataPrice price;
  final List<FlightOfferDataTravellers> travellers;
  final List<FlightOfferDataItineraries> itineraries;
  final Map<String, dynamic> carriersDictionary;

  FlightOffer({
    this.oneWay = false,
    this.numberOfBookableSeats = 0,
    required this.price,
    List<FlightOfferDataTravellers>? travellers,
    required this.itineraries,
    Map<String, dynamic>? carriersDictionary,
  })  : travellers = travellers ?? [],
        carriersDictionary = carriersDictionary ?? {};

  factory FlightOffer.fromJson(Map<String, dynamic> json) {
    return FlightOffer(
      oneWay: json['oneWay'] ?? false,
      numberOfBookableSeats: json['numberOfBookableSeats'] ?? 0,
      price: FlightOfferDataPrice.fromJson(json['price'] ?? {}),
      travellers: (json['travelerPricings'] as List<dynamic>?)
              ?.map(
                  (traveller) => FlightOfferDataTravellers.fromJson(traveller))
              .toList() ??
          [],
      itineraries: (json['itineraries'] as List<dynamic>?)
              ?.map(
                  (itinerary) => FlightOfferDataItineraries.fromJson(itinerary))
              .toList() ??
          [],
      carriersDictionary: json['carriersDictionary'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'oneWay': oneWay,
      'numberOfBookableSeats': numberOfBookableSeats,
      'price': price.toJson(),
      'travelerPricings':
          travellers.map((traveller) => traveller.toJson()).toList(),
      'itineraries':
          itineraries.map((itinerary) => itinerary.toJson()).toList(),
      'carriersDictionary': carriersDictionary,
    };
  }

  FlightOffer copyWith({
    bool? oneWay,
    int? numberOfBookableSeats,
    FlightOfferDataPrice? price,
    List<FlightOfferDataTravellers>? travellers,
    List<FlightOfferDataItineraries>? itineraries,
    Map<String, dynamic>? carriersDictionary,
  }) {
    return FlightOffer(
      oneWay: oneWay ?? this.oneWay,
      numberOfBookableSeats: numberOfBookableSeats ?? this.numberOfBookableSeats,
      price: price ?? this.price,
      travellers: travellers ?? this.travellers,
      itineraries: itineraries ?? this.itineraries,
      carriersDictionary: carriersDictionary ?? this.carriersDictionary,
    );
  }
}

class FlightOfferDataTravellers {
  final String travelerType;
  final FlightOfferDataPrice price;

  FlightOfferDataTravellers({
    this.travelerType = 'ADULT',
    required this.price,
  });

  factory FlightOfferDataTravellers.fromJson(Map<String, dynamic> json) {
    return FlightOfferDataTravellers(
      travelerType: json['travelerType'] ?? 'ADULT',
      price: FlightOfferDataPrice.fromJson(json['price'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'travelerType': travelerType,
      'price': price.toJson(),
    };
  }
}

class FlightOfferDataPrice {
  final String currency;
  final String total;

  FlightOfferDataPrice({
    this.currency = 'EUR',
    this.total = '-',
  });

  factory FlightOfferDataPrice.fromJson(Map<String, dynamic> json) {
    return FlightOfferDataPrice(
      currency: json['currency'] ?? 'EUR',
      total: json['total'] ?? '-',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'total': total,
    };
  }
}

class FlightOfferDataItineraries {
  final String stopDuration;
  final List<FlightOfferDataItinerariesSegments> segments;

  FlightOfferDataItineraries({
    this.stopDuration = 'PT0M',
    List<FlightOfferDataItinerariesSegments>? segments,
  }) : segments = segments ?? [];

  factory FlightOfferDataItineraries.fromJson(Map<String, dynamic> json) {
    return FlightOfferDataItineraries(
      stopDuration: json['duration'] ?? 'PT0M',
      segments: (json['segments'] as List<dynamic>?)
              ?.map((segment) =>
                  FlightOfferDataItinerariesSegments.fromJson(segment))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': stopDuration,
      'segments': segments.map((segment) => segment.toJson()).toList(),
    };
  }
}

class FlightOfferDataItinerariesSegments {
  final FlightOfferDataEndpoint departure;
  final FlightOfferDataEndpoint arrival;
  final String duration;
  final int numberOfStops;
  final String carrierCode;
  final FlightOfferDataAircraft aircraft;

  FlightOfferDataItinerariesSegments({
    required this.departure,
    required this.arrival,
    this.duration = '',
    this.numberOfStops = -1,
    this.carrierCode = '',
    required this.aircraft,
  });

  factory FlightOfferDataItinerariesSegments.fromJson(
      Map<String, dynamic> json) {
    return FlightOfferDataItinerariesSegments(
      departure: FlightOfferDataEndpoint.fromJson(json['departure'] ?? {}),
      arrival: FlightOfferDataEndpoint.fromJson(json['arrival'] ?? {}),
      duration: json['duration'] ?? '',
      numberOfStops: json['numberOfStops'] ?? -1,
      carrierCode: json['carrierCode'] ?? '',
      aircraft: FlightOfferDataAircraft.fromJson(json['aircraft'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'departure': departure.toJson(),
      'arrival': arrival.toJson(),
      'duration': duration,
      'numberOfStops': numberOfStops,
      'carrierCode': carrierCode,
      'aircraft': aircraft.toJson(),
    };
  }
}

class FlightOfferDataEndpoint {
  final String iataCode;
  final String terminal;
  final String at;

  FlightOfferDataEndpoint({
    this.iataCode = '',
    this.terminal = '',
    this.at = '',
  });

  factory FlightOfferDataEndpoint.fromJson(Map<String, dynamic> json) {
    return FlightOfferDataEndpoint(
      iataCode: json['iataCode'] ?? '',
      terminal: json['terminal'] ?? '',
      at: json['at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iataCode': iataCode,
      'terminal': terminal,
      'at': at,
    };
  }
}

class FlightOfferDataAircraft {
  final String code;

  FlightOfferDataAircraft({
    this.code = '',
  });

  factory FlightOfferDataAircraft.fromJson(Map<String, dynamic> json) {
    return FlightOfferDataAircraft(
      code: json['code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}

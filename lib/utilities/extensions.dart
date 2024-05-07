extension ListExt on List {
  /// Converts a List of elements to comma separated String
  /// without any spaces.
  ///
  /// Used for calling APIs as a query parameter.
  ///
  /// E.g.:
  /// ```
  /// INPUT: <String>['SYD', 'PAR']
  /// OUTPUT: 'SYD,PAR'
  /// ```
  ///
  /// ```
  /// INPUT: <int>[5, 4, 3]
  /// OUTPUT: '5,4,3'
  /// ```
  ///
  /// ```
  /// INPUT: <CategoryPOI>[CategoryPOI.NIGHTLIFE, CategoryPOI.RESTAURANT]
  /// OUTPUT: 'NIGHTLIFE,RESTAURANT'
  /// ```
  String toCommaString() {
    final str = toString();
    return str.substring(1, str.length - 1).replaceAll(' ', '');
  }
}

extension StrExt on String {
  /// Similar to Camel case except that Pascal case makes first letter
  /// of each word capitalized.
  ///
  /// Used in [HotelsPage], where API call returns all names of the hotels as upper case
  /// so it is converted for better readability.
  ///
  /// E.g.:
  /// ```
  /// INPUT: 'PARIS CAFÉ'
  /// OUTPUT: 'Paris Café'
  /// ```
  String toPascalCase() {
    final str = toString();

    if (str.isEmpty) {
      return '';
    }

    if (str.length == 1) {
      return str.toUpperCase();
    }

    final strBuffer = StringBuffer();

    str.split(' ').forEach((element) {
      if (element.length > 1) {
        strBuffer
          ..write(element.substring(0, 1).toUpperCase())
          ..write(element.substring(1).toLowerCase());
      } else {
        strBuffer.write(element.toUpperCase());
      }

      strBuffer.write(' ');
    });
    return (strBuffer.toString()).trim();
  }
}

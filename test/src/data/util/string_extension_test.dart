import 'package:flutter_overpass/src/data/util/queries.dart';
import 'package:flutter_overpass/src/data/util/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'make sure format function can replace with parameters given',
    () async {
      // arrange
      const tLatitude = 3.5764070599333397;
      const tLongitude = 98.68233751995223;
      const tRadius = 200;

      // act
      final result = Queries.nearbyPlacesByCoordinate.format({
        'latitude': tLatitude,
        'longitude': tLongitude,
        'radius': tRadius,
      });

      // assert
      const expextedString = '[out:json]; node(around:$tRadius,$tLatitude,$tLongitude)[name]; out body;';
      expect(result, expextedString);
    },
  );
}

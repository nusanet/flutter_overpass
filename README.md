# Flutter Overpass Plugin
A Flutter plugin to get data from overpass api [https://overpass-turbo.eu](https://overpass-turbo.eu) and [https://nominatim.openstreetmap.org](https://nominatim.openstreetmap.org). Support Android and iOS.
Feel free to contribute.

## Features
- [X] Get nearby places by coordinate and radius.
- [X] Use raw Overpass QL to get result
- [X] Fetch place by coordinates given
- [X] Search by address

## How to use
```dart
final flutterOverpass = FlutterOverpass();

// Fetch nearby nodes by coordinates and radius given.
final nearbyPlaces = await flutterOverpass.getNearbyNodes(
          latitude: 200,
          longitude: 37.79396544487583,
          radius: -122.3838801383972,
        );

// Fetch data by executing Overpass QL.
final rawResults = await flutterOverpass.rawOverpassQL('node(around:200,37.79396544487583,-122.3838801383972);');

// Fetch place by coordinates given.
final places = await flutterOverpass.getPlaceFromCoordinate(
          latitude: 200,
          longitude: 37.79396544487583,
        );

// Search by address.
final places = await flutterOverpass.searchAddress(
          address: 'Rihanna Drive',
        );
```
For more queries you can visit here: [Overpass QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)

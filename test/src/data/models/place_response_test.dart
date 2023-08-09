import 'dart:convert';

import 'package:flutter_overpass/src/data/models/place_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture/fixture_reader.dart';

void main() {
  final tJsonMap = json.decode(fixture('place_response.json'));

  group('PlaceResponse', () {
    final tModel = PlaceResponse.fromJson(tJsonMap);

    test(
      'make sure output of props function as expected',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.placeId,
            tModel.licence,
            tModel.osmType,
            tModel.osmId,
            tModel.latitude,
            tModel.longitude,
            tModel.placeRank,
            tModel.category,
            tModel.type,
            tModel.importance,
            tModel.addresstype,
            tModel.displayName,
            tModel.name,
            tModel.address,
            tModel.boundingbox,
          ],
        );
      },
    );

    test(
      'make sure toSring output as expected',
      () async {
        // assert
        expect(
          tModel.toString(),
          'PlaceResponse{placeId: ${tModel.placeId}, licence: ${tModel.licence}, osmType: ${tModel.osmType}, osmId: ${tModel.osmId}, latitude: ${tModel.latitude}, longitude: ${tModel.longitude}, placeRank: ${tModel.placeRank}, category: ${tModel.category}, type: ${tModel.type}, importance: ${tModel.importance}, addresstype: ${tModel.addresstype}, displayName: ${tModel.displayName}, name: ${tModel.name}, address: ${tModel.address}, boundingbox: ${tModel.boundingbox}}',
        );
      },
    );

    test(
      'make sure fromJson function return PlaceResponse object as expected',
      () async {
        // arrange
        final jsonData = tJsonMap;

        // act
        final actualModel = PlaceResponse.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return PlaceResponse object as expected',
      () async {
        // arrange
        final model = PlaceResponse.fromJson(tJsonMap);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Address', () {
    final tModel = Address.fromJson(tJsonMap['address']);

    test(
      'make sure output of props function as expected',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.building,
            tModel.houseNumber,
            tModel.road,
            tModel.quarter,
            tModel.suburb,
            tModel.village,
            tModel.cityDistrict,
            tModel.city,
            tModel.stateDistrict,
            tModel.state,
            tModel.postcode,
            tModel.country,
            tModel.countryCode,
          ],
        );
      },
    );

    test(
      'make sure toSring output as expected',
      () async {
        // assert
        expect(
          tModel.toString(),
          'Address{building: ${tModel.building}, houseNumber: ${tModel.houseNumber}, road: ${tModel.road}, quarter: ${tModel.quarter}, suburb: ${tModel.suburb}, village: ${tModel.village}, cityDistrict: ${tModel.cityDistrict}, city: ${tModel.city}, stateDistrict: ${tModel.stateDistrict}, state: ${tModel.state}, postcode: ${tModel.postcode}, country: ${tModel.country}, countryCode: ${tModel.countryCode}}',
        );
      },
    );

    test(
      'make sure fromJson function return Address object as expected',
      () async {
        // arrange
        final jsonData = tJsonMap['address'];

        // act
        final actualModel = Address.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Address object as expected',
      () async {
        // arrange
        final model = Address.fromJson(tJsonMap['address']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });
}

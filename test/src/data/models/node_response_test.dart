import 'dart:convert';

import 'package:flutter_overpass/src/data/models/node_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture/fixture_reader.dart';

void main() {
  final tJsonMap = json.decode(fixture('node_response.json'));

  group('NodeResponse', () {
    final tModel = NodeResponse.fromJson(tJsonMap);

    test(
      'make sure output of props function as expected',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.version,
            tModel.generator,
            tModel.osm,
            tModel.elements,
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
          'NodeResponse{version: ${tModel.version}, generator: ${tModel.generator}, osm: ${tModel.osm}, elements: ${tModel.elements}}',
        );
      },
    );

    test(
      'make sure fromJson function return NodeResponse object as expected',
      () async {
        // arrange
        final jsonData = tJsonMap;

        // act
        final actualModel = NodeResponse.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return NodeResponse object as expected',
      () async {
        // arrange
        final model = NodeResponse.fromJson(tJsonMap);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Element', () {
    final tModel = Element.fromJson(tJsonMap['elements'][0]);

    test(
      'make sure output of props function as expected',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.type,
            tModel.id,
            tModel.lat,
            tModel.lon,
            tModel.tags,
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
          'Element{type: ${tModel.type}, id: ${tModel.id}, lat: ${tModel.lat}, lon: ${tModel.lon}, tags: ${tModel.tags}}',
        );
      },
    );

    test(
      'make sure fromJson function return Element object as expected',
      () async {
        // arrange
        final jsonData = tJsonMap['elements'][0];

        // act
        final actualModel = Element.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Element object as expected',
      () async {
        // arrange
        final model = Element.fromJson(tJsonMap['elements'][0]);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Tag', () {
    final tModel = Tag.fromJson(tJsonMap['elements'][0]['tags']);

    test(
      'make sure output of props function as expected',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.addrCity,
            tModel.addrHousenumber,
            tModel.addrPostcode,
            tModel.addrStreet,
            tModel.name,
            tModel.office,
            tModel.openingHours,
            tModel.openingHoursCovid19,
            tModel.website,
            tModel.amenity,
            tModel.beauty,
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
          'Tag{addrCity: ${tModel.addrCity}, addrHousenumber: ${tModel.addrHousenumber}, addrPostcode: ${tModel.addrPostcode}, addrStreet: ${tModel.addrStreet}, name: ${tModel.name}, office: ${tModel.office}, openingHours: ${tModel.openingHours}, openingHoursCovid19: ${tModel.openingHoursCovid19}, website: ${tModel.website}, amenity: ${tModel.amenity}, beauty: ${tModel.beauty}}',
        );
      },
    );

    test(
      'make sure fromJson function return Tag object as expected',
      () async {
        // arrange
        final jsonData = tJsonMap['elements'][0]['tags'];

        // act
        final actualModel = Tag.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Tag object as expected',
      () async {
        // arrange
        final model = Tag.fromJson(tJsonMap['elements'][0]['tags']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });

  group('Osm', () {
    final tModel = Osm.fromJson(tJsonMap['osm3s']);

    test(
      'make sure output of props function as expected',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.timestampOsmBase,
            tModel.copyright,
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
          'Osm{timestampOsmBase: ${tModel.timestampOsmBase}, copyright: ${tModel.copyright}}',
        );
      },
    );

    test(
      'make sure fromJson function return Osm object as expected',
      () async {
        // arrange
        final jsonData = tJsonMap['osm3s'];

        // act
        final actualModel = Osm.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Osm object as expected',
      () async {
        // arrange
        final model = Osm.fromJson(tJsonMap['osm3s']);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });
}

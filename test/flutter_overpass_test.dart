import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_overpass/src/data/util/base_url_config.dart';
import 'package:flutter_overpass/src/data/util/queries.dart';
import 'package:flutter_overpass/src/data/util/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_overpass/flutter_overpass.dart';
import 'package:flutter_overpass/flutter_overpass_platform_interface.dart';
import 'package:flutter_overpass/flutter_overpass_method_channel.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fixture/fixture_reader.dart';
import 'helper/mock_helper.mocks.dart';

class MockFlutterOverpassPlatform with MockPlatformInterfaceMixin implements FlutterOverpassPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterOverpassPlatform initialPlatform = FlutterOverpassPlatform.instance;
  late MockDio mockDio;
  late FlutterOverpass flutterOverpass;

  setUp(() {
    mockDio = MockDio();
    flutterOverpass = FlutterOverpass(
      dio: mockDio,
    );
  });

  final tRequestOptions = RequestOptions(path: '');

  test('$MethodChannelFlutterOverpass is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterOverpass>());
  });

  test('getPlatformVersion', () async {
    FlutterOverpass flutterOverpassPlugin = FlutterOverpass();
    MockFlutterOverpassPlatform fakePlatform = MockFlutterOverpassPlatform();
    FlutterOverpassPlatform.instance = fakePlatform;

    expect(await flutterOverpassPlugin.getPlatformVersion(), '42');
  });

  group('getNearbyNodes', () {
    final jsonResponse = json.decode(fixture('node_response.json'));
    final tResponse = NodeResponse.fromJson(jsonResponse);
    const tLatitude = 3.5764070599333397;
    const tLongitude = 98.68233751995223;
    const tRadius = 200.0;

    const path = BaseUrlConfig.overpassUrl;

    void setUpMockDioSuccess() {
      final responsePayload = jsonResponse;
      final response = Response(
        requestOptions: tRequestOptions,
        data: responsePayload,
        statusCode: 200,
        headers: Headers.fromMap({
          Headers.contentTypeHeader: [Headers.jsonContentType],
        }),
      );
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => response);
    }

    test(
      'make sure getNearbyNodes endpoint called with correct parameters',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        await flutterOverpass.getNearbyNodes(
          latitude: tLatitude,
          longitude: tLongitude,
          radius: tRadius,
        );

        // assert
        verify(
          mockDio.get(
            path,
            queryParameters: {
              'data': Queries.nearbyPlacesByCoordinate.format({
                'latitude': tLatitude,
                'longitude': tLongitude,
                'radius': tRadius,
              }),
            },
          ),
        );
      },
    );

    test(
      'make sure getNearbyNodes return NodeResponse when success',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        final result = await flutterOverpass.getNearbyNodes(
          latitude: tLatitude,
          longitude: tLongitude,
          radius: tRadius,
        );

        // assert
        expect(result, tResponse);
      },
    );

    test(
      'make sure getNearbyNodes throws DioException when failed',
      () async {
        // arrange
        final response = Response(
          requestOptions: tRequestOptions,
          data: 'Bad Request',
          statusCode: 400,
        );
        when(
          mockDio.get(
            any,
            queryParameters: anyNamed('queryParameters'),
          ),
        ).thenAnswer((_) async => response);

        // act
        final call = flutterOverpass.getNearbyNodes(
          latitude: tLatitude,
          longitude: tLongitude,
          radius: tRadius,
        );

        // assert
        expect(() => call, throwsA(const TypeMatcher<DioException>()));
      },
    );
  });

  group('rawOverpassQL', () {
    final jsonResponse = json.decode('{"data": "test"}');
    final tResponse = Map<String, dynamic>.from(jsonResponse);
    const tQuery = 'node(around:200,37.79396544487583,-122.3838801383972);';

    const path = BaseUrlConfig.overpassUrl;

    void setUpMockDioSuccess() {
      final responsePayload = jsonResponse;
      final response = Response(
        requestOptions: tRequestOptions,
        data: responsePayload,
        statusCode: 200,
        headers: Headers.fromMap({
          Headers.contentTypeHeader: [Headers.jsonContentType],
        }),
      );
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => response);
    }

    test(
      'make sure rawOverpassQL endpoint called with correct parameters',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        await flutterOverpass.rawOverpassQL(
          query: tQuery,
        );

        // assert
        verify(
          mockDio.get(
            path,
            queryParameters: {
              'data': '[out:json];${tQuery}out body;',
            },
          ),
        );
      },
    );

    test(
      'make sure rawOverpassQL return NodeResponse when success',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        final result = await flutterOverpass.rawOverpassQL(
          query: tQuery,
        );

        // assert
        expect(result, tResponse);
      },
    );

    test(
      'make sure rawOverpassQL throws DioException when failed',
      () async {
        // arrange
        final response = Response(
          requestOptions: tRequestOptions,
          data: 'Bad Request',
          statusCode: 400,
        );
        when(
          mockDio.get(
            any,
            queryParameters: anyNamed('queryParameters'),
          ),
        ).thenAnswer((_) async => response);

        // act
        final call = flutterOverpass.rawOverpassQL(
          query: tQuery,
        );

        // assert
        expect(() => call, throwsA(const TypeMatcher<DioException>()));
      },
    );
  });

  group('searchAddress', () {
    final jsonResponse = json.decode(fixture('list_place_response.json'));
    final tResponse = List<PlaceResponse>.from(jsonResponse.map((x) => PlaceResponse.fromJson(x)));
    const tAddress = 'Rihanna Drive;';

    const path = '${BaseUrlConfig.nominatimUrl}/search';

    void setUpMockDioSuccess() {
      final responsePayload = jsonResponse;
      final response = Response(
        requestOptions: tRequestOptions,
        data: responsePayload,
        statusCode: 200,
        headers: Headers.fromMap({
          Headers.contentTypeHeader: [Headers.jsonContentType],
        }),
      );
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => response);
    }

    test(
      'make sure searchAddress endpoint called with correct parameters',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        await flutterOverpass.searchAddress(
          address: tAddress,
        );

        // assert
        verify(
          mockDio.get(
            path,
            queryParameters: {
              'format': 'jsonv2',
              'q': tAddress,
              'adressdetails': 1,
            },
          ),
        );
      },
    );

    test(
      'make sure searchAddress return NodeResponse when success',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        final result = await flutterOverpass.searchAddress(
          address: tAddress,
        );

        // assert
        expect(result, tResponse);
      },
    );

    test(
      'make sure searchAddress throws DioException when failed',
      () async {
        // arrange
        final response = Response(
          requestOptions: tRequestOptions,
          data: 'Bad Request',
          statusCode: 400,
        );
        when(
          mockDio.get(
            any,
            queryParameters: anyNamed('queryParameters'),
          ),
        ).thenAnswer((_) async => response);

        // act
        final call = flutterOverpass.searchAddress(
          address: tAddress,
        );

        // assert
        expect(() => call, throwsA(const TypeMatcher<DioException>()));
      },
    );
  });
}

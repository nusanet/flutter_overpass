import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_overpass/src/data/models/node_response.dart';
import 'package:flutter_overpass/src/data/models/place_response.dart';
import 'package:flutter_overpass/src/data/util/base_url_config.dart';
import 'package:flutter_overpass/src/data/util/queries.dart';
import 'package:flutter_overpass/src/data/util/string_extension.dart';

import 'flutter_overpass_platform_interface.dart';

export 'src/data/models/node_response.dart';
export 'src/data/models/place_response.dart';

class FlutterOverpass {
  FlutterOverpass({
    this.headers,
    this.dio,
    this.overpassUrl = BaseUrlConfig.overpassUrl,
    this.nominatimUrl = BaseUrlConfig.nominatimUrl,
  }) {
    dio ??= Dio(
      BaseOptions(
        headers: headers,
      ),
    );
  }

  // `headers` is a map of headers to be added to each request
  final Map<String, dynamic>? headers;

  // `dio` is a preconfigured instance of Dio
  Dio? dio;

  // The overpass interpreter url, defaults to 'https://overpass-api.de/api/interpreter'
  final String overpassUrl;

  // The nominatim url, defaults to 'https://nominatim.openstreetmap.org'
  final String nominatimUrl;

  Future<String?> getPlatformVersion() {
    return FlutterOverpassPlatform.instance.getPlatformVersion();
  }

  // Function to get nearby nodes by coordinates and radius given. Will throw DioExeption when error.
  Future<NodeResponse> getNearbyNodes({
    // Latitude of the point.
    required double latitude,
    // Longitude of the point.
    required double longitude,
    // Radius from the point.
    required double radius,
  }) async {
    final response = await dio!.get(
      overpassUrl,
      queryParameters: {
        'data': Queries.nearbyPlacesByCoordinate.format({
          'latitude': latitude,
          'longitude': longitude,
          'radius': radius,
        }),
      },
    );
    if (response.statusCode == 200) {
      return NodeResponse.fromJson(response.data);
    } else {
      throw DioException(
        requestOptions: RequestOptions(
          path: overpassUrl,
        ),
      );
    }
  }

  // Function to get raw overpassQL response by query given. Will throw DioExeption when error.
  // Example: final rawResults = await flutterOverpass.rawOverpassQL('node(around:200,37.79396544487583,-122.3838801383972);');
  Future<dynamic> rawOverpassQL({
    // Raw query to be executed.
    required String query,
    // This will add "out body;" to the query.
    bool useOutBody = true,
    // Output expected.
    String outputQuery = '[out:json];',
  }) async {
    String queryToExecute = '$outputQuery$query';
    queryToExecute = useOutBody ? '${queryToExecute}out body;' : queryToExecute;
    final response = await dio!.get(
      overpassUrl,
      queryParameters: {
        'data': queryToExecute,
      },
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw DioException(
        requestOptions: RequestOptions(
          path: overpassUrl,
        ),
      );
    }
  }

  // Function to get place data from coordinate. Will throw DioExeption when error.
  // This endpoint limit 1 request per second.
  Future<PlaceResponse> getPlaceFromCoordinate({
    // Latitude of the point.
    required double latitude,
    // Longitude of the point.
    required double longitude,
  }) async {
    final path = '$nominatimUrl/reverse';
    final response = await dio!.get(
      path,
      queryParameters: {
        'format': 'jsonv2',
        'lat': latitude,
        'lon': longitude,
      },
    );
    if (response.statusCode == 200) {
      return PlaceResponse.fromJson(response.data);
    } else {
      throw DioException(
        requestOptions: RequestOptions(
          path: path,
        ),
      );
    }
  }

  // Function to get place data from coordinate. Will throw DioExeption when error.
  // This endpoint limit 1 request per second.
  Future<List<PlaceResponse>> searchAddress({
    // Latitude of the point.
    required String address,
  }) async {
    final path = '$nominatimUrl/search';
    final response = await dio!.get(
      path,
      queryParameters: {
        'format': 'jsonv2',
        'q': address,
        'adressdetails': 1,
      },
    );
    if (response.statusCode == 200) {
      return List<PlaceResponse>.from((json.decode(json.encode(response.data)))
          .map((x) => PlaceResponse.fromJson(x)));
    } else {
      throw DioException(
        requestOptions: RequestOptions(
          path: path,
        ),
      );
    }
  }
}

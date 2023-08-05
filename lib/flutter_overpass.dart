import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_overpass/src/data/models/node_response.dart';
import 'package:flutter_overpass/src/data/models/place_response.dart';
import 'package:flutter_overpass/src/data/util/base_url_config.dart';
import 'package:flutter_overpass/src/data/util/queries.dart';
import 'package:flutter_overpass/src/data/util/string_extension.dart';

import 'flutter_overpass_platform_interface.dart';

class FlutterOverpass {
  FlutterOverpass({
    this.headers,
    this.dio,
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
    const path = BaseUrlConfig.overpassUrl;
    final response = await dio!.get(
      path,
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
          path: path,
        ),
      );
    }
  }

  // Function to get raw overpassQL response by query given. Will throw DioExeption when error.
  // Example: final rawResults = await flutterOverpass.rawOverpassQL('node(around:200,37.79396544487583,-122.3838801383972);');
  Future<Map<String, dynamic>> rawOverpassQL({
    // Raw query to be executed.
    required String query,
    // This will add "out body;" to the query.
    bool useOutBody = true,
  }) async {
    const path = BaseUrlConfig.overpassUrl;
    String queryToExecute = '[out:json];$query';
    queryToExecute = useOutBody ? '${queryToExecute}out body;' : queryToExecute;
    final response = await dio!.get(
      path,
      queryParameters: {
        'data': queryToExecute,
      },
    );
    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(response.data);
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
  Future<PlaceResponse> getPlaceFromCoordinate({
    // Latitude of the point.
    required double latitude,
    // Longitude of the point.
    required double longitude,
  }) async {
    const path = '${BaseUrlConfig.nominatimUrl}/reverse';
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
    const path = '${BaseUrlConfig.nominatimUrl}/search';
    final response = await dio!.get(
      path,
      queryParameters: {
        'format': 'jsonv2',
        'q': address,
        'adressdetails': 1,
      },
    );
    if (response.statusCode == 200) {
      return List<PlaceResponse>.from((json.decode(json.encode(response.data))).map((x) => PlaceResponse.fromJson(x)));
    } else {
      throw DioException(
        requestOptions: RequestOptions(
          path: path,
        ),
      );
    }
  }
}

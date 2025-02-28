// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse(
      placeId: (json['place_id'] as num?)?.toInt(),
      licence: json['licence'] as String?,
      osmType: json['osm_type'] as String?,
      osmId: (json['osm_id'] as num?)?.toInt(),
      latitude: json['lat'] as String?,
      longitude: json['lon'] as String?,
      placeRank: (json['place_rank'] as num?)?.toInt(),
      category: json['category'] as String?,
      type: json['type'] as String?,
      importance: (json['importance'] as num?)?.toDouble(),
      addresstype: json['addresstype'] as String?,
      displayName: json['display_name'] as String?,
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'lat': instance.latitude,
      'lon': instance.longitude,
      'place_rank': instance.placeRank,
      'category': instance.category,
      'type': instance.type,
      'importance': instance.importance,
      'addresstype': instance.addresstype,
      'display_name': instance.displayName,
      'name': instance.name,
      'address': instance.address?.toJson(),
      'boundingbox': instance.boundingbox,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      building: json['building'] as String?,
      houseNumber: json['house_number'] as String?,
      road: json['road'] as String?,
      quarter: json['quarter'] as String?,
      suburb: json['suburb'] as String?,
      village: json['village'] as String?,
      cityDistrict: json['city_district'] as String?,
      city: json['city'] as String?,
      stateDistrict: json['state_district'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'building': instance.building,
      'house_number': instance.houseNumber,
      'road': instance.road,
      'quarter': instance.quarter,
      'suburb': instance.suburb,
      'village': instance.village,
      'city_district': instance.cityDistrict,
      'city': instance.city,
      'state_district': instance.stateDistrict,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };

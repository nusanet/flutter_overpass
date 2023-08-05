// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse(
      placeId: json['place_id'] as int?,
      licence: json['licence'] as String?,
      osmType: json['osm_type'] as String?,
      osmId: json['osm_id'] as int?,
      latitude: json['lat'] as String?,
      longitude: json['lon'] as String?,
      placeRank: json['place_rank'] as int?,
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
      road: json['road'] as String?,
      village: json['village'] as String?,
      stateDistrict: json['state_district'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'road': instance.road,
      'village': instance.village,
      'state_district': instance.stateDistrict,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };

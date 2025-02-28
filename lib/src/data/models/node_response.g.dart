// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeResponse _$NodeResponseFromJson(Map<String, dynamic> json) => NodeResponse(
      version: (json['version'] as num?)?.toDouble(),
      generator: json['generator'] as String?,
      osm: json['osm3s'] == null
          ? null
          : Osm.fromJson(json['osm3s'] as Map<String, dynamic>),
      elements: (json['elements'] as List<dynamic>?)
          ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NodeResponseToJson(NodeResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'generator': instance.generator,
      'osm3s': instance.osm?.toJson(),
      'elements': instance.elements?.map((e) => e.toJson()).toList(),
    };

Element _$ElementFromJson(Map<String, dynamic> json) => Element(
      type: json['type'] as String?,
      id: (json['id'] as num?)?.toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      tags: json['tags'] == null
          ? null
          : Tag.fromJson(json['tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementToJson(Element instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'tags': instance.tags?.toJson(),
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      addrCity: json['addr:city'] as String?,
      addrHousenumber: json['addr:housenumber'] as String?,
      addrPostcode: json['addr:postcode'] as String?,
      addrStreet: json['addr:street'] as String?,
      name: json['name'] as String?,
      office: json['office'] as String?,
      openingHours: json['opening_hours'] as String?,
      openingHoursCovid19: json['opening_hours:covid19'] as String?,
      website: json['website'] as String?,
      amenity: json['amenity'] as String?,
      beauty: json['beauty'] as String?,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'addr:city': instance.addrCity,
      'addr:housenumber': instance.addrHousenumber,
      'addr:postcode': instance.addrPostcode,
      'addr:street': instance.addrStreet,
      'name': instance.name,
      'office': instance.office,
      'opening_hours': instance.openingHours,
      'opening_hours:covid19': instance.openingHoursCovid19,
      'website': instance.website,
      'amenity': instance.amenity,
      'beauty': instance.beauty,
    };

Osm _$OsmFromJson(Map<String, dynamic> json) => Osm(
      timestampOsmBase: json['timestamp_osm_base'] == null
          ? null
          : DateTime.parse(json['timestamp_osm_base'] as String),
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$OsmToJson(Osm instance) => <String, dynamic>{
      'timestamp_osm_base': instance.timestampOsmBase?.toIso8601String(),
      'copyright': instance.copyright,
    };

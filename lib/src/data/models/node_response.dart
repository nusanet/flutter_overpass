import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'node_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class NodeResponse extends Equatable {
  const NodeResponse({
    this.version,
    this.generator,
    this.osm,
    this.elements,
  });

  // Version of the OSM API.
  @JsonKey(name: 'version')
  final double? version;

  // Name of the application that created the response.
  @JsonKey(name: 'generator')
  final String? generator;

  // OSM3S metadata.
  @JsonKey(name: 'osm3s')
  final Osm? osm;

  // List of nodes.
  @JsonKey(name: 'elements')
  final List<Element>? elements;

  factory NodeResponse.fromJson(Map<String, dynamic> json) => _$NodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NodeResponseToJson(this);

  @override
  List<Object?> get props => [
        version,
        generator,
        osm,
        elements,
      ];

  @override
  String toString() {
    return 'NodeResponse{version: $version, generator: $generator, osm: $osm, elements: $elements}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Element extends Equatable {
  const Element({
    this.type,
    this.id,
    this.lat,
    this.lon,
    this.tags,
  });

  // Type of the element.
  @JsonKey(name: 'type')
  final String? type;

  // ID of the element.
  @JsonKey(name: 'id')
  final int? id;

  // Latitude of the element.
  @JsonKey(name: 'lat')
  final double? lat;

  // Longitude of the element.
  @JsonKey(name: 'lon')
  final double? lon;

  // Tags of the element.
  @JsonKey(name: 'tags')
  final Tag? tags;

  factory Element.fromJson(Map<String, dynamic> json) => _$ElementFromJson(json);

  Map<String, dynamic> toJson() => _$ElementToJson(this);

  @override
  List<Object?> get props => [
        type,
        id,
        lat,
        lon,
        tags,
      ];

  @override
  String toString() {
    return 'Element{type: $type, id: $id, lat: $lat, lon: $lon, tags: $tags}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Tag extends Equatable {
  const Tag({
    this.addrCity,
    this.addrHousenumber,
    this.addrPostcode,
    this.addrStreet,
    this.name,
    this.office,
    this.openingHours,
    this.openingHoursCovid19,
    this.website,
    this.amenity,
    this.beauty,
  });

  // City of the element.
  @JsonKey(name: 'addr:city')
  final String? addrCity;

  // House number of the element.
  @JsonKey(name: 'addr:housenumber')
  final String? addrHousenumber;

  // Postcode of the element.
  @JsonKey(name: 'addr:postcode')
  final String? addrPostcode;

  // Street of the element.
  @JsonKey(name: 'addr:street')
  final String? addrStreet;

  // Name of the element.
  @JsonKey(name: 'name')
  final String? name;

  // Office of the element.
  @JsonKey(name: 'office')
  final String? office;

  // Opening hours of the element.
  @JsonKey(name: 'opening_hours')
  final String? openingHours;

  // Opening hours of the element during COVID-19.
  @JsonKey(name: 'opening_hours:covid19')
  final String? openingHoursCovid19;

  // Website of the element.
  @JsonKey(name: 'website')
  final String? website;

  // Amenity of the element.
  @JsonKey(name: 'amenity')
  final String? amenity;

  // Is element is a type place of beauty.
  @JsonKey(name: 'beauty')
  final String? beauty;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  List<Object?> get props => [
        addrCity,
        addrHousenumber,
        addrPostcode,
        addrStreet,
        name,
        office,
        openingHours,
        openingHoursCovid19,
        website,
        amenity,
        beauty,
      ];

  @override
  String toString() {
    return 'Tag{addrCity: $addrCity, addrHousenumber: $addrHousenumber, addrPostcode: $addrPostcode, addrStreet: $addrStreet, name: $name, office: $office, openingHours: $openingHours, openingHoursCovid19: $openingHoursCovid19, website: $website, amenity: $amenity, beauty: $beauty}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Osm extends Equatable {
  const Osm({
    this.timestampOsmBase,
    this.copyright,
  });

  // Timestamp of the OSM base.
  @JsonKey(name: 'timestamp_osm_base')
  final DateTime? timestampOsmBase;

  // OSM3S metadata.
  @JsonKey(name: 'copyright')
  final String? copyright;

  factory Osm.fromJson(Map<String, dynamic> json) => _$OsmFromJson(json);

  Map<String, dynamic> toJson() => _$OsmToJson(this);

  @override
  List<Object?> get props => [
        timestampOsmBase,
        copyright,
      ];

  @override
  String toString() {
    return 'Osm{timestampOsmBase: $timestampOsmBase, copyright: $copyright}';
  }
}

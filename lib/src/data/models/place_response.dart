import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class PlaceResponse extends Equatable {
  const PlaceResponse({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.latitude,
    this.longitude,
    this.placeRank,
    this.category,
    this.type,
    this.importance,
    this.addresstype,
    this.displayName,
    this.name,
    this.address,
    this.boundingbox,
  });

  // Place ID.
  @JsonKey(name: 'place_id')
  final int? placeId;

  // Licence.
  @JsonKey(name: 'licence')
  final String? licence;

  // OSM type.
  @JsonKey(name: 'osm_type')
  final String? osmType;

  // OSM ID.
  @JsonKey(name: 'osm_id')
  final int? osmId;

  // Latitude.
  @JsonKey(name: 'lat')
  final String? latitude;

  // Longitude.
  @JsonKey(name: 'lon')
  final String? longitude;

  // Place rank.
  @JsonKey(name: 'place_rank')
  final int? placeRank;

  // Category.
  @JsonKey(name: 'category')
  final String? category;

  // Type.
  @JsonKey(name: 'type')
  final String? type;

  // Importance.
  @JsonKey(name: 'importance')
  final double? importance;

  // Address type.
  @JsonKey(name: 'addresstype')
  final String? addresstype;

  // Display name.
  @JsonKey(name: 'display_name')
  final String? displayName;

  // Name.
  @JsonKey(name: 'name')
  final String? name;

  // Address.
  @JsonKey(name: 'address')
  final Address? address;

  // Bounding box.
  @JsonKey(name: 'boundingbox')
  final List<String>? boundingbox;

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => _$PlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);

  @override
  List<Object?> get props => [
        placeId,
        licence,
        osmType,
        osmId,
        latitude,
        longitude,
        placeRank,
        category,
        type,
        importance,
        addresstype,
        displayName,
        name,
        address,
        boundingbox,
      ];

  @override
  String toString() {
    return 'PlaceResponse{placeId: $placeId, licence: $licence, osmType: $osmType, osmId: $osmId, latitude: $latitude, longitude: $longitude, placeRank: $placeRank, category: $category, type: $type, importance: $importance, addresstype: $addresstype, displayName: $displayName, name: $name, address: $address, boundingbox: $boundingbox}';
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Address extends Equatable {
  const Address({
    this.road,
    this.village,
    this.stateDistrict,
    this.state,
    this.postcode,
    this.country,
    this.countryCode,
  });

  // Road.
  @JsonKey(name: 'road')
  final String? road;

  // Village.
  @JsonKey(name: 'village')
  final String? village;

  // State district.
  @JsonKey(name: 'state_district')
  final String? stateDistrict;

  // State.
  @JsonKey(name: 'state')
  final String? state;

  // Postcode.
  @JsonKey(name: 'postcode')
  final String? postcode;

  // Country.
  @JsonKey(name: 'country')
  final String? country;

  // Country code.
  @JsonKey(name: 'country_code')
  final String? countryCode;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props => [
        road,
        village,
        stateDistrict,
        state,
        postcode,
        country,
        countryCode,
      ];

  @override
  String toString() {
    return 'Address{road: $road, village: $village, stateDistrict: $stateDistrict, state: $state, postcode: $postcode, country: $country, countryCode: $countryCode}';
  }
}

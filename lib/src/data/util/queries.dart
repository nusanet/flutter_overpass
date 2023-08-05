class Queries {
  static const nearbyPlacesByCoordinate =
      '[out:json]; node(around::{radius},:{latitude},:{longitude})[name]; out body;';
}

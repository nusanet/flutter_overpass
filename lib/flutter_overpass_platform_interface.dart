import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_overpass_method_channel.dart';

abstract class FlutterOverpassPlatform extends PlatformInterface {
  /// Constructs a FlutterOverpassPlatform.
  FlutterOverpassPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterOverpassPlatform _instance = MethodChannelFlutterOverpass();

  /// The default instance of [FlutterOverpassPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterOverpass].
  static FlutterOverpassPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterOverpassPlatform] when
  /// they register themselves.
  static set instance(FlutterOverpassPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

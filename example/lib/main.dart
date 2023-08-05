import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_overpass/flutter_overpass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterOverpassPlugin = FlutterOverpass();
  final _isLoading = ValueNotifier<bool>(false);
  final _controllerLatitude = TextEditingController(text: '3.5764070599333397');
  final _controllerLongitude = TextEditingController(text: '98.68233751995223');
  final _controllerRadius = TextEditingController(text: '200');
  final _controllerAddress = TextEditingController(text: 'Rihanna Drive');
  final _controllerQuery = TextEditingController(text: 'node(around:200,37.79396544487583,-122.3838801383972);');

  String _results = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    _isLoading.dispose();
    _controllerLatitude.dispose();
    _controllerLongitude.dispose();
    _controllerRadius.dispose();
    _controllerAddress.dispose();
    _controllerQuery.dispose();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterOverpassPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const Text(
                    'Results:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Text(_results),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Center(
                          child: Text('Running on: $_platformVersion\n'),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Latitude'),
                          controller: _controllerLatitude,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Longitude'),
                          controller: _controllerLongitude,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Radius'),
                          controller: _controllerRadius,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Address'),
                          controller: _controllerAddress,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              if (_controllerLongitude.text.isEmpty ||
                                  _controllerLatitude.text.isEmpty ||
                                  _controllerRadius.text.isEmpty) return;
                              _isLoading.value = true;
                              setState(() {
                                _results = '';
                              });
                              final result = await _flutterOverpassPlugin.getNearbyNodes(
                                latitude: double.parse(_controllerLatitude.text),
                                longitude: double.parse(_controllerLongitude.text),
                                radius: double.parse(_controllerRadius.text),
                              );
                              setState(() {
                                _results = result.toString();
                              });
                              _isLoading.value = false;
                            },
                            child: const Text('Get Nearby Nodes'),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              if (_controllerLongitude.text.isEmpty || _controllerLatitude.text.isEmpty) return;
                              _isLoading.value = true;
                              setState(() {
                                _results = '';
                              });
                              final result = await _flutterOverpassPlugin.getPlaceFromCoordinate(
                                latitude: double.parse(_controllerLatitude.text),
                                longitude: double.parse(_controllerLongitude.text),
                              );
                              setState(() {
                                _results = result.toString();
                              });
                              _isLoading.value = false;
                            },
                            child: const Text('Get Place From Coordinate'),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              if (_controllerAddress.text.isEmpty) return;
                              _isLoading.value = true;
                              setState(() {
                                _results = '';
                              });
                              final result = await _flutterOverpassPlugin.searchAddress(
                                address: _controllerAddress.text,
                              );
                              setState(() {
                                _results = result.map((e) => e.toString()).join('\n');
                              });
                              _isLoading.value = false;
                            },
                            child: const Text('Search Address'),
                          ),
                        ),
                        const SizedBox(
                          height: 44,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Overpass Query'),
                          controller: _controllerQuery,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              _isLoading.value = true;
                              setState(() {
                                _results = '';
                              });
                              final result = await _flutterOverpassPlugin.rawOverpassQL(
                                query: 'node(around:200,37.79396544487583,-122.3838801383972);',
                              );
                              setState(() {
                                _results = result.toString();
                              });
                              _isLoading.value = false;
                            },
                            child: const Text('Run query'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (BuildContext context, bool value, Widget? child) {
                return value
                    ? Container(
                        color: Colors.black.withOpacity(0.5),
                        width: double.infinity,
                        height: double.infinity,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

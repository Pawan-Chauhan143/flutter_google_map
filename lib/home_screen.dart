import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGoogleplex = const CameraPosition(
      target: LatLng(26.921734793953686, 80.94798034448957), zoom: 14);

  final List<Marker> _marker = [];
  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(26.921734793953686, 80.94798034448957),
        infoWindow: InfoWindow(title: 'My Position')),

    /*Marker(markerId: MarkerId('2'),
        position: LatLng(26.75756029918021, 83.36957508665404),
        infoWindow:InfoWindow(
            title: 'Gorakhpur'
        )),
    Marker(markerId: MarkerId('2'),
        position: LatLng(23.75756029918021, 65.36957508665404),
        infoWindow:InfoWindow(
            title: 'Gorakhpur'
        )),*/
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          compassEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(_marker),
          initialCameraPosition: _kGoogleplex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 100.0),
        child: FloatingActionButton(
          onPressed: () {
            funGoogleMapController();
          },
          child: const Icon(Icons.location_disabled_outlined),
        ),
      ),
    );
  }

  Future<void> funGoogleMapController() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        const CameraPosition(target: LatLng(62.71125847664226, 90.88474409949114))));
    setState(() {});
  }
}

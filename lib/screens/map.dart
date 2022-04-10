import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondScreen extends StatefulWidget {
  LatLng showLocation;
  String name;
  String street;
  String type;

  SecondScreen({this.name, this.showLocation, this.street, this.type });

  @override
  State<StatefulWidget> createState() {
    return _SecondScreenState(this.name, this.showLocation, this.street, this.type);
  }}

class _SecondScreenState extends State<SecondScreen> {
  LatLng showLocation;
  String name;
  String street;
  String type;

  GoogleMapController mapController; //controller for Google map
  final Set<Marker> markers = new Set(); //markers for google map
  final Geolocator geolocator = Geolocator(); //controller for geolocator to find current location

  _SecondScreenState(this.name, this.showLocation, this.street, this.type);

  LatLng user=null;

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currLocation){
      setState((){
        user = new LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View selected station"),
        backgroundColor: Colors.green,
      ),
      body: user == null ? const Center(child:CircularProgressIndicator()) : GoogleMap( //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: showLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),
        markers: getmarkers(),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }

  Set<Marker> getmarkers()
  {
    setState(() {
      markers.add(  //station marker
        Marker(
          markerId: MarkerId(showLocation.toString()),
          position: showLocation, //position of marker
          infoWindow: InfoWindow(title: '$name', snippet: '$street',),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),),
      );
      markers.add( //user marker
        Marker(
          markerId: const MarkerId('User'),
          position: user, //position of marker
          infoWindow: const InfoWindow(title: 'You are here!', snippet: 'This is your location.',),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),),
      );
    },);
    return markers;
  }
}
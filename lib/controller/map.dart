import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scrap_it/pathsAndConsts.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class SecondScreen extends StatefulWidget {
  LatLng showLocation;
  String name;
  String street;

  SecondScreen({this.name, this.showLocation, this.street});

  @override
  State<StatefulWidget> createState() {
    return _SecondScreenState(name, showLocation, street );
  }}

class _SecondScreenState extends State<SecondScreen> {
  LatLng showLocation;
  String name;
  String street;

  LatLng user=null;

  Map<PolylineId, Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates=[];

  GoogleMapController mapController; //controller for Google map
  final Set<Marker> markers = Set(); //markers for google map
  final Geolocator geolocator = Geolocator(); //controller for geolocator to find current location

  _SecondScreenState(this.name, this.showLocation, this.street);

  @override
  void initState()
  {
    super.initState();
     Geolocator.getCurrentPosition().then((currLocation){
      setState((){
        user = new LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
     print(user);
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
          position: user,
          infoWindow: const InfoWindow(title: 'You are here!', snippet: 'This is your location.',),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),),
      );
    },);
    return markers;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View selected station"),
        backgroundColor: Colors.green,
      ),
      body: user == null ? const Center(child:CircularProgressIndicator()) :
      GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: showLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),
        markers: getmarkers(),
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        onMapCreated: _onMapCreated,
        polylines: Set<Polyline>.of(polylines.values),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _createPolyLines() async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey, // Google Maps API Key
      PointLatLng(user.latitude, user.longitude),
      PointLatLng(showLocation.latitude, showLocation.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 10,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
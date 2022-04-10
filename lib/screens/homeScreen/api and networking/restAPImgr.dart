import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import '../../stations_model.dart';

class RestAPImgr{
  Position _currentPosition;
  final endpointURL = 'https://siddhantpathakk.github.io/json_api/data.json';

  Future<List<Station>> getStation() async {
    print('err1');
    var response = await get(Uri.parse(endpointURL));
    print('err2');
    var tagObjsJson = jsonDecode(response.body)['station'] as List;
    print('err3');
    List<Station> tagObjs = tagObjsJson.map((tagJson) => Station.fromJson(tagJson)).toList();
    print('err4');
    print(tagObjs);
    return tagObjs;
  }

  //get current geo-coordinates of the device
  LatLng _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      _currentPosition = position;
    });
    return LatLng(_currentPosition.latitude, _currentPosition.longitude);
  }

  //calculate the distance b/w 2 geo-coordinates
  double CalculateDistance(dst_lat,dst_lng){
    LatLng user = _getCurrentLocation();
    //  getLocation();
    double src_lat=double.parse(user.latitude.toString());
    double src_lng=double.parse(user.longitude.toString());
    double distanceInMeters = Geolocator.distanceBetween(src_lat, src_lng, dst_lat, dst_lng);
    return distanceInMeters/1000;
  }

  //get the nearest e-waste recycling station
  Station getNearestPlace(List<Station> _stations) {

    Station nearest = _stations[0];

    double minDist = 10000000000;

    for (Station place in _stations) {

      double dst_lat = double.parse(place.latitude);

      double dst_lng = double.parse(place.longitude);

      double tempDist = CalculateDistance( dst_lat, dst_lng);

      if (minDist > tempDist) {
        minDist = tempDist;
        nearest = place;
      }

    }
    return nearest;
  }
}

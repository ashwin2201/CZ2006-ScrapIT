import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:scrap_it/screens/stations_model.dart';

class RestAPImgr{
  Position _currentPosition;
  final endpointURL = 'https://siddhantpathakk.github.io/json_api/data.json';

  Future<List<Station>> getStation() async {
    var response = await get(Uri.parse(endpointURL));
    var tagObjsJson = jsonDecode(response.body)['station'] as List;
    List<Station> tagObjs = tagObjsJson.map((tagJson) => Station.fromJson(tagJson)).toList();
    return tagObjs;
  }


  Future<LatLng> getCurrentLocation() async {
    try {
      print('er1');
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print('er2');
      double latitude = position.latitude;
      print('er13');
      double longitude = position.longitude;
      print('er4');
      return LatLng(latitude, longitude);
    } catch (e) {
      print(e);
    }
  }

  //calculate the distance b/w 2 geo-coordinates
  double CalculateDistance(dst_lat,dst_lng, cur_lat, cur_lng){
    double distanceInMeters = Geolocator.distanceBetween(cur_lat, cur_lng, dst_lat, dst_lng);
    return distanceInMeters/1000;
  }

  //get the nearest e-waste recycling station
  Future<Station> getNearestPlace(List<Station> _stations) async {
    print('a1');
    Station nearest = _stations[0];
    print('a2');
    double minDist = 10000000000;
    print('a3');
    print(nearest.toString());
    print('a4');
    LatLng _user = await getCurrentLocation();
    print('a5');
    print(_user.latitude);
    print('a6');
    double cur_lat = _user.latitude;
    print('a7');
    double cur_lng = _user.longitude;
    print('a8');

    /*for (Station place in _stations) {
      print(place);
      double dst_lat = double.parse(place.latitude);
      double dst_lng = double.parse(place.longitude);
      double tempDist = CalculateDistance( dst_lat, dst_lng);
      if (minDist > tempDist) {
        minDist = tempDist;
        nearest = place;
      }
    }*/
    for (int i =0; i<_stations.length; i++){
      Station place = _stations[i];
      double dst_lat = double.parse(place.latitude);
      double dst_lng = double.parse(place.longitude);
      double tempDist = CalculateDistance( cur_lat, cur_lng, dst_lat, dst_lng);
      if (minDist > tempDist) {
        minDist = tempDist;
        nearest = place;
      }
    }
    return nearest;
  }
}

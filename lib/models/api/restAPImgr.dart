import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:scrap_it/models/stations_model.dart';

class RestAPImgr{
  final endpointURL = 'https://siddhantpathakk.github.io/json_api/data.json';

  Future<List<Station>> getStation() async {
    var response = await get(Uri.parse(endpointURL));
    var tagObjsJson = jsonDecode(response.body)['station'] as List;
    List<Station> tagObjs = tagObjsJson.map((tagJson) => Station.fromJson(tagJson)).toList();
    return tagObjs;
  }


  Future<LatLng> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      double latitude = position.latitude;
      double longitude = position.longitude;
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
    Station nearest = _stations[0];
    double minDist = 10000000000;
    print(nearest.toString());
    LatLng _user = await getCurrentLocation();
    print(_user.latitude);
    double cur_lat = _user.latitude;
    double cur_lng = _user.longitude;

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

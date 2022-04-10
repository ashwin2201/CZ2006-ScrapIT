import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scrap_it/screens/stations_model.dart';

import 'homeScreen/api and networking/restAPImgr.dart';
import 'map.dart';

class ListAllStnScreen extends StatefulWidget {
  const ListAllStnScreen({Key key}) : super(key: key);

  @override
  State<ListAllStnScreen> createState() => _ListAllStnScreenState();
}

class _ListAllStnScreenState extends State<ListAllStnScreen> {
  RestAPImgr _mgr = RestAPImgr();
  List<Station> _locations=[];

  @override
  void initState(){
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of all e-waste recycling stations'),),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
                child: const Text('Get the nearest station'),
                onPressed: () async {
                  Station _loc = await _mgr.getNearestPlace(_locations);
                  String _name = _loc.building;
                  LatLng _coords = LatLng(double.parse(_loc.latitude), double.parse(_loc.longitude));
                  String _street = _loc.street;
                  await Navigator.push( context, MaterialPageRoute(builder: (context) => SecondScreen(name: _name, showLocation: _coords, street: _street),),);
                }),

            _locations.isNotEmpty ?
            Expanded(
              child: ListView.builder(
                itemCount: _locations.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Text('Station #'+(index+1).toString()),
                      title: Text(_locations[index].building),
                      subtitle: Text(_locations[index].street),
                      onTap: () async {
                        String _name = _locations[index].building;
                        LatLng _coords = LatLng(double.parse(_locations[index].latitude.toString()),double.parse(_locations[index].longitude),);
                        String _street = _locations[index].street;
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecondScreen(name:_name,
                                  showLocation : _coords,
                                  street: _street,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }

  Future<void> readJson() async {
    List<Station> data = await _mgr.getStation();
    setState(() {
      _locations=data;
    });
  }
}

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
  List _locations =[];
  RestAPImgr _mgr = RestAPImgr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Refresh list of e-waste stations'),
              onPressed: readJson,
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
            ElevatedButton(
                child: const Text('Get the nearest station'),
                style: ElevatedButton.styleFrom(primary: Colors.green,),
                onPressed: () async {
                  List<Station> _stns = await _mgr.getStation();
                  print('works1-2');
                  Station _loc = await _mgr.getNearestPlace(_stns);
                  print('works1-3');
                  String _name = _loc.building;
                  LatLng _coords = LatLng(double.parse(_loc.latitude), double.parse(_loc.longitude));
                  String _street = _loc.street;
                  print('works1-4');
                  await Navigator.push( context, MaterialPageRoute(builder: (context) => SecondScreen(name: _name, showLocation: _coords, street: _street,),),);
                }),

            _locations.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _locations.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Text('Station #'+(index+1).toString()),
                      title: Text(_locations[index]["Building"].toString()),
                      subtitle: Text(_locations[index]['Street']),
                      onTap: () async {
                        String _name = _locations[index]["Building"].toString();
                        LatLng _coords = LatLng(double.parse(_locations[index]["latitude"].toString()),double.parse(_locations[index]["longitude"]),);
                        String _type = _locations[index]['E-waste final'].toString();
                        String _street = _locations[index]['Street'].toString();
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecondScreen(name:_name,
                                  showLocation : _coords,
                                  type: _type,
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
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _locations = data;
    });
  }
}

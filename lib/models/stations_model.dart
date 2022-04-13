class Station {
  String building;
  String street;
  String latitude;
  String longitude;

  Station({this.building, this.street, this.latitude, this.longitude});

  factory Station.fromJson(Map<String, dynamic> json) {
    final _building= json['Building'] as String;
    final  _street= json['Street'] as String;
    final _latitude= json['latitude'] as String;
    final _longitude= json['longitude'] as String;
    return Station(building: _building, street: _street, latitude: _latitude, longitude: _longitude);
  }

  @override
  String toString() {
    return '{ ${this.building}, ${this.street} }';
  }
}
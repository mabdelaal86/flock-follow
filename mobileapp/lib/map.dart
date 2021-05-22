import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Map1();
  }
}

class Map1 extends State {
  List<Marker> allMarkers = [];
  @override

  //covering circles user to determine who is closest to me and join me flock
  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId('1'),
      center: LatLng(40.7128, -74.0060),
      radius: 5500,
      strokeWidth: 1,
    )
  ]);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
            CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12.0),
            circles: circles,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/ ');
        },
        tooltip: "",
        child: Icon(Icons.access_alarm),
        backgroundColor: Colors.green,
      ),
    );
  }
}

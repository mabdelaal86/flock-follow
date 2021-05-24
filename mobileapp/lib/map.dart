import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'data/app_status.dart';
import 'data/member.dart';
import 'data/user.dart';
import 'data/flock.dart';
import 'members.dart';


class MapPage extends StatefulWidget {
  final AppStatus appStatus;

  const MapPage(this.appStatus, {Key key}) : super(key: key);

  @override
  _MapPage createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  List<User> members = [];
  StreamSubscription<Position> positionStream;
  GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => subscribeToPosition());
  }

  @override
  Future dispose() async {
    super.dispose();
    await positionStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          PopupMenuButton<String>(
            onSelected: (item) async {
              if (item == "/leave")
                await leave();
              else if (item == "/members")
                await openMembers();
              else if (item == "/advance")
                await advanceFlockStatus();
            },
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: "/leave",
                child: Text('Leave'),
                enabled: !widget.appStatus.isLeader,
              ),
              PopupMenuItem<String>(
                value: "/members",
                child: Text('Members'),
              ),
              PopupMenuItem<String>(
                value: "/advance",
                child: Text(widget.appStatus.flock.status == 'C' ? 'Start' : 'Finish'),
              ),
            ],
          ),
        ],
        title: Text(widget.appStatus.flock.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          onMapCreated: (controller) => _controller = controller,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.appStatus.user.latitude, widget.appStatus.user.longitude),
            zoom: 12.0,
          ),
          markers: members.map((m) => Marker(
            markerId: MarkerId(m.id.toString()),
            position: LatLng(m.latitude, m.longitude),
            infoWindow: InfoWindow(title: m.name),
            icon: BitmapDescriptor.defaultMarkerWithHue(getMarkerHue(m.id)),
          )).toSet(),
        ),
      ),
    );
  }

  Future advanceFlockStatus() async {
    if (widget.appStatus.flock.status == "C")
      await changeFlockStatus("S");
    else
      await changeFlockStatus("F");
  }

  Future changeFlockStatus(String status) async {
    setState(() {
      widget.appStatus.flock.status = status;
    });
    await updateFlock(widget.appStatus.flock);
    if (widget.appStatus.flock.status == "F")
      Phoenix.rebirth(context);
  }

  void subscribeToPosition() {
    positionStream = Geolocator.getPositionStream(
        desiredAccuracy: LocationAccuracy.best).listen(updateLocation);
  }

  Future updateLocation(Position position) async {
    if (position == null) {
      print("Unknown position");
      return;
    }

    print('Position: ${position.latitude}, ${position.longitude}');

    await updateUserLocation(position);
    await updateFlockLocation(position);
    await loadMemberLocations();
  }

  Future updateUserLocation(Position position) async {
    widget.appStatus.user.latitude = position.latitude;
    widget.appStatus.user.longitude = position.longitude;
    await updateUser(widget.appStatus.user);
  }

  Future updateFlockLocation(Position position) async {
    if (widget.appStatus.isLeader) {
      widget.appStatus.flock.latitude = position.latitude;
      widget.appStatus.flock.longitude = position.longitude;
      await updateFlock(widget.appStatus.flock);
    }
  }

  Future loadMemberLocations() async {
    final data = await getFlockMembers(widget.appStatus.flock.id);
    setState(() => members = data);
  }

  Future leave() async {
    await leaveFlock(
        widget.appStatus.flock.id, widget.appStatus.user.id);

    Phoenix.rebirth(context);
  }

  openMembers() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MembersPage(widget.appStatus)),
    );
  }

  double getMarkerHue(memberId) {
    if (memberId == widget.appStatus.flock.leaderId)
      return BitmapDescriptor.hueRed;
    if (memberId == widget.appStatus.user.id)
        return BitmapDescriptor.hueOrange;
    return BitmapDescriptor.hueBlue;
  }
}

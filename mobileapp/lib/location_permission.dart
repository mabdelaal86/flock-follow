import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'data/user_location.dart';
import 'utilities.dart';


class LocationPermission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: Text('Settings'),
      // ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("We need your location to show near by flocks and "
                   "to allow other users to follow you when you start a flock."),
              ElevatedButton(
                child: Text('Allow Location Services'),
                onPressed: () async => await askForPermission(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future askForPermission(BuildContext context) async {
    try {
      await requestLocationPermission();

      Phoenix.rebirth(context);
    }
    catch (ex) {
      await showAlert(context, ex, "Access Location Failed");
    }
  }
}
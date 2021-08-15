import 'package:location/location.dart';

/// Determine the current position of the device.
Future<LocationData> getLocation() async {
  Location location = Location();

  var serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  }

  var permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return Future.error('Location permissions are denied');
    }
  }

  return location.getLocation();
}

Future<bool> isLocationAllowed() async {
  Location location = Location();

  var serviceEnabled = await location.serviceEnabled();
  var permissionGranted = await location.hasPermission();

  return serviceEnabled && permissionGranted == PermissionStatus.granted;
}

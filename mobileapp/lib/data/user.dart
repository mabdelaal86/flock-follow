import 'dart:convert';

import 'package:flock_follow/data/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  int id;
  String name;
  String about;
  String phone;
  String status;
  double latitude;
  double longitude;
  int joiningFlockId;
  int managingFlockId;

  User.fromJson(Map<String, dynamic> json):
        id = json['id'] as int,
        name = json['name'] as String,
        about = (json['about'] ?? "") as String,
        phone = (json['phone'] ?? "") as String,
        latitude = double.tryParse(json['latitude'] ?? ""),
        longitude = double.tryParse(json['longitude'] ?? ""),
        joiningFlockId = (json['joining_flock'] ?? 0) as int,
        managingFlockId = (json['managing_flock'] ?? 0) as int,
        status = json['status'] as String;
  
  int get currentFlockId =>
      managingFlockId > 0 ? managingFlockId : joiningFlockId;
}

Future<int> getUserLocalId() async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getInt('user_id') ?? 0;
  print('read: $value');
  return value;
}

Future setUserLocalId(int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('user_id', value);
  print('saved $value');
}

Future<User> readUser(id) async {
  final String data = await httpGet("users/$id/");
  return parseUser(data);
}

User parseUser(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final responseJson = json.decode(responseText);
  return User.fromJson(responseJson);
}

List<User> parseUsers(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final List responseJson = json.decode(responseText);
  return responseJson.map((jsonObject) => User.fromJson(jsonObject)).toList();
}

Future<User> createUser(
    String name,
    String phone,
    double latitude,
    double longitude) async {
  final String json = '{'
      '"name": "$name", '
      '"phone": "$phone", '
      '"latitude": "$latitude", '
      '"longitude": "$longitude"}';
  final String res = await httpPost('users/', json);
  return parseUser(res);
}

Future updateUser(User user) async {
  final String json = '{'
      '"id": ${user.id}, '
      '"name": "${user.name}", '
      '"about": "${user.about}", '
      '"phone": "${user.phone}", '
      '"latitude": "${user.latitude}", '
      '"longitude": "${user.longitude}"}';
  await httpPut('users/${user.id}/', json);
}

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

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        about = json['about'] as String,
        phone = json['phone'] as String,
        status = json['status'] as String,
        latitude = json['latitude'] as double,
        longitude = json['longitude'] as double;
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
  final String data = await httpGet("/users/$id/");
  return parseUser(data);
}

User parseUser(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final responseJson = json.decode(responseText);
  return User.fromJson(responseJson);
}

Future<User> createUser(String name, String phone) async {
  final String json = '{"name": "$name", "phone": "$phone"}';
  final String res = await httpPost('/users/', json);
  return parseUser(res);
}

Future updateUser(User user) async {
  final String json = '{"id": ${user.id}, "name": "${user.name}", "about": "${user.about}", "phone": "${user.phone}"}';
  await httpPut('/users/${user.id}/', json);
}

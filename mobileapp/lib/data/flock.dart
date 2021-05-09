import 'dart:convert';

import 'package:flock_follow/data/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Flocks {
  int id;
  String title;
  String description;
  String password;
  String destination;
  double latitude;
  double longitude;
  int leader_id;

  Flocks.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        description = json['description'] as String,
        password = json['password'] as String,
        destination = json['destination'] as String,
        latitude = json['latitude'] as double,
        longitude = json['longitude'] as double,
        leader_id = json['leader_id'] as int;
}

Future<int> getFlocksLocalId() async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getInt('flock_id') ?? 0;
  print('read: $value');
  return value;
}

Future setFlocksLocalId(int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('flock_id', value);
  print('saved $value');
}

Future<Flocks> readFlocks(id) async {
  final String data = await httpGet("/flocks/$id/");
  return parseFlocks(data);
}

Flocks parseFlocks(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final responseJson = json.decode(responseText);
  return Flocks.fromJson(responseJson);
}

Future<Flocks> createFlocks(
    String title, String description, String password) async {
  final String json =
      '{"title": "$title", "description": "$description","description": "$password"}';
  final String res = await httpPost('/flocks/', json);
  return parseFlocks(res);
}

Future updateFlocks(Flocks flock) async {
  final String json =
      '{"id": ${flock.id}, "title": "${flock.title}", "description": "${flock.description}", "password": "${flock.password}"}';
  await httpPut('/flocks/${flock.id}/', json);
}

import 'dart:convert';

import 'package:flock_follow/data/backend.dart';

class Flock {
  int id;
  String title;
  String description;
  String status;
  String password;
  String destination;
  double latitude;
  double longitude;
  DateTime createdAt;
  DateTime startedAt;
  DateTime finishedAt;
  int leaderId;

  Flock.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        description = json['description'] as String,
        status = json['status'] as String,
        password = json['password'] as String,
        destination = json['destination'] as String,
        latitude = double.tryParse(json['latitude'] ?? ""),
        longitude = double.tryParse(json['longitude'] ?? ""),
        createdAt = DateTime.tryParse(json["created_at"]),
        startedAt = DateTime.tryParse(json["started_at"] ?? ""),
        finishedAt = DateTime.tryParse(json["finished_at"] ?? ""),
        leaderId = json['leader'] as int;
}

Future<Flock> readFlock(id) async {
  final String data = await httpGet("/flocks/$id/");
  return parseFlock(data);
}

Future<List<Flock>> findFlocks(double lat, double lng) async {
  final String data = await httpGet("/flocks/?lat=$lat&lng=$lng");
  return parseFlocks(data);
}

Flock parseFlock(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final responseJson = json.decode(responseText);
  return Flock.fromJson(responseJson);
}

List<Flock> parseFlocks(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final List responseJson = json.decode(responseText);
  return responseJson.map((jsonObject) => Flock.fromJson(jsonObject)).toList();
}
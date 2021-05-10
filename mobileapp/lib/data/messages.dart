import 'dart:convert';
import 'package:flock_follow/data/backend.dart';
import 'package:flock_follow/data/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

//review the code
class Messages {
  int id;
  String content;
  DateTime date_time;
  int user_id;
  int flock_id;

  Messages.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        content = json['content'] as String,
        date_time = json['date_time'] as DateTime,
        user_id = json['user_id'] as int,
        flock_id = json['flock_id'] as int;
}

Future<int> getMessagesLocalId() async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getInt('flock_id') ?? 0;
  print('read: $value');
  return value;
}

Future setMessagesLocalId(int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('flock_id', value);
  print('saved $value');
}

Future<Messages> readMessages(flock_id, user_id) async {
  final String data = await httpGet("/flocks/$flock_id/members/$user_id/");
  return parseMessages(data);
}

Messages parseMessages(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final responseJson = json.decode(responseText);
  return Messages.fromJson(responseJson);
}

Future<Messages> createMessages(
    String content, DateTime date_time, int user_id, int flock_id) async {
  final String json = '{"content": "$content"}';
  final DateTime = '{"date_time": "$date_time"}';
  final int = '{"user_id": "$user_id", "flock_id": "$flock_id"}';
  final String res =
      await httpPost('/flocks/$flock_id/members/$user_id/', json);
  return parseMessages(res);
}

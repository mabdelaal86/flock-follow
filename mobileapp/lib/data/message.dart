import 'dart:convert';
import 'package:flock_follow/data/backend.dart';

class Message {
  int id;
  String content;
  DateTime date_time;
  int user_id;
  int flock_id;

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        content = json['content'] as String,
        date_time = json['date_time'] as DateTime,
        user_id = json['user_id'] as int,
        flock_id = json['flock_id'] as int;
}

Future<Message> readMessage(flockId, userId) async {
  final String data = await httpGet("/flocks/$flockId/members/$userId/");
  return parseMessage(data);
}

Message parseMessage(String responseText) {
  if (responseText == null || responseText.isEmpty) {
    return null;
  }

  final responseJson = json.decode(responseText);
  return Message.fromJson(responseJson);
}

Future<Message> createMessage(
    String content, DateTime dateTime, int userId, int flockId) async {
  final String json = '{"content": "$content"}';
  final DateTime = '{"date_time": "$dateTime"}';
  final int = '{"user_id": "$userId", "flock_id": "$flockId"}';
  final String res =
      await httpPost('/flocks/$flockId/members/$userId/', json);
  return parseMessage(res);
}

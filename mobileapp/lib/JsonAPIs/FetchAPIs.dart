import 'package:flutter/material.dart';
import 'package:flock_follow/JsonAPIs/JsonModel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

//not work the api
class FetchAPIs {
  //Only gateway and api update
  Future<List<JsonModel>> fetchStories() async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/todos/1");

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      List<JsonModel> stories = [];
      for (var item in body) {
        stories.add(JsonModel.fromJson(item));
      }
      return stories;
    }
    return null;
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
//not work the api

class JsonModel {
  int leader;
  int user;
  int flock;
  Double latitude;
  Double longitude;
  String name;
  String about;
  String phone;
  String status;
  String title;
  String description;
  String password;
  String destination;
  String members;
  String content;
  DateTime created_at;
  DateTime activated_at;
  DateTime started_at;
  DateTime finished_at;

  JsonModel(
      @required this.created_at,
      @required this.user,
      @required this.flock,
      @required this.latitude,
      @required this.longitude,
      @required this.name,
      @required this.about,
      @required this.phone,
      @required this.status,
      @required this.activated_at,
      @required this.title,
      @required this.description,
      @required this.password,
      @required this.destination,
      @required this.started_at,
      @required this.finished_at,
      @required this.leader,
      @required this.members,
      @required this.content);

  JsonModel.fromJson(Map<String, dynamic> Map) {
    this.created_at = Map['created_at']['url'];
    this.user = Map['user']['url'];
    this.flock = Map['flock']['url'];
    this.latitude = Map['latitude']['url'];
    this.longitude = Map['longitude']['url'];
    this.name = Map['name']['url'];
    this.about = Map['about']['url'];
    this.phone = Map['phone']['url'];
    this.status = Map['status']['url'];
    this.activated_at = Map['activated_at']['url'];
    this.title = Map['title']['url'];
    this.description = Map['description']['url'];
    this.password = Map['password']['url'];
    this.destination = Map['destination']['url'];
    this.started_at = Map['started_at']['url'];
    this.finished_at = Map['finished_at']['url'];
    this.leader = Map['leader']['url'];
    this.members = Map['members']['url'];
    this.content = Map['content']['url'];
  }
}

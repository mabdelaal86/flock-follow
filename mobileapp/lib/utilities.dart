import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildMessage(String message) =>
    Scaffold(body: Center(child: Text(message)));

Widget buildAlert(dynamic ex, String title) =>
    AlertDialog(title: Text(title), content: Text(ex.toString()));

void showAlert(BuildContext context, dynamic ex, String title) =>
    showDialog(
      context: context,
      builder: (context) => buildAlert(ex, title),
    );

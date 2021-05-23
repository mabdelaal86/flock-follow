import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildMessage(String message) =>
    Scaffold(body: Center(child: Text(message)));

Widget buildAlert(dynamic ex, String title) =>
    AlertDialog(title: Text(title), content: Text(ex.toString()));

Future showAlert(BuildContext context, dynamic ex, String title) =>
    showDialog(
      context: context,
      builder: (context) => buildAlert(ex, title),
    );

Future<String> showInputDialog(BuildContext context, String title, {
  String hintText = "",
  String message = "",
  bool obscureText = false,
  String obscuringCharacter = "*",
}) {
  String value;
  return showDialog(
      context: context,
      builder: (context) => WillPopScope(
        child: AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message, style: TextStyle(color: Colors.grey)),
              TextFormField(
                decoration: InputDecoration(hintText: hintText),
                autofocus: true,
                obscureText: obscureText,
                obscuringCharacter: obscuringCharacter,
                onChanged: (text) => value = text,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context, null)),
            TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context, value)),
          ],
        ),
        onWillPop: () async {
          Navigator.pop(context, null);
          return true;
        },
      ),
    );
}

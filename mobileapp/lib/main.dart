import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'data/app_status.dart';
import 'appbar.dart';
import 'utilities.dart';
import 'home.dart';
import 'register.dart';

void main() => runApp(
    Phoenix(child: MyApp())
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flock Follow',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppStatus>(
      future: getAppStatus(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return buildMessage("Loading...");
        if (!snapshot.data.registered)
          return RegisterPage();
        if (!snapshot.data.joinedFlock)
          return HomePage(snapshot.data);
        return AppBarPage(snapshot.data);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:flock_follow/App/appbar.dart';
import 'package:flock_follow/App/utilities.dart';
import 'package:flock_follow/App/settings.dart';
import 'package:flock_follow/App/home.dart';
import 'package:flock_follow/App/register.dart';
import 'package:flock_follow/App/new_flock_page.dart';
import 'package:flock_follow/data/user.dart';

void main() => runApp(
    Phoenix(child: MyApp())
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flock Follow',
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        "/settings": (BuildContext context) => SettingsPage(),
        "/new-flock": (BuildContext context) => NewFlockPage(),
        "/appbar": (BuildContext context) => AppBarPage(),
        // "/Join_flock": (BuildContext) => JoinFlock(),
      },
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
    return FutureBuilder<int>(
      future: getUserLocalId(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return buildMessage("Loading...");
        if (snapshot.data == 0)
          return RegisterPage();
        return HomePage();
      },
    );
  }
}

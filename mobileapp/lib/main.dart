import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:flock_follow/App/settings.dart';
import 'package:flock_follow/App/home.dart';
import 'package:flock_follow/data/user.dart';
import 'package:flock_follow/App/register.dart';

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
        // "/New_Flock": (BuildContext context) => AddFlock(),
        // "/appbar": (BuildContext) => AppBarMapMembersMessages(),
        // "/Join_flock": (BuildContext) => JoinFlock(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() { return _MainPage(); }
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getUserLocalId(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Scaffold(body: Center(child: Text("Loading...")));
        if (snapshot.data == 0) return RegisterPage();
        return HomePage();
      },
    );
  }
}

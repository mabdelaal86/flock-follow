import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'members.dart';
import 'messages.dart';
import 'map.dart';

class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () => Navigator.of(context).pushNamed('/appbar')),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: 'Members'),
                Tab(text: 'Map'),
                Tab(text: 'Messages'),
              ],
            ),
            title: Text('ver home new flock name'),
          ),
          body: TabBarView(
            children: [
              Members(),
              Map(),
              Messages(),
            ],
          ),
        ),
      ),
    );
  }
}

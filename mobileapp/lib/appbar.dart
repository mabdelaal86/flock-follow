import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'data/app_status.dart';
import 'members.dart';
import 'messages.dart';
import 'map.dart';

class AppBarPage extends StatelessWidget {
  final AppStatus appStatus;

  const AppBarPage(this.appStatus, {Key key}) : super(key: key);

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
                  onPressed: () => Phoenix.rebirth(context)
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: 'Members'),
                Tab(text: 'Map'),
                Tab(text: 'Messages'),
              ],
            ),
            title: Text(appStatus.flock.title),
          ),
          body: TabBarView(
            children: [
              MembersPage(appStatus),
              Map(),
              Messages(),
            ],
          ),
        ),
      ),
    );
  }
}

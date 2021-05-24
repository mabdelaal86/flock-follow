import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'data/app_status.dart';
import 'data/flock.dart';
import 'data/member.dart';
import 'members.dart';
import 'messages.dart';
import 'map.dart';

class AppBarPage extends StatefulWidget {
  final AppStatus appStatus;

  const AppBarPage(this.appStatus, {Key key}) : super(key: key);

  @override
  _AppBarPage createState() => _AppBarPage();
}

class _AppBarPage extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () => Phoenix.rebirth(context)
              ),
              PopupMenuButton<String>(
                onSelected: (item) async {
                  if (item == "/leave") {
                    await leaveFlock(
                        widget.appStatus.flock.id, widget.appStatus.user.id);

                    Phoenix.rebirth(context);
                  }
                },
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "/leave",
                    child: Text('Leave'),
                    enabled: !widget.appStatus.isLeader,
                  ),
                ],
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: 'Members'),
                Tab(text: 'Map'),
                // Tab(text: 'Messages'),
              ],
            ),
            title: Text(widget.appStatus.flock.title),
          ),
          body: TabBarView(
            children: [
              MembersPage(widget.appStatus),
              MapPage(widget.appStatus),
              Messages(),
            ],
          ),
          floatingActionButton: !widget.appStatus.isLeader ? null : FloatingActionButton(
            onPressed: () async => await advanceFlockStatus(),
            child: Icon(floatingIcon()),
            backgroundColor: Colors.green,
          ),
        ),
    );
  }

  IconData floatingIcon() {
    if (widget.appStatus.flock.status == "C")
      return Icons.directions_run;
    if (widget.appStatus.flock.status == "S")
      return Icons.close;
    return Icons.error_outline;
  }

  Future advanceFlockStatus() async {
    if (widget.appStatus.flock.status == "C")
      await changeFlockStatus("S");
    else
      await changeFlockStatus("F");
  }

  Future changeFlockStatus(String status) async {
    setState(() {
      widget.appStatus.flock.status = status;
    });
    await updateFlock(widget.appStatus.flock);
    if (widget.appStatus.flock.status == "F")
      Phoenix.rebirth(context);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'data/flock.dart';
import 'data/member.dart';
import 'data/user_location.dart';
import 'data/app_status.dart';
import 'settings.dart';
import 'utilities.dart';
import 'new_flock_page.dart';

class HomePage extends StatefulWidget {
  final AppStatus appStatus;

  const HomePage(this.appStatus, {Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Flock> _flocks = <Flock>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadFlocks(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flocks to Follow'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => loadFlocks(context),
          ),
          PopupMenuButton<String>(
            onSelected: (route) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => onMenuSelection(route)),
              );
            },
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "/settings",
                child: Text('Settings'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: _flocks.map((flock) =>
            Card(
              child: ListTile(
                title: Text(flock.title),
                subtitle: Text(flock.flockStatus),
                onTap: () => askForPassword(flock),
              ),
            )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewFlockPage()),
          );
        },
        tooltip: "new flock",
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget onMenuSelection(String route) {
    if (route == "/settings")
      return SettingsPage(widget.appStatus);
    throw "Unknown route!";
  }

  loadFlocks(BuildContext context) async {
    try {
      final l = await determinePosition();
      print("* Location: {$l}");
      final flocks = await findFlocks(l.latitude, l.longitude);
      print("* Flocks: ${flocks.length}");
      setState(() => _flocks = flocks);
    }
    catch (ex) {
      await showAlert(context, ex, "Loading failed");
    }
  }

  askForPassword(Flock flock) async {
    final pwd = await showInputDialog(context, "Join Flock",
      hintText: "Enter Password",
      message: "To join/view this flock you must provide a password.\n\nPlease contact the flock leader for the password.",
      obscureText: true,
    );
    if (pwd == null || pwd == "")
      return;
    if (pwd != flock.password) {
      await showAlert(context, "Wrong password!", "Join Failed");
      return;
    }
    await joinFlock(flock.id, widget.appStatus.user.id);

    Phoenix.rebirth(context);
  }
}

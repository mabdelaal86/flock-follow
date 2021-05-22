import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'data/flock.dart';
import 'data/user_location.dart';
import 'utilities.dart';

class HomePage extends StatefulWidget {
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
              Navigator.of(context).pushNamed(route);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                  value: "/settings",
                  child: Text('Settings'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: _flocks.map((flock) => Card(
          child: ListTile(
            title: Text(flock.title),
            subtitle: Text(flock.flockStatus),
            trailing: Image(
              image: NetworkImage("https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78"),
              width: 100,
              height: 100,
            ),
          ),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/new-flock');
        },
        tooltip: "new flock",
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
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
      showAlert(context, ex, "Loading failed");
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flock_follow/AddFlock.dart';
import 'package:flock_follow/settings.dart';
import 'package:flock_follow/appbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';




void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
      routes: <String , WidgetBuilder>{
      
        "/AddFlock": (BuildContext  context) => AddFlock(),
        "/settings": (IconButton ) => ButtonSettings(),
        "/appbar": (BuildContext ) => AppBarMapMembersMessages(),

      },
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flocf to Follow'),
        actions: [
          IconButton(icon:Icon(Icons.settings), onPressed: () {Navigator.of(context).pushNamed('/settings');}),

          
          IconButton(icon:Icon(Icons.account_balance), onPressed: () {Navigator.of(context).pushNamed('/appbar');}),

          //refresh Home Page
          IconButton(icon:Icon(Icons.refresh), onPressed:null )
        ],
      ),
        
      
      
        floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.of(context).pushNamed('/AddFlock');},
        tooltip: "new flock",
        child: Icon(Icons.add),
        backgroundColor: Colors.green,

      ),
    );
  }
}

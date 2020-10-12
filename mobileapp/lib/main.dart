import 'package:flutter/material.dart';
import 'package:flock_follow/Join_flock.dart';
import 'package:flock_follow/New_Flock.dart';
import 'package:flock_follow/Settings.dart';
import 'package:flock_follow/appbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'dart:async';



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
      
        "/New_Flock": (BuildContext  context) => AddFlock(),
        "/settings": (IconButton ) => ButtonSettings(),
        "/appbar": (BuildContext ) => AppBarMapMembersMessages(),
        "/Join_flock": (BuildContext ) =>  JoinFlock(),

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
        title: const Text('Flock to Follow'),
        backgroundColor: Colors.lightGreen,

        actions: [
          IconButton(icon:Icon(Icons.settings), onPressed: () {Navigator.of(context).pushNamed('/settings');}),   
          //refresh Home Page
          IconButton(icon:Icon(Icons.refresh), onPressed:() {Navigator.of(context).pushNamed('/main');} ),
          IconButton(icon:Icon(Icons.menu), onPressed:null ),  
        ],
      ),
      body: Row(
  children: <Widget>[
    Expanded(
      child: Text('name flock', textAlign: TextAlign.center),
      
    ),
    
    Expanded(
      child: FittedBox(
        fit: BoxFit.contain, // otherwise the logo will be tiny
        child: const FlutterLogo(),
      ),
    ),
  ],
),
              
        floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.of(context).pushNamed('/New_Flock');},
        tooltip: "new flock",
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

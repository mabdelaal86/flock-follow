import 'package:flutter/material.dart';

class ButtonSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return addflock();
  }
}

class addflock extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Settings'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: "settings",
          child: Icon(Icons.check),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null), 
                  hintText: 'Name'),
              ),
              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null),
                  hintText: 'About'),
              ),
              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null),
                  hintText: 'Phone'),
              ),
              //Profile Photo               
            ],
          ),
        )
      )
    ;
  }
}
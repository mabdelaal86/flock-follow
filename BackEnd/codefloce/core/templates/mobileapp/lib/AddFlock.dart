import 'package:flutter/material.dart';

class AddFlock extends StatefulWidget {
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
          title: Text('Add Flock'),
          actions: [
            //SAVE Button
          ],

        ),
        body: Container(
          child: Column(
            children: <Widget>[

              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null), 
                  hintText: 'Flock Name'),
              ),

              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(Icons.local_play),
                  hintText: 'Destination'),
              ),

              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null),
                  hintText: 'Password'),
              ),
            ],
          ),
        )
      )
    ;
  }
}
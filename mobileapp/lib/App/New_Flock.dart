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
          backgroundColor: Colors.lightGreen,
          title: Text('New Flock'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Navigator.of(context).pushNamed('/Join_flock');
                }),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: null,
                decoration:
                    InputDecoration(icon: Icon(null), hintText: 'Flock Name'),
              ),
              TextField(
                controller: null,
                decoration: InputDecoration(
                    icon: Icon(Icons.map), hintText: 'Destination'),
              ),
              TextField(
                controller: null,
                decoration:
                    InputDecoration(icon: Icon(null), hintText: 'Password'),
              ),
            ],
          ),
        ));
  }
}

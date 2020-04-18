import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('flockfollow'),
        backgroundColor: Color.fromARGB(170, 0, 0, 0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ],
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: () => debugPrint("floatingActionButton"),
        tooltip: "new flock",
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

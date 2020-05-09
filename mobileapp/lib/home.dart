import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Flock Follow'),
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
      ),
    );
  }
}

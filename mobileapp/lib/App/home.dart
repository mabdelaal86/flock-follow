import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:flock_follow/App/Join_flock.dart';
// import 'package:flock_follow/App/New_Flock.dart';
import 'package:flock_follow/App/settings.dart';
// import 'package:flock_follow/App/appbar.dart';
// import 'package:flock_follow/JsonAPIs/FetchAPIs.dart';
// import 'package:flock_follow/JsonAPIs/JsonModel.dart';
import 'package:flock_follow/data/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FetchAPIs fetchAPIs = FetchAPIs();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flocks to Follow'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Navigator.of(context).pushNamed('/main');
            },
          ),
          PopupMenuButton<String>(
            onSelected: (route) {
              Navigator.of(context).pushNamed(route);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                  value: "/settings", child: Text('Settings')),
            ],
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/New_Flock');
            },
            tooltip: "create new flock",
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
          )
        ],
      ),

      // body: ListView(children: <Widget>[
      //   Card(
      //       child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
      //     child: Row(
      //       children: <Widget>[
      //         Container(
      //             child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: <Widget>[
      //               Row(
      //                 children: <Widget>[
      //                   Text(
      //                     'go the sea',
      //                     style: TextStyle(
      //                         fontSize: 14.0,
      //                         fontFamily: 'Roboto',
      //                         color: Color(0xFF212121)),
      //                   ),
      //                 ],
      //               ),
      //               Row(
      //                 children: <Widget>[
      //                   Text(
      //                     'standby',
      //                     style: TextStyle(
      //                         fontSize: 14.0,
      //                         fontFamily: 'Roboto',
      //                         color: Color(0xFF9E9E9E)),
      //                   ),
      //                 ],
      //               ),
      //             ])),
      //         Container(
      //             padding: EdgeInsets.only(right: 13.0),
      //             child: Image(
      //               image: NetworkImage(
      //                   'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
      //               width: 120,
      //               height: 120,
      //             )),
      //       ],
      //     ),
      //   )),
      //   FloatingActionButton(
      //     onPressed: () {
      //       Navigator.of(context).pushNamed('/New_Flock');
      //     },
      //     tooltip: "new flock",
      //     child: Icon(Icons.add),
      //     backgroundColor: Colors.green,
      //   )
      // ])
    );
  }
}

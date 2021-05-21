import 'package:flutter/material.dart';
import 'package:flock_follow/App/home.dart';
import 'package:flock_follow/App/appbar.dart';

class JoinFlock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JoinFlock(); //erre name
  }
}

class _JoinFlock extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Text('Join a Flock'),
          Text('To join/view this flock you povide a password.'),
          Text('Please contact the flock leader for the passwrd.'),
          TextFormField(
            controller: null,
            decoration: InputDecoration(icon: Icon(null), hintText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some Password';
              }
              return null;
            },
          ),
          Row(
            children: [
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/home'),
                  child: const Text('Cancel'),
                ),
              ),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/appbar'),
                  child: const Text('JOIN'),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

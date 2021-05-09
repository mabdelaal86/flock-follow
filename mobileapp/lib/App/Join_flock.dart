import 'package:flutter/material.dart';

class JoinFlock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return addflock(); //erre name
  }
}

class addflock extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Text('Join a Flock'),
          Text('To join/view this flock you povide a password.'),
          Text('Please contact the flock leader for the passwrd.'),
          TextField(
            controller: null,
            decoration: InputDecoration(icon: Icon(null), hintText: 'Password'),
          ),
          Row(
            children: [
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/main');
                  },
                  child: Text('CANCEL'),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/appbar');
                  },
                  child: Text('JOIN'),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flock_follow/App/home.dart';
import 'package:flock_follow/App/appbar.dart';


class JoinFlock extends StatefulWidget {
  @override
  _JoinFlock createState() {
    return _JoinFlock();
  }
}

class _JoinFlock extends State<JoinFlock> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Join a Flock')));
                    }
                  },

                child: const Text('JOIN'),
                ),
              ),
            ],
          )        
        ],
      ),
    );
  }
}
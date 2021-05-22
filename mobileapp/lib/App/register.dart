import 'package:flock_follow/App/utilities.dart';
import 'package:flock_follow/data/user_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:flock_follow/data/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _userName;
  String _userPhone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: buildForm(),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            validator: validateName,
            onSaved: (newValue) => _userName = newValue,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: validatePhone,
            onSaved: (newValue) => _userPhone = newValue,
          ),
          Spacer(),
          ElevatedButton(
            child: Text('Register'),
            onPressed: saveData,
          )
        ],
      ),
    );
  }

  String validateName(String value) {
    if (value == null || value.trim().isEmpty)
      return "Name is required!";
    return null;
  }

  String validatePhone(String value) {
    // if (value == null || value.trim().isEmpty)
    //   return "Phone is required!";
    return null;
  }

  saveData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        final l = await determinePosition();
        print("* Location: {$l}");
        final User user = await createUser(_userName, _userPhone, l.latitude, l.longitude);
        await setUserLocalId(user.id);
        Phoenix.rebirth(context);
      }
      catch (ex) {
        showAlert(context, ex, "Registration failed");
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'data/user_location.dart';
import 'data/flock.dart';
import 'data/user.dart';
import 'utilities.dart';

class NewFlockPage extends StatefulWidget {
  @override
  _NewFlockPage createState() {
    return _NewFlockPage();
  }
}

class _NewFlockPage extends State<NewFlockPage> {
  final _formKey = GlobalKey<FormState>();
  String _flockTitle;
  String _flockDestination;
  String _flockPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('New Flock'),
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
            decoration: const InputDecoration(labelText: 'Title'),
            validator: validateTitle,
            onSaved: (newValue) => _flockTitle = newValue,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Destination'),
            onSaved: (newValue) => _flockDestination = newValue,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            onSaved: (newValue) => _flockPassword = newValue,
            validator: validatePassword,
          ),
          Spacer(),
          ElevatedButton(
            child: Text('Save'),
            onPressed: saveData,
          )
        ],
      ),
    );
  }

  String validateTitle(String value) {
    if (value == null || value.trim().isEmpty)
      return "Title is required!";
    return null;
  }

  String validatePassword(String value) {
    if (value == null || value.trim().isEmpty)
      return "Password is required!";
    return null;
  }

  saveData() async {
    if (_formKey.currentState.validate()) {
      context.loaderOverlay.show();
      _formKey.currentState.save();

      try {
        final userId = await getUserLocalId();
        final l = await getLocation();
        await createFlock(
            _flockTitle, _flockDestination, _flockPassword,
            l.latitude, l.longitude, userId);

        Phoenix.rebirth(context);
      }
      catch (ex) {
        showAlert(context, ex, "Creating new flock failed");
      }
    }
  }
}

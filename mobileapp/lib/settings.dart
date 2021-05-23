import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'data/app_status.dart';
import 'data/user.dart';
import 'utilities.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = "";
  final AppStatus appStatus;

  const SettingsPage(this.appStatus, {Key key}) : super(key: key);

  @override
  _SettingsPage createState() {
    return _SettingsPage();
  }
}

class _SettingsPage extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Settings'),
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
            initialValue: widget.appStatus.user.name,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: validateName,
            onSaved: (newValue) => widget.appStatus.user.name = newValue,
          ),
          TextFormField(
            initialValue: widget.appStatus.user.about,
            decoration: const InputDecoration(labelText: 'About'),
            validator: validateAbout,
            onSaved: (newValue) => widget.appStatus.user.about = newValue,
          ),
          TextFormField(
            initialValue: widget.appStatus.user.phone,
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: validatePhone,
            onSaved: (newValue) => widget.appStatus.user.phone = newValue,
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

  String validateName(String value) {
    if (value == null || value.trim().isEmpty)
      return "Name is required!";
    return null;
  }

  String validateAbout(String value) {
    // if (value == null || value.trim().isEmpty)
    //   return "About is required!";
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
        await updateUser(widget.appStatus.user);
        Navigator.pop(context);
      }
      catch (ex) {
        showAlert(context, ex, "Update settings failed");
        Phoenix.rebirth(context);
      }
    }
  }
}

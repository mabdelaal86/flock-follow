import 'package:flock_follow/data/user.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPage createState() { return _SettingsPage(); }
}

class _SettingsPage extends State<SettingsPage> {
  User user;
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
        child: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return buildMessage(snapshot.error.toString());
            if (!snapshot.hasData)
              return buildMessage("Loading...");
            return buildForm();
          },
        ),
      ),
    );
  }

  Widget buildMessage(String message) => Scaffold(body: Center(child: Text(message)));

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: user.name,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: validateName,
            onSaved: (newValue) => user.name = newValue,
          ),
          TextFormField(
            initialValue: user.about,
            decoration: const InputDecoration(labelText: 'About'),
            onSaved: (newValue) => user.about = newValue,
          ),
          TextFormField(
            initialValue: user.phone,
            decoration: const InputDecoration(labelText: 'Phone'),
            onSaved: (newValue) => user.phone = newValue,
            validator: validatePhone,
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

  String validatePhone(String value) {
    if (value == null || value.trim().isEmpty)
      return "Phone is required!";
    return null;
  }

  Future<User> loadData() async {
    final userId = await getUserLocalId();

    user = await readUser(userId);
    print("name: " + user.name);

    return user;
  }

  saveData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await updateUser(user);
      Navigator.pop(context);
    }
  }
}

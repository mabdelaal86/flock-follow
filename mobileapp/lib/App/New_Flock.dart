import 'package:flock_follow/data/flock.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPage createState() {
    return _SettingsPage();
  }
}

class _SettingsPage extends State<SettingsPage> {
  Flocks flock;
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
            if (!snapshot.hasData) return buildMessage("Loading...");
            return buildForm();
          },
        ),
      ),
    );
  }

  Widget buildMessage(String message) =>
      Scaffold(body: Center(child: Text(message)));

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: flock.title,
            decoration: const InputDecoration(labelText: 'Flock Name'),
            validator: validatetitle,
            onSaved: (newValue) => flock.title = newValue,
          ),
          TextFormField(
            initialValue: flock.destination,
            decoration: const InputDecoration(labelText: 'Destination'),
            onSaved: (newValue) => flock.destination = newValue,
          ),
          TextFormField(
            initialValue: flock.password,
            decoration: const InputDecoration(labelText: 'Password'),
            onSaved: (newValue) => flock.password = newValue,
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

  String validatetitle(String value) {
    if (value == null || value.trim().isEmpty) return "Flock Name is required!";
    return null;
  }

  String validateDestination(String value) {
    if (value == null || value.trim().isEmpty)
      return "Destination is required!";
    return null;
  }

  String validatePassword(String value) {
    if (value == null || value.trim().isEmpty) return "Password is required!";
    return null;
  }

  Future<Flocks> loadData() async {
    final userId = await getFlocksLocalId();

    flock = await readFlocks(userId);
    print("title: " + flock.title);

    return flock;
  }

  saveData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await updateFlocks(flock);
      Navigator.pop(context);
    }
  }
}


//             IconButton(
//                 icon: Icon(Icons.save),
//                 onPressed: () {
//                   Navigator.of(context).pushNamed('/Join_flock');
//                 }),
//////////////////////////////////////////////////

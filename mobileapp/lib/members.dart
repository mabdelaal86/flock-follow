import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data/app_status.dart';
import 'data/member.dart';
import 'data/user.dart';
import 'utilities.dart';

class MembersPage extends StatefulWidget {
  final AppStatus appStatus;

  const MembersPage(this.appStatus, {Key key}) : super(key: key);

  @override
  _MembersPage createState() => _MembersPage();
}

class _MembersPage extends State<MembersPage> {
  List<User> _members = <User>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadMembers(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Members"),
      ),
      body: ListView(
        children: _members.map((member) =>
            Card(
              child: ListTile(
                title: Text(member.name),
                subtitle: Text(member.about),
                trailing: member.phone.isEmpty ? null : IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () => launch("tel://${member.phone}"),
                ),
              ),
            )).toList(),
      ),
    );
  }

  loadMembers(BuildContext context) async {
    try {
      final members = await getFlockMembers(widget.appStatus.flock.id);
      setState(() => _members = members);
    }
    catch (ex) {
      await showAlert(context, ex, "Loading failed");
    }
  }

}


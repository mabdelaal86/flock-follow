import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Members extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildCard();
  }

  Widget _buildCard() => SizedBox(
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Mohamed Abdel-Aal'),
            leading: Icon(
              Icons.account_circle,
            ),
          ),
        ],
      ),
    ),
  );
}

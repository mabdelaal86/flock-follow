import 'package:flutter/material.dart';

class ButtonSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return addflock();
  }
}

class addflock extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Settings'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: "settings",
          child: Icon(Icons.check),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null), 
                  hintText: 'Name'),
              ),
              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null),
                  hintText: 'About'),
              ),
              TextField(
                controller: null,
                decoration: InputDecoration(
                  icon: Icon(null),
                  hintText: 'Phone'),
              ),
              Image(
                image: NetworkImage('https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
                width: 60,
                height: 60,
                )
              //Profile Photo               
            ],
          ),
        )
      )
    ;
  }
}
 
//  class addflock extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: SizedBox(
//           width: 400,
//           child: Card(
//             child: SignUpForm(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignUpForm extends StatefulWidget {
//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final _firstNameTextController = TextEditingController();
//   final _lastNameTextController = TextEditingController();
//   final _usernameTextController = TextEditingController();

//   double _formProgress = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           LinearProgressIndicator(value: _formProgress),
//           Text('Settings', style: Theme
//               .of(context)
//               .textTheme
//               .headline4),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _firstNameTextController,
//               decoration: InputDecoration(hintText: 'Name'),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _lastNameTextController,
//               decoration: InputDecoration(hintText: 'About'),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _usernameTextController,
//               decoration: InputDecoration(hintText: 'Phone'),
//             ),
//           ),
//           Image(
//                 image: NetworkImage('https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
//                 width: 60,
//                 height: 60,
//                 )
//         ],
//       ),
//     );
//   }
// }


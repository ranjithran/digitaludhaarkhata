// import 'dart:developer';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:digitaludhaarkhata/Core/FileLoader/FielLoader.dart';
import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/Services/startup.dart';
import 'package:digitaludhaarkhata/models/Data/CustomerJson.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
            onPressed: () async {
              var dat ={
                "1":{
                  "name":"ran",
                  DateTime.now():{
                    "gave":100,
                    "give":0909
                  }
                },
                "2":{
                  "name":"ran",
                  DateTime.now():{
                    "gave":100,
                    "give":0909
                  }
                },
                "3":{
                  "name":"ran",
                  DateTime.now():{
                    "gave":100,
                    "give":0909
                  }
                }
              };

              Map data= new Map();
              data.addAll(dat);
              print(data);
              data.remove("2");
              print(data);

            },
            child: Text("ran")));
  }
}
// class Test extends StatefulWidget {
//   Test({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   int counter = 0;
//   bool _gender = true;

//   incrementCounter() {
//     setState(() {
//       counter++;
//     });
//   }

//   switchGender(bool val) {
//     setState(() {
//       _gender = val;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     log(tr("title"), name: this.toString() );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("title").tr(),
//         actions: <Widget>[
//           FlatButton(
//             child: Icon(Icons.language),
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (_) => LanguageView(), fullscreenDialog: true),
//               // );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Spacer(
//               flex: 1,
//             ),
//             Text(
//               'switch.with_arg',
//               style: TextStyle(
//                   color: Colors.grey.shade600,
//                   fontSize: 19,
//                   fontWeight: FontWeight.bold),
//             ).tr(args: ["aissat"], gender: _gender ? "female" : "male"),
//             Text(
//               tr('switch', gender: _gender ? "female" : "male"),
//               style: TextStyle(
//                   color: Colors.grey.shade600,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // Icon(MyFlutterApp.male_1),
//                 // Switch(value: _gender, onChanged: switchGender),
//                 // Icon(MyFlutterApp.female_1),
//               ],
//             ),
//             Spacer(
//               flex: 1,
//             ),
//             Text('msg').tr(args: ['aissat', 'Flutter']),
//             Text('clicked').plural(counter),
//             FlatButton(
//               onPressed: () {
//                 incrementCounter();
//               },
//               child: Text('clickMe').tr(),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 plural('amount', counter,
//                     format: NumberFormat.currency(
//                         locale: Intl.defaultLocale,
//                         symbol: "€")),
//                 style: TextStyle(
//                     color: Colors.grey.shade900,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold)),
//             SizedBox(
//               height: 20,
//             ),
//             Text('profile.reset_password.title').tr(),
//             Spacer(
//               flex: 2,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: incrementCounter,
//         child: Text('+1'),
//       ),
//     );
//   }
// }

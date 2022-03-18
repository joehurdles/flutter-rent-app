// import 'package:flutter/material.dart';
// import 'package:dropdown_formfield/dropdown_formfield.dart';


// class MyHomePagepp extends StatefulWidget {
//   @override
//   _MyHomePageppState createState() => _MyHomePageppState();
// }

// class _MyHomePageppState extends State<MyHomePagepp> {
//   late String _myActivity;
//   late String _myActivityResult;
//   final formKey = new GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _myActivity = '';
//     _myActivityResult = '';
//   }

//   _saveForm() {
//     var form = formKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       setState(() {
//         _myActivityResult = _myActivity;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown Formfield Example'),
//       ),
//       body: Center(
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(16),
//                 child: DropDownFormField(
//                   titleText: 'My workout',
//                   hintText: 'Please choose one',
//                   value: _myActivity,
//                   onSaved: (value) {
//                     setState(() {
//                       _myActivity = value;
//                     });
//                   },
//                   onChanged: (value) {
//                     setState(() {
//                       _myActivity = value;
//                     });
//                   },
//                   dataSource: [
//                     {
//                       "display": "Running",
//                       "value": "Running",
//                     },
//                     {
//                       "display": "Climbing",
//                       "value": "Climbing",
//                     },
//                     {
//                       "display": "Walking",
//                       "value": "Walking",
//                     },
//                     {
//                       "display": "Swimming",
//                       "value": "Swimming",
//                     },
//                     {
//                       "display": "Soccer Practice",
//                       "value": "Soccer Practice",
//                     },
//                     {
//                       "display": "Baseball Practice",
//                       "value": "Baseball Practice",
//                     },
//                     {
//                       "display": "Football Practice",
//                       "value": "Football Practice",
//                     },
//                   ],
//                   textField: 'display',
//                   valueField: 'value',
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 child: RaisedButton(
//                   child: Text('Save'),
//                   onPressed: _saveForm,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(16),
//                 child: Text(_myActivityResult),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
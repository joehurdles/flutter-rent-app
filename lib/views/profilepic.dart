// import 'dart:io';
// import 'package:equatable/equatable.dart';

// import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:unicons/unicons.dart';
// import 'package:image_cropper/image_cropper.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late File _image;
//   final picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   _showSelectionDialog();
//                 },
//                 child: Container(
//                   height: 150,
//                   width: 150,
//                   child: _image == null
//                       ? Image.asset('assets/images/user.png') // set a placeholder image when no photo is set
//                       : Image.file(_image),
//                 ),
//               ),
//               SizedBox(height: 50),
//               Text(
//                 'Please select your profile photo',
//                 style: TextStyle(fontSize: 22),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// 	/// Method for sending a selected or taken photo to the EditPage
//   Future selectOrTakePhoto(ImageSource imageSource) async {
//     final pickedFile = await picker.getImage(source: imageSource);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         Navigator.pushNamed(context, routeEdit, arguments: _image);
//       } else
//         print('No photo was selected or taken');
//     });
//   }

// 	/// Selection dialog that prompts the user to select an existing photo or take a new one
//   Future _showSelectionDialog() async {
//     await showDialog(
//       builder: (context) => SimpleDialog(
//         title: Text('Select photo'),
//         children: <Widget>[
//           SimpleDialogOption(
//             child: Text('From gallery'),
//             onPressed: () {
//               selectOrTakePhoto(ImageSource.gallery);
//               Navigator.pop(context);
//             },
//           ),
//           SimpleDialogOption(
//             child: Text('Take a photo'),
//             onPressed: () {
//               selectOrTakePhoto(ImageSource.camera);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ), context: context, 
//     );
//   }
// }

// class EditPhotoPage extends StatefulWidget {
//   final File image;

//   const EditPhotoPage({required this.image});

//   @override
//   _EditPhotoPageState createState() => _EditPhotoPageState();
// }

// class _EditPhotoPageState extends State<EditPhotoPage> {
//   late File imageFile;

//   @override
//   void initState() {
//     super.initState();
//     imageFile = widget.image;
//     if (imageFile != null) _cropImage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

// Future<Null> _cropImage() async {
//     File? croppedFile = await ImageCropper.cropImage(
//         sourcePath: imageFile.path,
//         androidUiSettings: AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.blue,
//             hideBottomControls: true,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         iosUiSettings: IOSUiSettings(
//           title: 'Cropper',
//         ));

//   }
// }

// const String routeHome = '/home';
// const String routeEdit = '/edit';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case routeHome:
//         return MaterialPageRoute(builder: (_) => HomePage());
//               case routeEdit:
//         return MaterialPageRoute(
//             builder: (_) => EditPhotoPage(
//                   image: settings.arguments,
//                 ));
        
//     }
//   }
// }
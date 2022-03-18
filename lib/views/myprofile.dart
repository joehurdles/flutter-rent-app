
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_image_ppicker/home_screen.dart';
// import 'package:flutter_image_ppicker/image_picker_handler.dart';
// import 'package:flutter_image_ppicker/image_picker_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin,ImagePickerListener{

 File? _image;
  late AnimationController _controller;
  late ImagePickerHandler imagePicker;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker=ImagePickerHandler(this,_controller);
    imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
        style: const TextStyle(
          color: Colors.white
        ),
        ),
      ),
      body: GestureDetector(
        onTap: () => imagePicker.showDialog(context),
        child: Center(
          child: _image == null
              ? Stack(
                  children: <Widget>[

                    const Center(
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundColor: Color(0xFF778899),
                      ),
                    ),
                    Center(
                      child: Image.asset("assets\images\properties.jpg"),
                    ),

                  ],
                )
              : Container(
                  height: 160.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: ExactAssetImage('assets\images\properties.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border:
                        Border.all(color: Colors.red, width: 5.0),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(80.0)),
                  ),
                ),
        ),
      ),

    );
  }

  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}

class ImagePickerHandler {
  ImagePickerHandler(_HomeScreenState _homeScreenState, AnimationController controller);

  void init() {}

  showDialog(BuildContext context) {}

  openGallery() {}

  openCamera() {}
}

class ImagePickerListener {
}

class ImagePickerDialog extends StatelessWidget {
  ImagePickerHandler _listener;
  AnimationController _controller;
 late BuildContext context;
  ImagePickerDialog(this._listener, this._controller, {Key? key}) : super(key: key);
 late  Animation<double> _drawerContentsOpacity;
  late Animation<Offset> _drawerDetailsPosition;

  void initState() {
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  getImage(BuildContext context) {
    if (_controller == null ||
        _drawerDetailsPosition == null ||
        _drawerContentsOpacity == null) {
      return;
    }
    _controller.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) => SlideTransition(
            position: _drawerDetailsPosition,
            child: FadeTransition(
              opacity: ReverseAnimation(_drawerContentsOpacity),
              child: this,
            ),
          ),
    );
  }

  void dispose() {
    _controller.dispose();
  }

  startTime() async {
    var _duration = const Duration(milliseconds: 200);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pop(context);
  }

  dismissDialog() {
    _controller.reverse();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Material(
        type: MaterialType.transparency,
        child: Opacity(
          opacity: 1.0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _listener.openCamera(),
                  child: roundedButton(
                      "Camera",
                      const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      const Color(0xFF167F67),
                      const Color(0xFFFFFFFF)),
                ),
                GestureDetector(
                  onTap: () => _listener.openGallery(),
                  child: roundedButton(
                      "Gallery",
                      const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      const Color(0xFF167F67),
                      const Color(0xFFFFFFFF)),
                ),
                const SizedBox(height: 15.0),
                GestureDetector(
                  onTap: () => dismissDialog(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                    child: roundedButton(
                        "Cancel",
                        const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        const Color(0xFF167F67),
                        const Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget roundedButton(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = Container(
      margin: margin,
      padding: const EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
   
    );
    return loginBtn;
  }
}
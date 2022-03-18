import 'package:rent/views/regi_login.dart';
import 'package:rent/views/register_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:rent/views/houseGrid_view.dart';
import 'package:rent/views/noti_view.dart';
import 'package:rent/views/chat_view.dart';
=======
>>>>>>> e71ca6ed3ad7c8f27a1b4aa935aab028231268b3
import 'package:rent/views/dual_register.dart';

import 'package:rent/views/page_view.dart';
void main() {
  runApp(const Brent());
}

class Brent extends StatelessWidget {
  const Brent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'brent',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
<<<<<<< HEAD
       home: RegiLoginView(),
=======

      
      
      home: MainPage(),

>>>>>>> e71ca6ed3ad7c8f27a1b4aa935aab028231268b3
    );
  }
}

class MainPage extends StatefulWidget {
  

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  late SharedPreferences sharedPreferences;


  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null ){
      Navigator.push(context, MaterialPageRoute(builder: (_) => const DualRegisterView()));
    }

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('brent', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
        FlatButton(onPressed: () {
          sharedPreferences.clear();
          sharedPreferences.commit();
          Navigator.push(context, MaterialPageRoute(builder: (_) => const DualRegisterView()));

        }, 
        child: const Text(
          "Log out", 
          style: TextStyle(color: Colors.white
          )
        ),
        ),
      ],
      body: const Center(child: Text("Main Page")),
      drawer: Drawer(),
),
    );

  }
}
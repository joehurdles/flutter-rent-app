import 'package:flutter/material.dart';
import 'package:rent/views/landlord_register.dart';
import 'package:rent/views/ownerViewProfile.dart';
import 'package:rent/views/welcome_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LandlordLogin extends StatefulWidget {
  @override
  _LandlordLoginState createState() => _LandlordLoginState();
}
bool isLoading = false;


class _LandlordLoginState extends State<LandlordLogin> {

  createLogin(String email, String password) async {
  Map data = {
    'email': email,
    'password': password,
  };
  var jsonData = null;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final response = await http.post(
    Uri.parse('http://brnt-bac.herokuapp.com/api/users/landlord/sign-in'),
    // headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    //   'Accept': 'application/json',
    // },
    body: data,
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    var jsonData = json.decode(response.body);
    setState((){
      isLoading =false;
      sharedPreferences.setString("token", jsonData['token']);
      // Navigator.of(context).pushNamedAndRemoveUntil(HouseView(), (Route<dynamic> route ) => false);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerProfile()));
    });
    print(jsonData['token']);
   
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         leadingWidth: 60,
      leading:  Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: CircleAvatar(
              radius: 30,
              child: Image.asset('assets/images/loyalKenss.png')
             // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
          
            ),
      ),
        title: Text("brent"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
            
              child: Center(
                child: Container(
                    width: 100,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/loyalKenss.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
           SizedBox(
              height: 30,
           ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => OwnerProfile()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
              FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Text("Don't have an account?"),

            SizedBox(
              height: 10,
           ),
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LandlordRegisterView()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
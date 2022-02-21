import 'package:flutter/material.dart';
import 'package:rent/views/house_view.dart';
import 'package:rent/services/api_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<SignUp> createSignup(String firstName, String lastName, String location, String email, String password) async {
     final response = await http.post(
    Uri.parse('http://brnt-bac.herokuapp.com/api/users/landlord/sign-up'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstName' : firstName,
      'lastName' : lastName,
      'location' : location,
      'email': email,
      'password': password
    }),
  );
   
   if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return SignUp.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
   
    
  }

class SignUp {
  final int id;
  final String firstName;
  final String lastName;
  final String location;
  final String email;
  final String password;

  const SignUp({required this.id, required this.firstName, required this.lastName, required this.location, required this.email, required this.password});

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      location: json['location'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  Future<SignUp>? _futureSignup;

  APIManager apiService = APIManager();


  @override
  Widget build(BuildContext context) {
    return safearea();
 }

  Scaffold safearea() {
    return Scaffold(
    
     backgroundColor: Colors.white,
    // appBar: AppBar(
    //    leadingWidth: 60,
    // leading:  Padding(
    //   padding: const EdgeInsets.only(left: 28.0),
    //   child: CircleAvatar(
    //         radius: 30,
    //         child: Image.asset('assets/images/loyalKenss.png')
    //        // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
        
    //       ),
    // ),
    //   title: Text("brent"),
    // ),
     body: 
       Container(
   alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
       child: (_futureSignup == null) ? buildColumn() : buildFutureBuilder(),
    ),
    
  );
  }

Column buildColumn() {
  
  return  Column(

   children: <Widget>[
     
      Padding(
      padding: EdgeInsets.all(10),
        child: Center(
                child: Container(
                    width: 50,
                    height: 100,
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
                    labelText: 'FirstName',
                    hintText: 'Enter your first name'),
              ),
            ),
            SizedBox(
              height: 10,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'LastName',
                    hintText: 'Enter your Surname'),
              ),
            ),
            SizedBox(
              height: 10,
           ),
            //  Padding(
            //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Date of birth',
            //         hintText: 'Enter the date you were born.'),
            //   ),
            // ),
             SizedBox(
              height: 10,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                    hintText: 'Enter place name.'),
              ),
            ),
             SizedBox(
              height: 10,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    hintText: 'name@example.com'),
              ),
            ),
             SizedBox(
              height: 10,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Password',
                    hintText: 'Enter your password.'),
              ),
            ),
             SizedBox(
              height: 10,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Re-Enter Password',
                    hintText: 'Confirm your password.'),
              ),
            ),
              SizedBox(
              height: 10,
           ),
            Text("AGREE TO TERMS AND CONDITIONS"),
             SizedBox(
              height: 20,
           ),
             Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HouseView()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
             SizedBox(
              height: 20,
           ),
            Text("Already have an account?Login"),

         ]
          );
  }

}FutureBuilder<SignUp> buildFutureBuilder( ){
  String firstName = "kojo";
  String lastName = "yankson";
  String location = "tamso";
  String email = "yankson.kojo@yahoo.com";
  String password = "12345678";
  

  return FutureBuilder<SignUp>(
      //future:  _futureSignup,
      builder: (context, snapshot) {
        print(snapshot);

        if (snapshot.hasData) {
          return Text('Success!');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
  
    );
}
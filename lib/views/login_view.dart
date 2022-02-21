import 'package:flutter/material.dart';
import 'package:rent/views/house_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<SignIn> createLogin(String email, String password) async {
     final response = await http.post(
    Uri.parse('http://brnt-bac.herokuapp.com/api/users/landlord/sign-in'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password
    }),
  );
   
   if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(jsonDecode(response.body)['success']);   
    return SignIn.fromJson(jsonDecode(response.body)['success']);

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
   
    
  }

class SignIn {
  final int id;
  final String email;
  final String password;

  const SignIn({required this.id, required this.email, required this.password});

  factory SignIn.fromJson(Map<String, dynamic> json) {
    return SignIn(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  Future<SignIn>? _futureSignin;
  

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
      body: Container(
     alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
         child: (_futureSignin == null) ? buildColumn() : buildFutureBuilder(),
      ),
      
    );
 }

Column buildColumn() {
  
  return Column(
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
                controller: _controller,
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
                controller: _controller1,
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
                  
                  setState(() {
                    print(_controller.text);
                    print(_controller1.text);
               _futureSignin = createLogin(_controller.text, _controller1.text);
            });
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => WelcomeView()));
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
                      context, MaterialPageRoute(builder: (_) => HouseView()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

          ],
        );
}

FutureBuilder<SignIn> buildFutureBuilder( ){


  return FutureBuilder<SignIn>(

      future:  _futureSignin,
      builder: (context, snapshot) {
       
        print(snapshot);

        if (snapshot.hasData) {
          return Text('Success!');
        } else if (snapshot.hasError) {
          return Text('xxxx');
        }

        return const CircularProgressIndicator();
      },
    );
}


}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent/views/home_view.dart';
import 'package:rent/views/house_view.dart';
import 'package:rent/views/register_view.dart';
import 'dart:convert';

import 'package:rent/views/swipe_card.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
bool isLoading = false;

class _LoginState extends State<Login> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();


  Future<void> createLogin(String email, String password) async {
  Map data = {
    'email': email,
    'password': password,
  };
  var jsonData = null;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  try{
    final response = await http.post(
    Uri.parse('http://brnt-bac.herokuapp.com/api/users/tenant/sign-in'),
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
      Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeView()));
                
      
    });
    
    
   
  } else {
    setState((){
      isLoading =false;
        var snackBar = SnackBar(content: Text(json.decode(response.body)['message']));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

       });
  
  }

  }catch (e){

    if(e.toString() == "Expected a value of type 'String', but got one of type 'Null'"){
      setState((){
      isLoading =false;
        var snackBar = const SnackBar(content: Text('fields can not be empty!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
       });
      

    }else{
      setState((){
      isLoading =false;
      var snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

       });
      
      
    }

  }
  



}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leadingWidth: 60,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 28.0),
        //   child: CircleAvatar(
        //       radius: 30, child: Image.asset('assets/images/loyalKenss.png')
        //       // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')

        //       ),
        // ),
        title: const Text("LogIn"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: buildColumn(),
        
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SizedBox(
                width: 100,
                height: 200,
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                // child: Image.asset('assets/images/loyalKenss.png')
                ),
          ),
        ),
        Padding(
          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
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
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter secure password'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () {
              setState(() {
                isLoading = true;
                    
              });
              createLogin(_controller.text, _controller1.text);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => MyHomePage()));
            },
            child: isLoading ? const Center(child:  CircularProgressIndicator()) : const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        FlatButton(
          onPressed: () {
            // FORGOT PASSWORD SCREEN GOES HERE
          },
          child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
        const Text("Don't have an account?"),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterView()));
            },
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  // FutureBuilder<SignIn> buildFutureBuilder() {
  //   return FutureBuilder<SignIn>(
  //     future: _futureSignin,
  //     builder: (context, snapshot) {
  //       print(snapshot);
  //       print(snapshot.hasData);

  //       if (snapshot.hasData) {
  //         return Text('Success!');
  //       } else if (snapshot.hasError) {
  //         return Text('xxxx');
  //       }

  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }
}

// ignore_for_file: deprecated_member_use

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent/views/login_view.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dropdown_formfield/dropdown_formfield.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
 
 bool agree = false;
void _doSomething() {
    // Do something
  }

 
  bool isLoading =false;

  AuthButtonType? buttonType;
  AuthIconType? iconType;

  
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  registerTenant(String fullName, String phone, String email, String password) async {
  Map data = {
    'full_name': fullName,
    'phone': phone,
    'email': email,
    'password': password,
  };
  var jsonData = null;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  try {
    final response = await http.post(
    Uri.parse('http://brnt-bac.herokuapp.com/api/users/tenant/sign-up'),
    // headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    //   'Accept': 'application/json',
    // },
    body: data,
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    var jsonData = json.decode(response.body);
  
      isLoading =false;
      sharedPreferences.setString("token", jsonData['token']);
      // Navigator.of(context).pushNamedAndRemoveUntil(HouseView(), (Route<dynamic> route ) => false);
      print(jsonData['token']);
      

    
    
   
  } else {
    setState((){
      isLoading =false;
      var snackBar = SnackBar(content: Text(json.decode(response.body)['message']));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  }catch(e){

    if(e.toString() == "Expected a value of type 'String', but got one of type 'Null'"){

      setState((){
      isLoading =false;
      var snackBar = const SnackBar(content: Text('fields can not be empty!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
    });
      

    }else if(e.toString() == "XMLHttpRequest error."){

      setState((){
      isLoading =false;
      var snackBar = const SnackBar(content: Text('internet connection problem. Please check your internet and try again.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
    });
    }else{

       setState((){
      isLoading =false;

       });
      var snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
    }


  }

  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      // appBar: AppBar(
      // //    leadingWidth: 60,
      // // leading:  Padding(
      // //   padding: const EdgeInsets.only(left: 28.0),
      // //   child: CircleAvatar(
      // //         radius: 30,
      // //         child: Image.asset('assets/images/loyalKenss.png')
      // //        // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
          
      // //       ),
      // // ),
      //   title: const Text("Register"),
      // ),
       body:
       
Container(
        // alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: buildColumn(),
        
      ),
    );
  }

  Column buildColumn() {
    var children2 = <Widget>[
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SizedBox(
                width: 10,
                height: 10,
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                // child: Image.asset('assets/images/loyalKenss.png')
                ),
          ),
        ),
       
        const Align(
  alignment: Alignment.topLeft,
  child: Text("REGISTER", style: TextStyle(color: Colors.blueGrey, fontSize: 15),
          ),
          ),


const SizedBox(
height: 30,
),
           Padding( 
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _fullName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full name',
                    hintText: 'Enter your full name'),
                     validator: (value){
                if (value!.isEmpty){
                  return "Name is  required";
                }
                if (value.length <2){
                  return "Name is invalid";
                }
              },
              ),
            ),
      
            const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                    hintText: '0*********'
                    ),
                     validator: (value){
                if (value!.isEmpty){
                  return "Number is  required";
                }
                if (value.length <10){
                  return "Number is invalid";
                }
              },
              ),
            ),
             const SizedBox(
              height: 20,
           ),
           
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    hintText: 'name@example.com'),
                     validator: (value){
                if (value!.isEmpty){
                  return "Email is  required";
                }
                if (value.length <8){
                  return "E-mail is invalid";
                }
              },
              ),
            ),

    //         var _currencies = [
    //               "Property Owner",
    //              "Tenant"
    //               ];
                     
    //  FormField<String>(
    //       builder: (FormFieldState<String> state) {
    //         return InputDecorator(
    //           decoration: InputDecoration(
    //               labelStyle: textStyle,
    //               errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
    //               hintText: 'Please select account type',
    //               border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    //           isEmpty: _currentSelectedValue == '',
    //           child: DropdownButtonHideUnderline(
    //             child: DropdownButton<String>(
    //               value: _currentSelectedValue,
    //               isDense: true,
    //               onChanged: (String newValue) {
    //                 setState(() {
    //                   _currentSelectedValue = newValue;
    //                   state.didChange(newValue);
    //                 });
    //               },
    //               items: _currencies.map((String value) {
    //                 return DropdownMenuItem<String>(
    //                   value: value,
    //                   child: Text(value),
    //                 );
    //               }).toList(),
    //             ),
    //           ),

              
             const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                  obscureText: true,
                controller: _password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Password',
                    hintText: 'Enter your password.'),
                     validator: (value){
                if (value!.isEmpty){
                  return "Password is  required";
                }
                if (value.length <8){
                  return "Password should be 8 characters long";
                }
              },
              ),
            ),
             const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                  obscureText: true,
                controller: _password,
                decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                    labelText: 'Re-Enter Password',
                    hintText: 'Confirm your password.'),
                      validator: (value){
                if (value!.isEmpty){
                  return "Password is  required";
                }
                if (value.length <8){
                  return "Password is invalid";
                }
              },
              ),
            ),
              const SizedBox(
              height: 20,
           ),

           
            Column(children: [
        Row(
          children: [
            Material(
              child: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
              ),
            ),
            const Text(
              "By clicking 'Register' you agree with our Terms and Conditions",
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        ElevatedButton(
             onPressed: agree ? _doSomething : null,
            child: const Text('Register'))
      ]),
             const SizedBox(
              height: 20,
           ),
            //  Container(
            //   height: 40,
            //   width: 250,
            //   decoration: const BoxDecoration(
            //       color: Colors.blueGrey, borderRadius: BorderRadius.zero),
            //   child: FlatButton(
            //     onPressed: () {
              
            //     isLoading = true;
             
            //   registerTenant(_fullName.text, _phone.text, _email.text, _password.text);
            //   // Navigator.push(
            //   //     context, MaterialPageRoute(builder: (_) => MyHomePage()));
            // },

            //     // onPressed: () {
            //     //   Navigator.push(
            //     //       context, MaterialPageRoute(builder: (_) => const OwnerProfile()));
            //     // },
            //     child: const Text(
            //       'Register',
            //       style: TextStyle(color: Colors.white, fontSize: 15),
            //     ),
            //   ),
            // ),
           const Text("Already a member?"),
              // const SizedBox(
              //   height: 10,
              // ),
              
             TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: const Align( 
          alignment: Alignment.center,
                   child: Text(
                    'Login',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                     ),
                ),
 const SizedBox(
          height: 15,
        ),
            
    //          const Text("or use"),

    //              SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SizedBox(height: 24),
    //           GoogleAuthButton(
    //             onPressed: () {
    //               // your implementation
    //               setState(() {
    //                 isLoading = !isLoading;
    //               });
    //             },
    //           ),
    //           ],
    //  ),
    //        ),
          
  
  
     ];
    return Column(
      children: children2
          );
           }
        }
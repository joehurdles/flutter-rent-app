import 'package:flutter/material.dart';
import 'package:rent/views/ownerViewProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LandlordRegister extends StatefulWidget {
  @override
  _LandlordRegisterState createState() => _LandlordRegisterState();
}


class _LandlordRegisterState extends State<LandlordRegister> {
  
  bool isLoading =false;

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _otherNames = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> registerLandlord(String firstName, String lastName, String otherNames, String phone, String email, String password) async {
  Map data = {
    'first_name': firstName,
    'last_name': lastName,
    'other_names': otherNames,
    'phone': phone,
    'email': email,
    'password': password,
  };
  var jsonData = null;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  try{

    final response = await http.post(
    Uri.parse('http://brnt-bac.herokuapp.com/api/users/landlord/sign-up'),
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

  }catch (e){
    
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
        title: const Text("brent"),
      ),
       body:
        ListView(

      padding: const EdgeInsets.all(10),
        children: [
        Padding( 
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _firstName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'FirstName',
                    hintText: 'Enter your first name'),
              ),
            ),
            const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _lastName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'LastName',
                    hintText: 'Enter your Surname'),
              ),
            ),
            const SizedBox(
              height: 20,
           ),
           Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _otherNames,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'otherNames',
                    hintText: 'Enter your Other Name'),
              ),
            ),
            const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                    hintText: '024444444'
                    ),
              ),
            ),
             const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    hintText: 'name@example.com'),
              ),
            ),
             const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Password',
                    hintText: 'Enter your password.'),
              ),
            ),
             const SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _password,
                decoration: const InputDecoration(

                    border: OutlineInputBorder(),
                    labelText: 'Re-Enter Password',
                    hintText: 'Confirm your password.'),
              ),
            ),
              const SizedBox(
              height: 20,
           ),
            const Text("AGREE TO TERMS AND CONDITIONS"),
             const SizedBox(
              height: 20,
           ),
             Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
              
                isLoading = true;
             
              registerLandlord(_firstName.text, _lastName.text, _otherNames.text, _phone.text, _email.text, _password.text);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => MyHomePage()));
            },

                // onPressed: () {
                //   Navigator.push(
                //       context, MaterialPageRoute(builder: (_) => const OwnerProfile()));
                // },
                child: const Text(
                  'Register As Landlord',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
             const SizedBox(
              height: 30,
           ),
            const Text("Already have an account?Login"),

         ]
          )
    );
  }
}
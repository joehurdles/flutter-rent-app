import 'dart:convert';

import 'package:http/http.dart' as http;


class APIManager{
  String baseUrl = 'http://brnt-bac.herokuapp.com/api/apartment/all-houses';
  
  
  Future<List> getHouses() async {
    
   
    try {
    
       var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200){
        
        final json = jsonDecode(response.body)['success'];

            
        return json;

      }else{
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
    
   
    
  }



 
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
    return SignIn.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
   
    
  }

  getProfile() {}
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

 Future<SignUp> createSignUp(String firstName, String lastName, String location, String email, String password) async {
     final response = await http.post(
    Uri.parse('http://brnt-bac.herokuapp.com/api/users/landlord/sign-up'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password
    }),
  );
   
   if (response.statusCode == 201) {
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
  final int firstName;
  final int lastName;
  final int location;
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
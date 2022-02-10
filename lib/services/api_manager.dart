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


 String caseUrl = 'http://brnt-bac.herokuapp.com/api/users/landlord/sign-in';
 
  Future<List> getLogins() async {
    
   
    try {
    
       var response = await http.get(Uri.parse(caseUrl));
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
}
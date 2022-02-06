import 'dart:convert';

import 'package:http/http.dart' as http;


class APIManager{
  String baseUrl = 'http://127.0.0.1:8000/api/apartment/all-houses';
  
  
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
}
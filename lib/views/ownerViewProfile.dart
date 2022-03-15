import 'package:flutter/material.dart';
import 'package:rent/services/api_manager.dart';
import 'package:rent/views/card_view.dart';
import 'package:rent/views/chat_view.dart';
import 'package:rent/views/landlord_register.dart';

import 'houseGrid_view.dart';

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({ Key? key }) : super(key: key);

  @override
  State<OwnerProfile> createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  APIManager apiService = APIManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: IconButton(onPressed: (){Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>  CardView()));}, icon: Icon(Icons.arrow_back) ),
      title: const Text(
        "My Profile",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),),
      
    ),  
          body: Container(
            child: FutureBuilder(
              future: apiService.getProfile(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
         
          if (snapshot.hasData){
            String firstName = snapshot.data!["first_name"];
            String lastName = snapshot.data!["last_name"];
            String email = snapshot.data!["email"];
            String phone = snapshot.data!["phone"];
            

            return Column(
            children: [
        
          const SizedBox(
            height: 15,
          ),
          const CircleAvatar(  
            radius: 60,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80')
          ),
          const SizedBox(
            height: 10,

          ),
          Center(
            child: Text(firstName + ' ' + lastName, style:const TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
          ),
          const Center(
            child: Text('Tarkwa Ghana', style:TextStyle(fontSize:17,fontWeight: FontWeight.w500, color: Colors.black),
        ),
        ),
      Container(
        color: Colors.white.withOpacity(0.1),
        child: Column(
          children: [
           
            ListTile(
              title: const Text('Mobile', style:TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
        subtitle: Text(phone, style:const TextStyle(fontSize:16,fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        ),
           ListTile(
              title: const Text('Email', style:TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
        subtitle: Text(email, style:const TextStyle(fontSize:16,fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ),
          ]
        ), 
          ),
 const SizedBox(
              height: 40,
           ),
             Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                   Navigator.push(
                       context, MaterialPageRoute(builder: (_) => GridView1()));
                },
                child: Text(
                  'My Property',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
     const SizedBox(
              height: 40,
           ),

            Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => LandlordRegisterView()));
                },
                child: const Text(
                  'Upload Property',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            ]
          );

          }else{
            return const Center(
                child: Text('No data found'),
              );
          }
          
        }),
        
       ),
   );
  }
}

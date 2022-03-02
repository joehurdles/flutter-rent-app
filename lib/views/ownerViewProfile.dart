import 'package:flutter/material.dart';
import 'package:rent/services/api_manager.dart';
import 'package:rent/views/card_view.dart';
import 'package:rent/views/chat_view.dart';
import 'package:rent/views/landlord_register.dart';

class OwnerProfile extends StatelessWidget {
  const OwnerProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: IconButton(onPressed: (){Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>  CardView()));}, icon: Icon(Icons.arrow_back) ),
      title: const Text(
        "My Profile",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),),
    ),  
          body: ListView(
      
        children: [
        
          const SizedBox(
            height: 15,
          ),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80')
          ),
          const SizedBox(
            height: 10,

          ),
          Center(
            child: Text('Joe Asare', style:TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
          ),
          Center(
            child: Text('Tarkwa Ghana', style:TextStyle(fontSize:17,fontWeight: FontWeight.w500, color: Colors.black),
        ),
        ),
      Container(
        color: Colors.white.withOpacity(0.1),
        child: Column(
          children: [
           
            ListTile(
              title: Text('Mobile', style:TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
        subtitle: Text('+233245313051', style:TextStyle(fontSize:16,fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        ),
           ListTile(
              title: Text('Email', style:TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
        subtitle: Text('joeasare@gmail.com', style:TextStyle(fontSize:16,fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ),
          ]
        ), 
          ),
 SizedBox(
              height: 40,
           ),
           Center(
            child: Text('My Properties', style:TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
          ),
     SizedBox(
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
                child: Text(
                  'Upload Property',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            ],
       ),
   );
  }
}
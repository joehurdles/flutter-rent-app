import 'package:flutter/material.dart';
import 'package:rent/services/api_manager.dart';
import 'package:rent/views/card_view.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({ Key? key }) : super(key: key);

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
        "User's Profile",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],
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
        trailing: Row(mainAxisSize: MainAxisSize.min,
          children: [TextButton(onPressed: (){}, child: const Icon(Icons.message)),
          TextButton(onPressed: (){}, child: const Icon(Icons.call))
          ]
          
        ),
        ),
           ListTile(
              title: Text('Email', style:TextStyle(fontSize:19,fontWeight: FontWeight.w800, color: Colors.black),
        ),
        subtitle: Text('joeasare@gmail.com', style:TextStyle(fontSize:16,fontWeight: FontWeight.w500, color: Colors.grey),
        ),
         trailing: Row(mainAxisSize: MainAxisSize.min,
          children: [TextButton(onPressed: (){}, child: const Icon(Icons.email))
         ]
        ),
      ),
          ]
        ), 
          ),
        ],
       ),
   );
  }
}
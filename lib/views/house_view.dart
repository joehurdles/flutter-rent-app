// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:rent/services/api_manager.dart';
import 'package:rent/views/welcome_view.dart';

class HouseView extends StatefulWidget {
  static const routeName = '/house';

  HouseView({Key? key}) : super(key: key);

  @override
  State<HouseView> createState() => _HouseViewState();
}

class _HouseViewState extends State<HouseView> {
  // const HouseView({ Key? key }) : super(key: key);
  APIManager apiService = APIManager();

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

      body: Container(
        child: FutureBuilder<List>(
          future: apiService.getHouses(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            if(snapshot.hasData){
             
              return ListView.builder(
                
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i){
                
                  // print(snapshot.data![i]['success']);
                  // for (var query in snapshot.data![i]['success']){
                  String description = snapshot.data![i]["description"];
                  String location = snapshot.data![i]["location"];

                    return Card( 
                    child:
        ListTile(
          
          leading: Image.asset('assets/images/loyalKenss.png'),
           title: Text(description, 
           style:const TextStyle(
             fontSize:15,
             fontWeight: FontWeight.w800, 
             color: Colors.black),
             ),
             subtitle: Text("Location: "+location, style:const TextStyle(fontSize:12,fontWeight: FontWeight.w500, color: Colors.black),
        ),
           trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            
           Container(
              height: 25,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const WelcomeView()));
                },
                child: const Text(
                  'View',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
        )
          );
                  
            
          },

                // },
              
              padding: const EdgeInsets.all(30),
      
   
     
       
           
          
      );

            }else{
              return const Center(
                child: Text('No data found'),
              );
            }
          },
        ),
      ),
      
    );
 }
}
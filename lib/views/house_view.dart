// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:rent/services/api_manager.dart';
import 'package:rent/views/card_view.dart';

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
      // appBar: AppBar(
      // //   leadingWidth: 60,
      // //   leading:  Padding(
      // //   padding: const EdgeInsets.only(left: 28.0),
      // //   child: CircleAvatar(
      // //         radius: 30,
      // //         child: Image.asset('assets/images/loyalKenss.png')
      // //        // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
          
      // //       ),
      // // ),
      //   title: const Text("brent"),
      // ),

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

          return Column(
            children: [
              Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Container( 
                        height: 100, 
                        padding: const EdgeInsets.all(0),       
                      child:
                     Row(
                       children: [
                         Expanded(
                    flex:6,
                           child: Container(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context, MaterialPageRoute(builder: (_) => CardView()));
                                  },
                                  child:  Container(
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                                             fit: BoxFit.fitHeight, )
                                            )

                                            
                                               ),
                                ),
                            ),
                          ),
                          const Spacer(
                            flex:1,
                          ),

                          Expanded(
                            flex: 12,
                            child: Container(
                               padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[

                              Text(description,
                              maxLines: 2,
                         style:const TextStyle(
                          // overflow: ,
                           fontSize:15,
                           fontWeight: FontWeight.w600, 
                           color: Colors.black),
                           ),
                           const SizedBox(height: 6,),
                              Text("Location: "+location, style:const TextStyle(fontSize:12,fontWeight: FontWeight.w500, color: Colors.black),),
                              
                            ]
                            ),
                            ),
                            ),
                       ],
                     )
                      ),
                  ),
                ],
              ),
            ],
          );
        },

                // },
              
              padding: const EdgeInsets.all(30),
      
   
     
       
           
          
      );

            }else{
              return const Center(
                child: Text('Loading...'),
              );
            }
          },
        ),
      ),
      
    );
 }
}
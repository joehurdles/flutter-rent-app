import 'package:flutter/material.dart';
class WelcomeView extends StatefulWidget {
  const WelcomeView({ Key? key }) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //    leadingWidth: 60,
      // leading:  Padding(
      //   padding: const EdgeInsets.only(left: 28.0),
      //   child: CircleAvatar(
      //         radius: 30,
      //         child: Image.asset('assets/images/loyalKenss.png')
      //        // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
          
      //       ),
      // ),
      //   title: Text("brent"),
      // ),
      body:  ListView(
      padding: const EdgeInsets.all(30),
          children: <Widget>[ 
            const SizedBox(
              height: 150,
           ),
            Padding(
              padding: const EdgeInsets.all(40.0),
            
              child: Center(
                child: Container(
                    width: 150,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        padding: const EdgeInsets.only(top: 100.0,),
                    child: Image.asset('assets/images/loyalKenss.png')
                    ),
              ),
            ),
           
              const SizedBox(
              height: 130,
           ),
           Container(
                    width: 200,
                    height: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        padding: const EdgeInsets.only(left: 50.0),
                    child: Image.asset('assets/images/welcome.png')
                    ),
          ],
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:rent/views/dual_login.dart';
import 'package:rent/views/dual_register.dart';

class RegiLoginView extends StatefulWidget {
  const RegiLoginView({ Key? key }) : super(key: key);

  @override
  State<RegiLoginView> createState() => _RegiLoginViewState();
}

class _RegiLoginViewState extends State<RegiLoginView> {
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
           Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DualLoginView()));
                },
                child: const Text(
                  'LogIn',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            
             const SizedBox(
              height: 40,
           ),

             Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DualRegisterView()));
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
        ]
        ),
    );
  }
}
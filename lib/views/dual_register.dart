import 'package:flutter/material.dart';
import 'package:rent/views/landlord_register.dart';
import 'package:rent/views/register_view.dart';

class DualRegisterView extends StatefulWidget {
  const DualRegisterView({ Key? key }) : super(key: key);

  @override
  State<DualRegisterView> createState() => _DualRegisterViewState();
}

class _DualRegisterViewState extends State<DualRegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
      //    leadingWidth: 60,
      // leading:  Padding(
      //   padding: const EdgeInsets.only(left: 28.0),
      //   child: CircleAvatar(
      //         radius: 30,
      //         child: Image.asset('assets/images/loyalKenss.png')
      //        // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
          
      //       ),
      // ),
        title: const Text("Register"),
      ),
       body:
        ListView(

      padding: const EdgeInsets.all(10),
      
        children: [
           const SizedBox(
              height: 200,
           ),
         Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LandlordRegister()));
                },
                child: const Text(
                  'Register As Property Owner',
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
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RegisterView()));
                },
                child: const Text(
                  'Register As Tenant',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
         ]
          )
    );
  }
}
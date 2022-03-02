import 'package:flutter/material.dart';
import 'package:rent/views/ownerViewProfile.dart';

class LandlordRegisterView extends StatelessWidget {
  const LandlordRegisterView({ Key? key }) : super(key: key);

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
        title: Text("brent"),
      ),
       body:
        ListView(

      padding: EdgeInsets.all(10),
        children: [
        Padding( 
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'FirstName',
                    hintText: 'Enter your first name'),
              ),
            ),
            SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'LastName',
                    hintText: 'Enter your Surname'),
              ),
            ),
            SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                    hintText: 'Enter place name.'),
              ),
            ),
             SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    hintText: 'name@example.com'),
              ),
            ),
             SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Password',
                    hintText: 'Enter your password.'),
              ),
            ),
             SizedBox(
              height: 20,
           ),
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Re-Enter Password',
                    hintText: 'Confirm your password.'),
              ),
            ),
              SizedBox(
              height: 20,
           ),
            Text("AGREE TO TERMS AND CONDITIONS"),
             SizedBox(
              height: 20,
           ),
             Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => OwnerProfile()));
                },
                child: Text(
                  'Register As Landlord',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
             SizedBox(
              height: 30,
           ),
            Text("Already have an account?Login"),

         ]
          )
    );
  }
}
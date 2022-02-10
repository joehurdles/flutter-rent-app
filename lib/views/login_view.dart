import 'package:flutter/material.dart';
import 'package:rent/views/welcome_view.dart';
import 'package:rent/services/api_manager.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        title: Text("brent"),
      ),
      body: Container(
      child: FutureBuilder<List>(
          future: apiService.getLogins(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            if(snapshot.hasData){

              
             return ListView.builder(  

                itemCount: snapshot.data?.length,
                itemBuilder: (context, i){
                
                  // print(snapshot.data![i]['success']);
                  // for (var query in snapshot.data![i]['success']){
                  String Email = snapshot.data![i]["Email"];
                  String Password = snapshot.data![i]["Password"];

                    return Card( 
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
            
              child: Center(
                child: Container(
                    width: 100,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/loyalKenss.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
           SizedBox(
              height: 30,
           ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => WelcomeView()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
              FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Text("Don't have an account?"),

            SizedBox(
              height: 10,
           ),
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => WelcomeView()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

          ],
        ),
    );
  }
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
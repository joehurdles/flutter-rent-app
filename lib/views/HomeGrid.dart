import 'package:flutter/material.dart';
import 'package:rent/views/house_view.dart';
import 'package:rent/views/login_view.dart';

class Gridding extends StatefulWidget {
  const Gridding({ Key? key }) : super(key: key);

  @override
  State<Gridding> createState() => _GriddingState();
}

class _GriddingState extends State<Gridding> {
  @override
  Widget build(BuildContext context) {
    return
    GridView.count(
  primary: false,
  padding: const EdgeInsets.all(10),
  crossAxisSpacing: 60,
  mainAxisSpacing: 60,
  crossAxisCount: 3,
  children: <Widget>[
    Container(  
      height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HouseView()));
                },
                child: const Text(
                  'Find A House',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
              ),
     padding: const EdgeInsets.all(8),
     
    ),
    Container(  
      height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HouseView()));
                },
                child: const Text(
                  'Find A Hostel',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
              ),
     padding: const EdgeInsets.all(8),
     
    ),
    Container(
      
      height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: const Text(
                  'Find An Artisian',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
              ),
     padding: const EdgeInsets.all(8),
     
    ),
  ],
    );
  }
}
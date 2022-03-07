import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image(image: NetworkImage('https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            height: 492.0,
            fit: BoxFit.cover,
        ),
        ],
      ),
    );
  }
}
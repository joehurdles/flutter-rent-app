import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Item5 extends StatelessWidget {
  const Item5({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image(image: NetworkImage('https://images.unsplash.com/photo-1560448075-bb485b067938?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            height: 492.0,
            fit: BoxFit.cover,
        ),
        ],
      ),
    );
  }
}
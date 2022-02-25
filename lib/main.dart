import 'package:flutter/material.dart';
import 'package:rent/views/welcome_view.dart';
import 'package:rent/views/register_view.dart';
import 'package:rent/views/login_view.dart';
import 'package:rent/views/card_view.dart';
import 'package:rent/views/OwnerProfile.dart';
import 'package:rent/views/swipe_card.dart';

//import 'package:rent/views/page_view.dart';
void main(){
runApp(const Brent());
}
class Brent extends StatelessWidget {
  const Brent ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title :'brent',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:Login(),
    );
  }
}

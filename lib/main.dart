import 'package:flutter/material.dart';
import 'package:rent/views/noti_view.dart';
import 'package:rent/views/chat_view.dart';
import 'package:rent/views/dual_register.dart';
import 'package:rent/views/home_view.dart';
import 'package:rent/views/landlord_login.dart';
import 'package:rent/views/landlord_register.dart';
import 'package:rent/views/ownerViewProfile.dart';
import 'package:rent/views/search_view.dart';
import 'package:rent/views/welcome_view.dart';
import 'package:rent/views/register_view.dart';
import 'package:rent/views/login_view.dart';
import 'package:rent/views/card_view.dart';
import 'package:rent/views/OwnerProfile.dart';
import 'package:rent/views/swipe_card.dart';
import 'package:rent/views/userprofile.dart';
import 'package:rent/views/house_view.dart';

//import 'package:rent/views/page_view.dart';
void main() {
  runApp(const Brent());
}

class Brent extends StatelessWidget {
  const Brent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'brent',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Login(),
    );
  }
}

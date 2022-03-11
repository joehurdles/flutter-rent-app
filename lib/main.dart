import 'package:flutter/material.dart';
import 'package:rent/views/dual_register.dart';

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
      home: const DualRegisterView(),
    );
  }
}

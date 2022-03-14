import 'package:flutter/material.dart';


class GridView1 extends StatelessWidget {
  const GridView1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back) ),
      title: const Text(
        "Houses",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),),
      actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))],
    ),  
          body: 
GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      child: Column(
       children: <Widget>[
          Image.network(
         'https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          fit: BoxFit.fitHeight,
         ),
       ],
      )
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: Column(
       children: <Widget>[
          Image.network(
         'https://images.unsplash.com/photo-1598228723793-52759bba239c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
          fit: BoxFit.fitHeight,
         ),
       ],
      )
    ),
  ],
)
    );
  }

  static count({required bool primary, required EdgeInsets padding, required int crossAxisSpacing, required int mainAxisSpacing, required int crossAxisCount, List<Widget>? children}) {}
}
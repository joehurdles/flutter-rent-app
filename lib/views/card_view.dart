import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent/views/welcome_view.dart';
import 'package:rent/views/item1.dart';
import 'package:rent/views/item2.dart';
import 'package:rent/views/item3.dart';
import 'package:rent/views/item4.dart';
//import 'package:rent/views/welcome_view.dart';
//import 'package:rent/services/api_manager.dart';
class CardView extends StatefulWidget {
   CardView({ Key? key }) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

 int _currentIndex=0;
List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];
List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


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

      body: Column(
  children: <Widget>[
    CarouselSlider(
         options: CarouselOptions(
                height: 500.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 20),
                autoPlayAnimationDuration: Duration(milliseconds: 5000),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card){
                return Builder(
                  builder:(BuildContext context){
                    return Container(
                      height: MediaQuery.of(context).size.height*0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                      ),
                    );
                  }
                );
              }).toList(),
            ),
     Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => WelcomeView()));
                },
                child: Text(
                  'Contact Owner',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
    Row(
      children: <Widget>[
        Text("data")
      ],
    )
  ],
)
    );
 }
}
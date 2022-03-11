import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent/views/landlord_register.dart';
import 'package:rent/views/swipe_card.dart';
import 'package:rent/views/OwnerProfile.dart';
import 'package:rent/views/item1.dart';
import 'package:rent/views/item2.dart';
import 'package:rent/views/item3.dart';
import 'package:rent/views/item4.dart';
import 'package:rent/views/item5.dart';
//import 'package:rent/views/welcome_view.dart';
//import 'package:rent/services/api_manager.dart';
class CardView extends StatefulWidget {
   CardView({ Key? key }) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

List cardList=[
    const Item1(),
    const Item2(),
    const Item3(),
    const Item4(),
    const Item5()
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
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.push(
                      context, MaterialPageRoute(builder: (_) =>  MyHomePage()));}, icon: const Icon(Icons.arrow_back) ),

      //    leadingWidth: 60,
      // leading:  Padding(
      //   padding: const EdgeInsets.only(left: 28.0),
      //   child: CircleAvatar(
      //         radius: 30,
      //         child: Image.asset('assets/images/loyalKenss.png')
      //        // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
          
      //       ),
      // ),
        title: const Text("brent"),
      ),

      body: Column(
  children: <Widget>[
    CarouselSlider(
         options: CarouselOptions(
                height: 500.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 5000),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                  });
                },
              ),
              items: cardList.map((card){
                return Builder(
                  builder:(BuildContext context){
                    return SizedBox(
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
            const SizedBox(
              height: 30,
           ),
     Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const OwnerProfileView()));
                },
                child: const Text(
                  'Contact Owner',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),

const SizedBox(
              height: 40,
           ),

            Container(
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const LandlordRegisterView()));
                },
                child: const Text(
                  'Register As Property Owner',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
    // Row(
    //   children: <Widget>[
    //     Text("data")
    //   ],
    // )
  ],
)
    );
 }
}
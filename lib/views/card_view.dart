import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent/views/landlord_register.dart';
import 'package:rent/views/swipe_card.dart';
import 'package:rent/views/OwnerProfile.dart';
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
    Item4(),
    Item5()
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(
                        context, MaterialPageRoute(builder: (_) =>  HomePage()));}, icon: Icon(Icons.arrow_back) ),
    
        //    leadingWidth: 60,
        // leading:  Padding(
        //   padding: const EdgeInsets.only(left: 28.0),
        //   child: CircleAvatar(
        //         radius: 30,
        //         child: Image.asset('assets/images/loyalKenss.png')
        //        // backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585771724684-38269d6639fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
            
        //       ),
        // ),
          title: Text("brent"),
        ),
    
        body: SafeArea(
          child: Column(
              children: <Widget>[
              CarouselSlider(
             options: CarouselOptions(
                    height: 500.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
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
                const SizedBox(
                  height: 30,
               ),
               Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => OwnerProfileView()));
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
                      color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => LandlordRegister()));
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
            ),
        )
      ),
    );
 }
}
class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
        Image(image: NetworkImage('https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            height: 492.0,
            fit: BoxFit.cover,
        ),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xff5f2c82), Color(0xff49a09d)]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
        Image(image: NetworkImage('https://images.unsplash.com/flagged/photo-1556438758-1d61c8c65409?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80'),
            height: 492.0,
            fit: BoxFit.cover,
        ),
        ],
      ),
    );
  }
}
class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
        Image(image: NetworkImage('https://images.unsplash.com/photo-1530629013299-6cb10d168419?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=867&q=80'),
            height: 492.0,
            fit: BoxFit.cover,
        ),
        ],
      ),
    );
  }
}
class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
      Image(image: NetworkImage('https://images.unsplash.com/photo-1556912173-3bb406ef7e77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
          height: 492.0,
          fit: BoxFit.cover,
      ),
      ],
    );
  }
}
class Item5 extends StatelessWidget {
  const Item5({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
      Image(image: NetworkImage('https://images.unsplash.com/photo-1560448075-bb485b067938?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
          height: 492.0,
          fit: BoxFit.cover,
      ),
      ],
    );
  }
}
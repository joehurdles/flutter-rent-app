import 'package:flutter/material.dart';
import 'package:rent/views/swipe_card.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
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
        title: Text("brent"),
      ),
	body: ListView.builder(
		itemCount: 5,
		itemBuilder: (BuildContext context,int index){
		return ListTile(
			leading: const Icon(Icons.list),
			trailing: const Text("GFG",
						style: TextStyle(
							color: Colors.green,fontSize: 15),),
			title:Text("List item $index")
			);
		}
		),
	);
}
}

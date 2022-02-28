import 'package:flutter/material.dart';
import 'package:rent/views/card_view.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
      
        body: Center(child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,,crossAxisAlignment: CrossAxisAlignment.center,verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Search()), 
            SwipeList(),          ],
        )),
        drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('Brent'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Terms And Conditions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('LogOut'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
        );
  }
}
class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	body: Padding(
  padding: EdgeInsets.only(top: 16,left: 16,right: 16),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.grey.shade100
          )
      ),
    ),
  ),
),
  );
}
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List items = getDummyList();
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(items[index]),
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                },
                direction: DismissDirection.endToStart,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CardView()));
                  },
                   child: Card(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      height: 250,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Image.network(
                                      'https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ],
                                ))),
                                 Positioned(
                            top: 20,
                            left: 0,
                            right: 0,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Text(items[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            )
                            ),
                      ]
                      ),
                    )
                    ),),
          );
          
            },)
          
                
               
              ),
    ));
            }
          
        
  }

  List getDummyList() {
    List list = List.generate(1, (i) {
      return "Item ${i + 1}";
    });
    print(list);
    return list;
  }

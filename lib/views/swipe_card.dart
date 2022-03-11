import 'package:flutter/material.dart';
import 'package:rent/views/card_view.dart';
import 'package:rent/views/home_view.dart';

import 'noti_view.dart';




class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex=0;

   List<Widget> _widgetOptions = <Widget>[
     HomeView(),
     Notifications(),
     
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    return Scaffold(
        body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),          
       
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),


    );
  }
}


class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Container(
	child:Padding(
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
  const SwipeList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List house = getDummyList();
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
            itemCount: house.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(house[index]),
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
                    house.removeAt(index);
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
                                  Text(house[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                      textAlign: TextAlign.center),
                                       SizedBox(
                                       height: 150,
                                         ),
                                      ListTile(
                                 title: Text('Description:', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),),
                              subtitle: Text('Location:', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),),
                             ),
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
    )
    );
            }
          
        
  }

  List getDummyList() {
    List list = List.generate(1, (i) {
      return
       "";
    });
    print(list);
    return list;
  }

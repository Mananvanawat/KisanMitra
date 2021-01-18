import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kisan_mitra1/screens/DealerOrders.dart';
import 'package:kisan_mitra1/screens/DealerProfile.dart';
import 'package:kisan_mitra1/screens/DealerStore.dart';

class DealerHome extends StatefulWidget {
  @override
  _DealerHomeState createState() => _DealerHomeState();
}

class _DealerHomeState extends State<DealerHome> {
  int _page = 0;
  String title1;

  void onTabTapped(int index){
    setState(() {
      _page = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [DealerStore(),DealerOrders(),DealerProfile()];
    final List<String> title1 = ["Store","My Orders","Profile"];
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text(title1[_page]),
      ),
      body:_children[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Theme.of(context).primaryColor,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 25,color: Colors.white,),
          Icon(Icons.shopping_cart, size: 25,color: Colors.white,),
          Icon(Icons.person, size: 25,color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _page, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),*/

    );
  }
}

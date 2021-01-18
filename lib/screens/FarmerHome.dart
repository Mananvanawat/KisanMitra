import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'FarmerCommodity.dart';
import 'FarmerOrders.dart';
import 'FarmerProfile.dart';

class FarmerHome extends StatefulWidget {
  @override
  _FarmerHomeState createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {
  int _page = 0;
  String title1;
  @override
  Widget build(BuildContext context) {

    final List<Widget> _children = [FarmerCommodity(),FarmerOrders(),FarmerProfile()];
    final List<String> title1 = ["My Commodities","Orders","Profile"];
    void onTabTapped(int index){
      setState(() {
        _page = index;
      });
    }
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
          Icon(Icons.receipt, size: 25,color: Colors.white,),
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
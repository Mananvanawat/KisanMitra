import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kisan_mitra1/screens/farmer_commodity.dart';
import 'package:kisan_mitra1/screens/farmer_order.dart';
import 'package:kisan_mitra1/screens/farmer_profile.dart';

class FarmerHome extends StatefulWidget {
  @override
  _FarmerHomeState createState() => _FarmerHomeState();
}

class _FarmerHomeState extends State<FarmerHome> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {

    final List<Widget> _children = [FarmerCommodity(),FarmerOrders(),FarmerProfile()];
    void onTabTapped(int index){
      setState(() {
        _page = index;
      });
    }
    return Scaffold(
      appBar: AppBar(),
      body:_children[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.receipt, size: 30),
          Icon(Icons.person, size: 30),
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

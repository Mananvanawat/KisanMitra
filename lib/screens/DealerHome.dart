import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class DealerHome extends StatefulWidget {
  @override
  _DealerHomeState createState() => _DealerHomeState();
}

class _DealerHomeState extends State<DealerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

      ),
      appBar: AppBar(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.cyan,
        items: <Widget>[
          Icon(Icons.home, size: 22.5),
          Icon(Icons.receipt, size: 22.5),
          Icon(Icons.person, size: 22.5),
          Icon(Icons.person, size: 22.5),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: Container(color: Colors.blueAccent),
    );
  }
}
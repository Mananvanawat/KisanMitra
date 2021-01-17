import 'package:flutter/material.dart';
import 'package:kisan_mitra1/screens/add_commodity.dart';

class FarmerCommodity extends StatefulWidget {
  @override
  _FarmerCommodityState createState() => _FarmerCommodityState();
}

class _FarmerCommodityState extends State<FarmerCommodity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightGreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCommodity()));
        },
      ),
    );
  }
}

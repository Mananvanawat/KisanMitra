import 'package:flutter/material.dart';
import 'farmer_home.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size1 = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 1,
            color: Colors.cyan[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Text(
                    'YOU ARE',
                    style: TextStyle(fontSize: 60),
                  ),
                  Text(
                    'A?',
                    style: TextStyle(fontSize: 60),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,),
                  Container(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.69,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed:() {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>FarmerHome()));
                      },
                      child: Text('FARMER'),
                      color: Colors.cyan,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.69,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Text('DEALER'),
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

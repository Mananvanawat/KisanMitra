import 'package:flutter/material.dart';
import 'farmer_home.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
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
                        .height * 0.475,),
                    Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.69,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
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
      ),
    );
  }
}

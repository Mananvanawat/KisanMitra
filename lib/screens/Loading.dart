import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kisan_mitra1/styles/size.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
          height: screenHeight(context),
          child: Center(
            child: SpinKitSpinningCircle(
              color: Theme.of(context).primaryColorLight,
              size: 50.0,
            ),
          ),
        ),
        Text(
          'Loading...',
          style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize:20),
        )
      ],
    );

  }
}
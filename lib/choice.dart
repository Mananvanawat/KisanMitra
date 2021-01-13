import 'package:kisan_mitra1/dealer_home.dart';
import 'farmer_home.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  height: 450,
                  width: 300,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      buildTextField("Name"),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Address',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                if (_currentPosition != null &&
                                    _currentAddress != null)
                                  Text(_currentAddress,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      Divider(
                        height: 100,
                        thickness: 3,
                        indent: 70,
                        endIndent: 70,
                      ),
                      Text(
                        "I'm a",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.green,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FarmerHome()));
                        },
                        child: Text(
                          "FARMER",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.redAccent,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DealerHome()));
                        },
                        child: Text(
                          "DEALER",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == "Name" ? Icon(Icons.person) : null,
      ),
    );
  }
}

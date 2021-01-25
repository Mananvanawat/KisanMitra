import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kisan_mitra1/utils/widgets/Button.dart';
import 'package:kisan_mitra1/utils/widgets/myTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCommodity extends StatefulWidget {
  @override
  _AddCommodityState createState() => _AddCommodityState();
}

class _AddCommodityState extends State<AddCommodity> {
  String dropDownValue;
  TextEditingController name = TextEditingController();

  TextEditingController quantity = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController other = TextEditingController();
  Future<void> addCommodity() {
    // Call the user's CollectionReference to add a new user
  FirebaseFirestore.instance.collection('commodities').add({
    'commodity':dropDownValue,
    'uid':user.uid,
    'price':price,
    'other':other,
    'quantity':quantity

  },
     // SetOptions(merge: true)
  );
  }

  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)
                ),
                width: MediaQuery.of(context).size.width*0.97,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                  value: dropDownValue,
                  style: TextStyle(color: Colors.black),
                  hint: Text('Commodity'),
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownValue = newValue;
                    });
                  },
                  items: <String>['Tomato', 'Onion', 'Mushroom', 'Potato']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
                ),
              ),
                SizedBox(height: 10,),
                MyTextField(name: "Quantity", hintText: "Enter quantity",
                myController: quantity,),
                MyTextField(name: "Price", hintText: "Enter price",myController: price,),
                MyTextField(
                    name: "Other details", hintText: "Enter other details",myController: other,),
                Button(
                  text: "Add",
                  onpressed: () {
                    FirebaseFirestore.instance.collection('commodities').add({
                      'commodity':dropDownValue,
                      'uid':user.uid,
                      'price':price,
                      'other':other,
                      'quantity':quantity

                    },
                      // SetOptions(merge: true)
                    );
                       addCommodity();
                       Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

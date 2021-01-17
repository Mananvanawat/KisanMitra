import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'AddCommodity.dart';

class FarmerCommodity extends StatefulWidget {
  @override
  _FarmerCommodityState createState() => _FarmerCommodityState();
}

class _FarmerCommodityState extends State<FarmerCommodity> {
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Stream collectionStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection("commodities")
        .snapshots();
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: StreamBuilder<QuerySnapshot>(
          stream: collectionStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: new Card(
                        child: Row(
                          children: [
                            //Image
                            Column(
                              children: [
                                Text(document.data()['commodity']),
                                Text("Price: ₹ " + document.data()['price']),
                                Text("Quantity:" +
                                    document.data()["quantity"] +
                                    " Kg"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddCommodity()));
        },
      ),
    );
  }
}

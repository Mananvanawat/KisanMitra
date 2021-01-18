import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealerStore extends StatefulWidget {
  @override
  _DealerStoreState createState() => _DealerStoreState();
}

class _DealerStoreState extends State<DealerStore> {
  User user = FirebaseAuth.instance.currentUser;
  var commodity = [];
  var userData = [];
  @override
  Widget build(BuildContext context) {
  //  CollectionReference users = FirebaseFirestore.instance.collection('users');
    /*FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['type']=="farmer")
      {
        doc.reference.collection('commodities').get().then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs.forEach((doc) {
      print(doc.data()['commodity']);
      }
    )});
    }
    })
    });*/
    return Container(
      child: ListView.builder(itemBuilder: null),
    );
  }
}

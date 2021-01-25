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
  CollectionReference users = FirebaseFirestore.instance.collection('users').where('type',isEqualTo: 'farmer');
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
           return ListTile(
             title: Text('Abc'),
           );

          }).toList(),
        );
      },
    );
  }
}

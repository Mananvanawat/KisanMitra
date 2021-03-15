import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DealerOrders extends StatefulWidget {
  @override
  _DealerOrdersState createState() => _DealerOrdersState();
}

class _DealerOrdersState extends State<DealerOrders> {
  var user = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    Stream collectionStream = FirebaseFirestore.instance.collection('orders').where('from',isEqualTo: user).snapshots();
    return StreamBuilder<QuerySnapshot>(

      stream: collectionStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['commodity']),

            );
          }).toList(),
        );
      },
    );
  }
}

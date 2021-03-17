import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisan_mitra1/utils/widgets/Button.dart';

class FarmerOrders extends StatefulWidget {
  @override
  _FarmerOrdersState createState() => _FarmerOrdersState();
}

class _FarmerOrdersState extends State<FarmerOrders> {
  var user = FirebaseAuth.instance.currentUser.uid;
  List<String> url = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/1024px-Tomato_je.jpg',
    'https://www.foodpoisonjournal.com/files/2020/08/salmonella3.jpg',
    'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/278858_2200-732x549.jpg',
    'https://cisock.files.wordpress.com/2019/06/potato-1.jpg'
  ];
   updateOrderStatus(String id,String status){
  FirebaseFirestore.instance.collection('orders').doc(id).update({
  'status':status,
  }
  );
  }
  @override
  Widget build(BuildContext context) {
    Stream collectionStream = FirebaseFirestore.instance.collection('orders').where('to',isEqualTo: user).snapshots();
    Future<String> myFunc(String id){
      return FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          return documentSnapshot.data()['full_name'];
        }
        else return " ";
      });
    }
    return StreamBuilder<QuerySnapshot>(

      stream: collectionStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return  ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            int no;
            if(document.data()['commodity']=="Tomato")
              no = 0;
            else if(document.data()['commodity']=="Onion")
              no = 1;
            else if(document.data()['commodity']=="Mushroom")
              no = 2;
            else {
              no = 3;
            }
            print(document.id);
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Image.network(url[no],height: 71,scale: 1,),
                  SizedBox(width: 30,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(document.data()['commodity'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('Quantity :' + document.data()['quantity']),
                      Text('Customer name :' + myFunc(document.data()['from']).toString()),
                    ],
                  ),
                  SizedBox(width: 30,),
                  IconButton(icon: Icon(Icons.done,color:document.data()['status'] == 'declined'? Colors.grey:Colors.green), onPressed:
                  document.data()['status'] == 'pending'?(){
                    updateOrderStatus(document.id, "approved");
                  }:null,),
                  IconButton(icon: Icon(Icons.clear,color: document.data()['status'] == 'pending'?Colors.red:Colors.grey,), onPressed:
                  document.data()['status'] == 'pending'?(){
                    updateOrderStatus(document.id, "declined");
                  }:null,),
                  ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}


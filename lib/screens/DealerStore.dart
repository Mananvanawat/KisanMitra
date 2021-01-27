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

  Future<void> getFarmerData(String doc){
    return FirebaseFirestore.instance.collection('users').doc(doc).get().then((value) => {
      print(value.data()['full_name'])
    });
  }
  List<String> url = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/1024px-Tomato_je.jpg',
    'https://www.foodpoisonjournal.com/files/2020/08/salmonella3.jpg',
    'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/278858_2200-732x549.jpg',
    'https://cisock.files.wordpress.com/2019/06/potato-1.jpg'
  ];
  @override
  Widget build(BuildContext context) {
  CollectionReference users = FirebaseFirestore.instance.collection('commodities');
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: StreamBuilder<QuerySnapshot>(
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
              String name;
              getFarmerData(document.id);
             return Padding(
               padding: const EdgeInsets.fromLTRB(11.0, 11, 11, 0),
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(10),
                 child: Container(
                   height: 100,
                   width: MediaQuery.of(context).size.width,

                   child: new Card(
                     color:Color(0xfffefae0),
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: ClipRRect(
                             borderRadius:BorderRadius.circular(8),
                             child: Image.network(
                               url[no],

                               height: 100,
                               scale: 1,
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text("Commodity: "+document.data()['commodity'],style: TextStyle(
                                   color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
                               ),),
                               Text("Price: ₹ " + document.data()['price']+(' (Per Kg)'),style: TextStyle(
                                   color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
                               ),),
                               Text("Quantity:" +
                                   document.data()["quantity"] +
                                   " Kg",style: TextStyle(
                                   color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
                               ),),
                             ],
                           ),
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
    );
  }
}

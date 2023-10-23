import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hakathon/screens/AddManagerScreen.dart';

class AdminPanelScreen extends StatefulWidget {
  final String name;
  final String location;
  final String phone;
  const AdminPanelScreen({super.key, required this.name, required this.location, required this.phone});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  CollectionReference donors = FirebaseFirestore.instance.collection('donors');
  Future getdonors(){
    return donors.get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel'),backgroundColor: Colors.red,
      actions: [IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddManagerScreen()));
      }, icon: Icon(Icons.add))],),
      body: StreamBuilder (
        stream: FirebaseFirestore.instance.collection('donors').snapshots(),
        builder: (context,snapshot){
         if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(padding: EdgeInsets.all(11),
                  child: 
              
               ListTile(
                title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${snapshot.data!.docs[index].data()['name']}'),
                  SizedBox(width: 10,),
                   Text('${snapshot.data!.docs[index].data()['location']}'),
                   SizedBox(width: 10,),
                  Text('${snapshot.data!.docs[index].data()['phone']}'),
                ],
                )
                ));
              },
            );
          }
          return Center(child: const CircularProgressIndicator(),) ;
        }),
    );
  }
}
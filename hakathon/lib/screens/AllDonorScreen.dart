import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hakathon/screens/DonorDetailScreen.dart';
import 'package:hakathon/screens/AddDonorScreen.dart';

class AllDonorScreen extends StatefulWidget {
  
  const AllDonorScreen({super.key, });
  

  @override
  State<AllDonorScreen> createState() => _AllDonorScreenState();
}

class _AllDonorScreenState extends State<AllDonorScreen> {
  CollectionReference donors = FirebaseFirestore.instance.collection('donors');
  Future getdonors() {
    return donors.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Donors'),
      actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDonorScreen()));
      }, icon: const Text('+'))],backgroundColor: Colors.red,),
      body: StreamBuilder (
        stream: FirebaseFirestore.instance.collection('donors').snapshots(),
        builder: (context,snapshot){
         if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(padding: EdgeInsets.all(11),
                  child: 
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 1),borderRadius: BorderRadius.circular(8)),
                child: GestureDetector(onTap: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorDetailScreen(
                    donorName: snapshot.data!.docs[index].data()['name'], 
                    donorLocation: snapshot.data!.docs[index].data()['location'], 
                    donorPhone: snapshot.data!.docs[index].data()['phone'], 
                    donorLastDate: snapshot.data!.docs[index].data()['date'],
                    donorBloodGroup: snapshot.data!.docs[index].data()['Blood Group'],
                    donorUsid:snapshot.data!.docs[index].id,)));
                },
                  child:
               ListTile(
                title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${snapshot.data!.docs[index].data()['name']}'),
                   Text('${snapshot.data!.docs[index].data()['location']}'),
                  Text('${snapshot.data!.docs[index].data()['phone']}'),
                  Text('${snapshot.data!.docs[index].data()['date']}'),
                ],
                ),trailing: Container(color: Colors.red,height: 25,width: 50,
                child: Center(child: Text('${snapshot.data!.docs[index].data()['Blood Group']}',style: TextStyle(color: Colors.white),),),)
                ))));
              },
            );
          }
          return Center(child: const CircularProgressIndicator(),) ;
        }),
    );
  }
}
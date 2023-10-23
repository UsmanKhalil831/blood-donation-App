import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hakathon/Models/donorBiodata.dart';
import 'package:hakathon/Models/donorBiodata.dart';
import 'package:hakathon/screens/LogOutScreen.dart';

import '../Models/donorBiodata.dart';
import '../Models/donorBiodata.dart';

class AddDonorScreen extends StatefulWidget {
  
  const AddDonorScreen({super.key, });

  @override
  State<AddDonorScreen> createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController lastDateController = TextEditingController();
  var blood_group ='';
  var DonorUsid = '';
  
  adddonors() async {
    CollectionReference donors = FirebaseFirestore.instance.collection('donors');
    await donors.add({
      'name': nameController.text,
      'location': locationController.text,
      'phone': numberController.text,
      'date': lastDateController.text,
      'Blood Group':blood_group
    }).then((DocumentReference document){
      DonorUsid = document.id;
      //print('Document ID:${documnet.id}');
    });
    // nameController.clear();
    // locationController.clear();
    // numberController.clear();
    // lastDateController.clear();
    print('data save to firebase');
    Navigator.push(context,MaterialPageRoute(builder: (context)=>LogOutScreen(donorName: nameController.text, donorLocation: locationController.text, donorPhone: numberController.text)));
     setState(() {}); //is liay karengay takay hath k hath name add hota jaye
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ADD DONOR DETAIL'),backgroundColor: Colors.red,),
      body: SafeArea(child: Container(padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: nameController,
            decoration: const InputDecoration(hintText: 'name'),),
            TextField(controller: locationController,
            decoration: const InputDecoration(hintText: 'location')),
            TextField(controller: numberController,
            decoration: const InputDecoration(hintText: 'number')),
            TextField(controller:lastDateController,
            decoration: const InputDecoration(hintText: 'last date')),
            const SizedBox(height: 10,),
            const Text('Blood Groups'),
            const SizedBox(height: 10,),
            Row(children: [
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: (){
              blood_group = 'O+';
            }, child: const Text('O+')),
            SizedBox(width: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: (){
              blood_group = 'B+';
            }, child: const Text('B+')),
            SizedBox(width: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (){
              blood_group = 'AB+';
            }, child: const Text('AB+')),
            SizedBox(width: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (){
              blood_group = 'A+';
            }, child: const Text('A+')),
            SizedBox(width: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (){
              blood_group = 'A-';
            }, child: const Text('A-')),
            SizedBox(width: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (){
              blood_group = 'B-';
            }, child: const Text('B-')),
            SizedBox(width: 10,),
            ],),
            
            const SizedBox(height: 30,),
            Container(height: 48,width: 254,
            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (
            ){
             adddonors();
            }, child:const Text('Save'))),
          ],
        ),
      )),
    );
  }
}
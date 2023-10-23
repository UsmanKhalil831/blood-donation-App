import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddManagerScreen extends StatefulWidget {
  const AddManagerScreen({super.key});

  @override
  State<AddManagerScreen> createState() => _AddManagerScreenState();
}

class _AddManagerScreenState extends State<AddManagerScreen> {

   TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  adddonors() async {
    CollectionReference donors = FirebaseFirestore.instance.collection('managers');
    await donors.add({
      'name': nameController.text,
      'location': locationController.text,
      'phone': numberController.text,
      
    });
   
    print('data save to firebase');
    
     setState(() {}); //is liay karengay takay hath k hath name add hota jaye
    
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ADD MANAGERS',),backgroundColor: Colors.red,),
      body: Container(
        child: 
        Column(children: [
          TextField(controller: nameController,
            decoration: const InputDecoration(hintText: 'name'),),
            TextField(controller: locationController,
            decoration: const InputDecoration(hintText: 'location')),
            TextField(controller: numberController,
            decoration: const InputDecoration(hintText: 'number')),
            SizedBox(height: 20,),
            Container(height: 48,width: 254,
            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (
            ){
             adddonors();
            }, child:const Text('SAVE'))),
        ],),
      ),
    );
  }
}
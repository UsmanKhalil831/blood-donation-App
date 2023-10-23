import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hakathon/screens/AllDonorScreen.dart';
import 'package:hakathon/screens/LogOutScreen.dart';

class EditDonorScreen extends StatefulWidget {
  final String Donorusid;
  final String name;
  final String location;
  final String phone;
  final String bloodGroup;
  const EditDonorScreen({super.key, required this.Donorusid, required this.name, required this.location, required this.phone, required this.bloodGroup});

  @override
  State<EditDonorScreen> createState() => _EditDonorScreenState();
}

class _EditDonorScreenState extends State<EditDonorScreen> {
  TextEditingController nameController = TextEditingController();
   TextEditingController locationController= TextEditingController();
    TextEditingController phoneController = TextEditingController();
     TextEditingController DateController = TextEditingController();
      TextEditingController BloodGroupController = TextEditingController();
      CollectionReference donors = FirebaseFirestore.instance.collection('donors');
      UpdateDonor() async{
        await donors.doc(widget.Donorusid).update({
          'name':nameController.text,
          'location':locationController.text,
          'phone':phoneController.text,
          'date':DateController.text,
          'Blood Group':BloodGroupController.text,
        });
        nameController.clear();
        locationController.clear();
        phoneController.clear();
        DateController.clear();
        BloodGroupController.clear();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllDonorScreen()));
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EDIT DONOR DETAIL'),backgroundColor: Colors.red,),
      body: Container(padding: EdgeInsets.all(11),
        child: Column(
          children: [
            TextField(controller: nameController,
              decoration: InputDecoration(hintText: 'name'),),
            TextField(controller: phoneController,
              decoration: InputDecoration(hintText: 'phone'),),
            TextField(controller: locationController,
              decoration: InputDecoration(hintText: 'location'),),
            TextField(controller: DateController,
              decoration: InputDecoration(hintText: 'date'),),
            TextField(controller: BloodGroupController,
              decoration: InputDecoration(hintText: 'blood group'),),
              SizedBox(height: 20,),
              Container(height: 48,width: 254,
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: (){
                  UpdateDonor();
                }, 
                child: Text('SAVE'),))

          ],
        ),
      ),
    );
  }
}
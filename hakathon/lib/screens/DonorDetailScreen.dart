import 'package:flutter/material.dart';
import 'package:hakathon/screens/AddDonorScreen.dart';
import 'package:hakathon/screens/editDonorDetailScreen.dart';

class DonorDetailScreen extends StatefulWidget {
  final String donorName;
  final String donorLocation;
  final String donorPhone;
  final String donorLastDate;
  final String donorBloodGroup;
  final String donorUsid;
  const DonorDetailScreen({super.key, required this.donorName, required this.donorLocation, required this.donorPhone, required this.donorLastDate, required this.donorBloodGroup, required this.donorUsid});

  @override
  State<DonorDetailScreen> createState() => _DonorDetailScreenState();
}

class _DonorDetailScreenState extends State<DonorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donor Detail Screen'),backgroundColor: Colors.red,),
      body: Container(padding: EdgeInsets.all(11),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
          Text(widget.donorName,style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
          SizedBox(height: 20,),
          Text(widget.donorLocation,style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
          SizedBox(height: 20,),
          Text(widget.donorPhone,style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
          SizedBox(height: 20,),
          Text(widget.donorLastDate,style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
          SizedBox(height: 20,),
          Row(children: [
            Text('Blood Group',style: TextStyle(fontSize: 15),),
            SizedBox(width: 80,),
            Container(height: 25,width: 50,color: Colors.red,
            child: Center(child: Text(widget.donorBloodGroup,style: TextStyle(color: Colors.white),),),)
          ],),
          SizedBox(height: 20,),
          Center(child: 
          Container(height: 48,width: 254,
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditDonorScreen(
                    Donorusid: widget.donorUsid, name: widget.donorName, 
                    location: widget.donorLocation, phone: widget.donorPhone, bloodGroup: widget.donorBloodGroup)));
                }, 
                child: Text('EDIT'),)))

        ],),
      ),
      
    );
  }
}
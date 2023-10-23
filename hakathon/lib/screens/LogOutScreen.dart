import 'package:flutter/material.dart';
import 'package:hakathon/screens/LogInScreen.dart';
import 'package:hakathon/screens/SignInScreen.dart';

class LogOutScreen extends StatefulWidget {
  final String donorName;
  final String donorLocation;
  final String donorPhone;
  const LogOutScreen({super.key, required this.donorName, required this.donorLocation, required this.donorPhone});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,),
      body: Stack(
        children: [
          Container(padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 1.00,
            height: MediaQuery.of(context).size.height * 1.00,
            color: Colors.white,
          ),
             
          Positioned(top: 193,left: 28,right: 28,
            child:  
            Container(padding: EdgeInsets.all(11),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 8),]),
              width: 372,
              height: 365,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Center(child: Text('MANAGER PROFILE',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),),
                Container(padding: EdgeInsets.all(11),
                  child: Text(widget.donorName),),
                  Container(padding: EdgeInsets.all(11),
                  child: Text(widget.donorLocation),),
                  Container(padding: EdgeInsets.all(11),
                  child: Text(widget.donorPhone),),
                   
                ],
              ),
            ),
            ),
            Positioned(top: 534,left: 125,
              child: Container(height: 48,width: 254,
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen(name: widget.donorName, location: widget.donorLocation, phone: widget.donorPhone)));
                }, 
                child: const Text('LOGOUT'),))
                )
        ],
      )
    );
  }
}
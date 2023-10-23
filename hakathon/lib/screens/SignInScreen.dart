import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hakathon/screens/AllDonorScreen.dart';

import '../Models/Biodata.dart';

class LoginScreen extends StatefulWidget {
  
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var Email = '';
  SignUpUser() async{
    UserCredential? credential;
    try{
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Email = emailController.text.trim();
      emailController.clear();
      passwordController.clear();
    }
    on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        const Text('weak password');
      }
      else if (e.code == 'email-already-in-use'){
        const Text('email already in use');
      }
      
    } catch (e){
      print(e);
    }
    if(credential != null){
      String usid = credential.user!.uid;
      Biodata bio = Biodata(email:Email, role: 'Donor', useruid: usid);
      await FirebaseFirestore.instance.collection('users').doc(usid).set(bio.toMap()).then((value) => print('Sign Up completed'));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllDonorScreen()));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 1.00,
            height: MediaQuery.of(context).size.height * 1.00,
            color: Colors.white,
          ),
             Container(padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 1.00,
              height: 300,
              color: Colors.red,
              child: Container(child: Image.asset('assets/images/Group155.png',
                    width: 20, height:20),)
            ),
          Positioned(top: 193,left: 28,right: 28,
            child:  
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 8),]),
              width: 372,
              height: 365,
              child: Column(
                children: [
                  Container(padding: const EdgeInsets.fromLTRB(58, 23, 23, 58),
                    child: const Text('SIGN IN',style: TextStyle(fontWeight:FontWeight.w400,fontSize: 20),),),
                   Container(width: 372,height: 200,padding: EdgeInsets.all(10),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('EMAIL'),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: 'TYPE YOUR EMAIL'),
                    ),
                    SizedBox(height: 20,),
                    Text('PASSWORD'),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: 'TYPE YOUR PASSWORD'),
                    ),
                    ],
                   ),)
                ],
              ),
            ),
            ),
            Positioned(top: 534,left: 125,
              child: Container(height: 48,width: 254,
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: (){
                  SignUpUser();
                }, 
                child: Text('SIGN IN'),))
                )
        ],
      )
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hakathon/screens/adminPanelScreen.dart';

class LogInScreen extends StatefulWidget {
  final String name;
  final String location;
  final String phone;
  const LogInScreen({super.key, required this.name, required this.location, required this.phone});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  loginUser() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text);
        emailController.clear();
        passwordController.clear();
        print('===== login successfully =====');
       Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPanelScreen(name: widget.name, location: widget.location, phone: widget.phone)));
        
    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found'){
        print('user not found');
      }
      else if (e.code == 'wrong-password'){
        print('wrong password');
      }
    }
    catch (e) {
      print('===== Catch =====');
      print(e);
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
             
          Positioned(top: 193,left: 28,right: 28,
            child:  
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 8),]),
              width: 372,
              height: 365,
              child: Column(
                children: [
                  Container(padding: const EdgeInsets.fromLTRB(58, 23, 23, 58),
                    child: const Text('LOG IN',style: TextStyle(fontWeight:FontWeight.w400,fontSize: 20),),),
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
                  loginUser();
                }, 
                child: Text('LOG IN'),))
                )
        ],
      )
      
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hakathon/screens/SignInScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1.00,
          width: double.infinity,
          color: Colors.red,
          child: Center(
            child: Container(
                height: 300,
                width: 300,
               child: Image.asset('assets/images/Group155.png',
                    width: 20, height: 200)
                    ),
          ),
        )
      ],
    ));
  }
}

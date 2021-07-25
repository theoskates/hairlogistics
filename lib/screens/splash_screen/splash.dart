import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hairlogistics/screens/details/components/Authentication/signIn.dart';
import 'package:hairlogistics/screens/home/homescreen.dart';
import 'package:hairlogistics/services/firebase_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), getUserStatus);
  }

  void getUserStatus() {
    var user = FirebaseServices.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SignIn()));
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

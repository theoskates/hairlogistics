import 'package:flutter/material.dart';
import 'package:hairlogistics/screens/home/homescreen.dart';

import 'dart:ui';

import 'package:hairlogistics/services/firebase_services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  TextEditingController email;
  TextEditingController pass;

  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
  }

  void _signUp() async {
    setState(() {
      this.isLoading = true;
    });
    var res = await FirebaseServices.instance.signUp(email.text, pass.text);
    setState(() {
      this.isLoading = false;
    });
    if (res == null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      return;
    }
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: Text("Error"),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10.0),
                child: Text(res.message),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK")),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text("Email"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(6, 2),
                        blurRadius: 4.0,
                        spreadRadius: 3.0,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-6, -2),
                        blurRadius: 4.0,
                        spreadRadius: 3.0,
                      )
                    ],
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(6, 2),
                        blurRadius: 4.0,
                        spreadRadius: 3.0,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-6, -2),
                        blurRadius: 4.0,
                        spreadRadius: 3.0,
                      )
                    ],
                  ),
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: isLoading ? null : _signUp,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(6, 2),
                                  blurRadius: 4.0,
                                  spreadRadius: 3.0),
                              BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                offset: Offset(-6, -2),
                                blurRadius: 4.0,
                                spreadRadius: 3.0,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                              child: isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      "Create My Account",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

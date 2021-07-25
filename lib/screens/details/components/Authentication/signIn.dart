import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hairlogistics/screens/details/components/Authentication/signUp.dart';
import 'package:hairlogistics/screens/forgot_password/forgot_password.dart';
import 'package:hairlogistics/screens/home/homescreen.dart';
import 'package:hairlogistics/services/firebase_services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email;
  TextEditingController pass;
  bool isLoading = false;

  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
  }

  void _signIn() async {
    setState(() {
      this.isLoading = true;
    });
    var res = await FirebaseServices.instance.signIn(email.text, pass.text);
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
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                ),
                Text(
                  "Sign In",
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
                InkWell(
                  onTap: isLoading ? null : _signIn,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Center(
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                      strokeWidth: 4,
                                    )
                                  : Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.deepPurpleAccent,
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
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
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
                              child: Text(
                                "Create Account",
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
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ForgotPassword())),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Text(
                      "forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

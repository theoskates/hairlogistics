import 'package:flutter/material.dart';
import 'package:hairlogistics/services/firebase_services.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email;

  @override
  void initState() {
    email = TextEditingController();
  }

  void _onForgotPassword() async {
    var res = await FirebaseServices.instance.forgotPassword(email.text);
    if (res == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return SimpleDialog(
              title: Text("Success"),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, left: 20, bottom: 10.0),
                  child: Text("Link sent successfully"),
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration.collapsed(
                      hintText: "Enter email here ..."),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Expanded(
                child: TextButton(
                    onPressed: _onForgotPassword, child: Text("Send Link"))),
          )
        ],
      )),
    );
  }
}

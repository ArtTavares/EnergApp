import 'package:energapp/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:energapp/shared/color.dart';

Widget scaffold(BuildContext context, String titulo, Widget body,
    {bool isVisibleOutLogin = true}) {
  return Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          titulo,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: customRoxoColor,
        actions: [
          Visibility(
              visible: isVisibleOutLogin,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                color: customRoxoColor,
                elevation: 0,
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: body);
}

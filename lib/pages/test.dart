import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatefulWidget {
  FirstRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Container(
                    height: 27,
                    child: Text(
                      "Name: ${snapshot.data.data()}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text("No data");
            }
            return CircularProgressIndicator();
          },
        ));
  }

  Future<DocumentSnapshot> getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('4')
        .set({"teste1": 'teste2'});
    await FirebaseFirestore.instance
        .collection('users')
        .doc('3')
        .update({"teste1": 'google', "TEste3": "Resss"});
    return await FirebaseFirestore.instance.collection("users").doc("3").get();
  }
}

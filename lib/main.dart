import 'package:energapp/pages/login.dart';
import 'package:energapp/pages/tab.dart';
import 'package:energapp/services/sharedPreferences.dart';
import 'package:energapp/shared/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/login.dart';

Future<void> main() async {
  // var s = await Firestore.instance.collection("col").doc("doc").set({"test": "tttt"});
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EnergApp',
        theme: ThemeData(
          // brightness: Brightness.dark,

          primaryColor: Colors.white,
          accentColor: Colors.white,
          primarySwatch: customRoxoColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.red,
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headline6: TextStyle(
                  fontSize: 36.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
              bodyText2: TextStyle(
                  fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
              button: TextStyle(color: Colors.white),
              caption: TextStyle(color: Colors.white),
              headline2: TextStyle(color: Colors.white),
              headline3: TextStyle(color: Colors.white),
              headline4: TextStyle(color: Colors.white),
              headline5: TextStyle(color: Colors.white),
              subtitle1: TextStyle(color: Colors.white),
              subtitle2: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white),
              overline: TextStyle(color: Colors.white)),
        ),
        home: _build());
  }

  Future<bool> logado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("id");
  }

  _build() {
    return FutureBuilder(
      future: logado(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.data)
              return TabPage();
            else
              return LoginPage();
            break;
          default:
            return CircularProgressIndicator();
            break;
        }
      },
    );
  }
}

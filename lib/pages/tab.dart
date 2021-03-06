import 'package:energapp/pages/grafico.dart';
import 'package:energapp/pages/home.dart';
import 'package:energapp/pages/insert.dart';
import 'package:energapp/pages/login.dart';
import 'package:energapp/shared/color.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  String _title = "Home";
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: new Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _title,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: customRoxoColor,
            actions: [
              RaisedButton(
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
              )
            ],
          ),
          body: TabBarView(
            children: [HomePage(), GraficoPage()],
          ),
          bottomNavigationBar: Container(
            color: customRoxoColor,
            child: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(
                    Icons.home,
                  ),
                  child: Text(
                    "Home",
                  ),
                ),
                Tab(
                  icon: new Icon(Icons.insert_chart),
                  child: Text(
                    "Gráfico",
                  ),
                ),
              ],
              onTap: (index) {
                String title = "Home";
                bool visible = true;
                if (index == 0) {
                  title = "Home";
                  visible = true;
                } else {
                  title = "Gráfico";
                  visible = false;
                }
                setState(() {
                  _title = title;
                  _visible = visible;
                });
              },
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.transparent,
            ),
          ),
          backgroundColor: customBackgroundColor,
          floatingActionButton: Visibility(
            visible: _visible,
            child: floatButton(),
          )),
    );
  }

  floatButton() {
    return Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3.0),
            color: customBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(1000.0),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => InserirPage()));
            },
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}

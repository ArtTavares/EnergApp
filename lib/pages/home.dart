import 'package:energapp/pages/editar.dart';
import 'package:energapp/shared/color.dart';
import 'package:energapp/shared/divider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        divider(context, height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: Text(
            "Valor: 220,20",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        divider(context, height: MediaQuery.of(context).size.height * 0.02),
        Center(
            child: RichText(
          text: TextSpan(
            text: 'Bandeira: ',
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 25),
            children: <TextSpan>[
              TextSpan(
                  text: 'Vermelho', style: TextStyle(color: customRedColor)),
            ],
          ),
        )),
        divider(context, height: MediaQuery.of(context).size.height * 0.13),
        Expanded(
          child: list(context),
        )
      ],
    );
  }

  list(BuildContext context) {
    return ListView(
      children: [
        rowList("Televisão Samsung xxx", "2 kWh"),
        rowList("Geladeira LG xxx", "2 kWh"),
        rowList("Chuveiro xxx", "2 kWh")
      ],
    );
  }

  rowList(String text, String kWh) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text(
                    text,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        kWh,
                      ),
                    ),
                    VerticalDivider(),
                    iconButton(Icons.delete, customRedColor, () {}),
                    iconButton(Icons.mode_edit, customRoxoColor, () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditarPage()));
                    }),
                  ],
                )
              ],
            ),
          ],
        ));
  }

  iconButton(IconData icon, MaterialColor color, Null Function() funcao) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      iconSize: 22,
      padding: EdgeInsets.all(0),
      onPressed: () {},
    );
  }
}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:energapp/shared/button.dart';
import 'package:energapp/shared/color.dart';
import 'package:energapp/shared/divider.dart';
import 'package:energapp/shared/input.dart';
import 'package:energapp/shared/scaffold.dart';
import 'package:flutter/material.dart';

class InserirPage extends StatefulWidget {
  @override
  _InserirPageState createState() => _InserirPageState();
}

class _InserirPageState extends State<InserirPage> {
  var _tempo = TextEditingController();
  var _quantidade = TextEditingController();
  var _pesquisa = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return scaffold(context, "Inserir", body(context));
  }

  Widget body(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   margin: EdgeInsets.symmetric(
          //       horizontal: MediaQuery.of(context).size.width * 0.08),
          //   child: _seach(),
          // ),
          _seach(context),
          input(context, _tempo, "Tempo Médio Ligado", "errorText"),
          input(context, _quantidade, "Quantidade", "errorText",
              keyboardType: TextInputType.number),
          divider(context, height: MediaQuery.of(context).size.height * 0.05),
          Center(
            child: button(context, "Salvar", () => {}, witdh: 0.8),
          ),
        ]);
  }
}

Widget _seach(BuildContext context) {
  var items = [
    "Brazil",
    "Italia (Disabled)",
    "Tunisia",
    'Dinamarca',
    "Afeganistão",
    'África do Sul',
    "Alemanha",
    'Angola',
    "Argélia",
    'Canada',
    "Bahamas",
    'Barbados',
    "Bangladexe",
    'Belize',
    "Benim",
    'Botsuana',
    "Butão",
    'Colômbia',
    "Comores",
    'Croácia',
    "Cuaite",
    'Cuba',
    "Eslováquia",
    'Espanha'
  ];
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.08),
    child: DropdownSearch<String>(
        validator: (v) => v == null ? "required field" : null,
        label: "Selecione um Produto",
        mode: Mode.MENU,
        showSelectedItem: true,
        items: items,
        showClearButton: false,
        onChanged: print,
        showSearchBox: true,
        popupBackgroundColor: customBackgroundColor,
        // dropdownBuilder: _customDropDownExample,
        searchBoxDecoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.white),
            labelText: "Pesquisar o produto",
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            fillColor: Colors.white,
            focusColor: Colors.white),
        dropdownSearchDecoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.white),
            labelText: "Pesquisar o produto",
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            fillColor: Colors.white,
            focusColor: Colors.white),
        dropdownBuilder: _customDropDownExample,
        popupItemBuilder: _customPopupItemBuilderExample,
        // popupBarrierColor: Colors.red,
        popupShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        dropdownBuilderSupportsNullItem: true),
  );
}

Widget _customDropDownExample(
    BuildContext context, String item, String itemDesignation) {
  return (item == null)
      ? Text("")
      : ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            item,
            style: TextStyle(color: Colors.white),
          ),
        );
}

Widget _customPopupItemBuilderExample(
    BuildContext context, String item, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: customRoxoColor),
            // borderRadius: BorderRadius.circular(5),
            color: customRoxoColor,
          ),
    child: ListTile(
      selected: isSelected,
      title: Text(item),
    ),
  );
}

// Widget _customPopupItemBuilderExample(
//     BuildContext context, String item, bool isSelected) {
//   return Container(
//     decoration: BoxDecoration(
//       color: customBackgroundColor,
//     ),
//     child: ListTile(
//       selected: isSelected,
//       title: Text(
//         item,
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
//Feito por Iago Guedelha Nunes - 26001970
void main() => runApp(PerfilPage());

class PerfilPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String appTitle = "Perfil do Funcionário";

  bool isSearchEnabled = false;


 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
      ),
    );
  }

    Widget _buildBar(BuildContext context) {
    return AppBar(
      title: Text("Perfil do Funcionário"),
      centerTitle: true,
      backgroundColor: Color(0xFF821313),
      actions: <Widget>[
        IconButton(
                icon: Icon(Icons.account_circle),
              )
      ],
    );
  }

}
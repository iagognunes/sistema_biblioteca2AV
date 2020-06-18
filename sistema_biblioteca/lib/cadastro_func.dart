import 'package:flutter/material.dart';
import 'package:sistema_biblioteca/servicos/service_bd.dart';
import 'main.dart';
import 'models/login.dart';
//Pedro Victor Fernandes Ano Bom - 26156394
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela Cadastro',
      theme: new ThemeData(
        primarySwatch: Colors.red[500],
      ),
      home: new CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CadastroPageState();
}
class _CadastroPageState extends State<CadastroPage> {

  final matriculaController = TextEditingController();
  final nomeController = TextEditingController();
  final oabController = TextEditingController();
  final senhaController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  SQLiteService sqLiteService;

  @override
  void initState() {
    sqLiteService = SQLiteService();
    sqLiteService.inicializacao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
            _buildTextFields(),
          ],
        ),
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Cadastro"),
      centerTitle: true,
      backgroundColor: Color(0xFF821313),
    );
  }


  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            
            child: TextFormField(
              controller: matriculaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Matrícula*',
              ),
            ),
          ),
         Container(
           padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome Completo*'
              ),
              obscureText: false,
            ),
          ),
          
          Container(
           padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: oabController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OAB'
              ),
              obscureText: false,
          ),
            ),
          
          Container(
           padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: senhaController,
              decoration: InputDecoration(
                labelText: 'Senha*'
              ),
              obscureText: true,
          ),
            ),
          
          Container(
           padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirmar Senha*'
              ),
              obscureText: true,
          ),
            ),
          Column(
            children: <Widget>[
            RaisedButton(
              child:  Text('Criar Cadastro'),
              onPressed: (){
                sqLiteService.insertLogin(Login(
                  matricula: int.parse(matriculaController.text),
                  senha: senhaController.text,
                  nome:nomeController.text,
                  oab: int.parse(oabController.text)
                ));
                
                Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
                );
              },
              color: Color(0xFF821313),
              textColor: Colors.white,
            ),
             
            ],
          )
        ],
      ),
    );
  }

}
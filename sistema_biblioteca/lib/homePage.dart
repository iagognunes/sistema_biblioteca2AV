import 'package:flutter/material.dart';
import 'perfil_user.dart';
import 'livros.dart';

//Feito por Paulo Henrique Trindade Reis - 26150223
void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appTitle = "Escritório de Advocacia";

  bool isSearchEnabled = false;

  _switchSearchBarState() {
    setState(() {
      isSearchEnabled = !isSearchEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            elevation: 1,
            backgroundColor: Color(0xFF821313),
            title: !isSearchEnabled
                ? Text(appTitle)
                : TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Busque nome do livro, autor ou editora",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
            actions: <Widget>[
              IconButton(
                icon: Icon(isSearchEnabled ? Icons.close : Icons.search),
                onPressed: _switchSearchBarState,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PerfilPage()),
                  );
                },
                icon: Icon(Icons.account_circle),
              )
            ]),
        body: Column(
          children: livros.map((livro) => cardsHome(livro)).toList(),
        ),
      ),
    );
  }

  List<Livros> livros = [
    Livros(
        nome: 'Nome do Livro',
        autor: 'Autor do Livro',
        area: 'Area da advocacia',
        prazo: 'Prazo de entrega: 0 dias'),
    Livros(
        nome: 'Nome do Livro2',
        autor: 'Autor do Livro2',
        area: 'Area da advocacia2',
        prazo: 'Prazo de entrega: 0 dias2'),
    Livros(
        nome: 'Nome do Livro3',
        autor: 'Autor do Livro3',
        area: 'Area da advocacia3',
        prazo: 'Prazo de entrega: 0 dias3'),
  ];

  Widget cardsHome(livro) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: 60,
                )),
          ),
          Text(
            livro.nome,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            livro.autor,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            livro.area,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            livro.prazo,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.red[600],
            ),
          ),
        ],
      ),
    );
  }
}

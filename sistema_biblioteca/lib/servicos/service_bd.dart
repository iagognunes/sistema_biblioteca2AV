import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sistema_biblioteca/models/login.dart';

class SQLiteService{

  Future<Database> database;

  //inicializando o banco
  Future<void> inicializacao() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'login.db'),

      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE login (matricula INTEGER PRIMARY KEY, nome TEXT, senha VARCHAR, oab INTEGER)",
        );
      }, 
      version: 1
    );
  }

  //inserçao dos dados no BD
  Future<void> insertLogin(Login login) async {
    final Database db = await this.database;
    await db.insert('login', login.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    listLogins();
  } 
    //listar perfil
    Future<List<Login>> listLogins() async{
      final Database db = await this.database;
      final List<Map<String, dynamic>> logins = await db.query('login');
      print(logins);
    }
  

}
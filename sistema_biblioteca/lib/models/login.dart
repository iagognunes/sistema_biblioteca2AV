class Login
{
  final int matricula;
  final String senha;
  final String nome;
  final int oab;

  Login({this.matricula, this.senha, this.nome, this.oab});

  Map<String, dynamic> toMap(){
    return {
      'matricula': matricula,
      'senha': senha,
      'nome': nome,
      'oab': oab
    };
  }
}

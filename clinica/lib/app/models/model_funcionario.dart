class FuncionarioModel {
  int? id;
  String? nome;
  String? cpf;
  String? cargo;
  String? email;
  String? telefone;

  FuncionarioModel({this.id,this.nome,this.cpf,this.email,this.telefone,this.cargo});

  FuncionarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    telefone = json['telefone'];
    cargo = json['cargo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['email'] = email;
    data['telefone'] = telefone;
    data['cargo'] = cargo;
    return data;
  }
}

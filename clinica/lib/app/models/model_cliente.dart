class ClienteModel {
  int? id;
  String? nome;
  String? cpf;
  String? email;
  String? telefone;
  String? endereco;

  ClienteModel({this.id,this.nome,this.cpf,this.email,this.telefone,this.endereco});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    telefone = json['telefone'];
    endereco = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['email'] = email;
    data['telefone'] = telefone;
    data['endereco'] = endereco;
    return data;
  }
}

class RegisterClienteModel {
  String? nome;
  String? cpf;
  String? email;
  String? telefone;
  String? endereco;

  RegisterClienteModel({this.nome,this.cpf,this.email,this.telefone,this.endereco});

  RegisterClienteModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    telefone = json['telefone'];
    endereco = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nome"] = nome;
    data["cpf"] = cpf;
    data["email"] = email;
    data["telefone"] = telefone;
    data["endereco"] = endereco;
    return data;
  }
}

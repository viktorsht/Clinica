class MedicoModel {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? cpf;
  String? crm;
  String? especialidade;

  MedicoModel({this.id,this.nome,this.cpf,this.email,this.telefone,this.crm, this.especialidade});

  MedicoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    telefone = json['telefone'];
    crm = json['crm'];
    especialidade = json['especialidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['email'] = email;
    data['telefone'] = telefone;
    data['crm'] = crm;
    data['especialidade'] = especialidade;
    return data;
  }
}

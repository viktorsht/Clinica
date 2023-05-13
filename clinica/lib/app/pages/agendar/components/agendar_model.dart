class AgendarModel {
  int? medicoId;
  int? clienteId;
  String? horario;

  AgendarModel({this.medicoId, this.clienteId, this.horario});

  AgendarModel.fromJson(Map<String, dynamic> json) {
    medicoId = json['medico_id'];
    clienteId = json['cliente_id'];
    horario = json['horario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medico_id'] = medicoId;
    data['cliente_id'] = clienteId;
    data['horario'] = horario;
    return data;
  }
}

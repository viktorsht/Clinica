import 'package:clinica/app/models/model_cliente.dart';
import 'package:clinica/app/models/model_medico.dart';

class AtendimentoModel {
  int? id;
  MedicoModel? medico;
  ClienteModel? cliente;
  String? horario;

  AtendimentoModel({this.id, this.medico, this.cliente, this.horario});

  AtendimentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medico =
        json['medico'] != null ? MedicoModel.fromJson(json['medico']) : null;
    cliente =
        json['cliente'] != null ? ClienteModel.fromJson(json['cliente']) : null;
    horario = json['horario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (medico != null) {
      data['medico'] = medico!.toJson();
    }
    if (cliente != null) {
      data['cliente'] = cliente!.toJson();
    }
    data['horario'] = horario;
    return data;
  }
}
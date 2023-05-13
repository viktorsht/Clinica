import 'dart:convert';
import 'package:clinica/app/models/model_atendimento.dart';
import 'package:clinica/app/pages/agendar/components/agendar_model.dart';
import 'package:http/http.dart' as http;

import '../../api/routers_api.dart';

class AtendimentoRepository{

  Future<List<AtendimentoModel>> getAtendimentosMedicoApi() async {
    final url = Uri.parse(RoutersApi.atendimentosMedico);
    final response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => AtendimentoModel.fromJson(json)).toList();
  }

  Future<List<AtendimentoModel>> getAtendimentosHojeApi() async {
    final url = Uri.parse(RoutersApi.atendimentosHoje);
    final response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => AtendimentoModel.fromJson(json)).toList();
  }

  Future<AtendimentoModel> postAtendimentoApi(AgendarModel atendimento) async{
    final url = Uri.parse(RoutersApi.atendimentos);
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode(atendimento.toJson());
    final response = await http.post(url, headers: headers, body: body);
    return AtendimentoModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  Future<AtendimentoModel> deleteAtendimentoApi(String atendimento) async{
    final url = Uri.parse(RoutersApi.remover+atendimento);
    final response = await http.delete(url);
    return AtendimentoModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  Future<AtendimentoModel> updateAtendimentoApi(AgendarModel atendimento, String id) async{
    final url = Uri.parse(RoutersApi.editar+id);
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode(atendimento.toJson());
    final response = await http.put(url, headers: headers, body: body);
    return AtendimentoModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
  
}
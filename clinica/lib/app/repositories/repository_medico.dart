import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../api/routers_api.dart';
import '../models/model_medico.dart';

class MedicoRepository{

  Future<List<MedicoModel>> getMedicoApi() async {
    final url = Uri.parse(RoutersApi.medicos);
    final response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    return list.map((json) => MedicoModel.fromJson(json)).toList();
  }
  
}
import 'dart:convert';
import 'package:clinica/app/models/model_funcionario.dart';
import 'package:clinica/app/config/token.dart';
import 'package:http/http.dart' as http;

import '../../api/routers_api.dart';

class FuncionarioRepository{

  Future<List<FuncionarioModel>> getFuncionariosApi() async {
    final url = Uri.parse(RoutersApi.funcionarios);
    final response = await http.get(url);
    final list = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return list.map((json) => FuncionarioModel.fromJson(json)).toList();
  }

  Future<FuncionarioModel?> getMeApi() async {
    final url = Uri.parse(RoutersApi.me);
    final token = await getToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(url, headers: headers);
    return FuncionarioModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  Future<String> postLoginApp(String email, String senha) async {
    final url = Uri.parse(RoutersApi.login);
    final headers = {"Content-Type": "application/json"};
    final body = {"email": email, "senha": senha};
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    return jsonDecode(response.body)['token'];
  }

  
}
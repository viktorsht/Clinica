import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../api/routers_api.dart';
import '../models/model_cliente.dart';
import '../models/model_register_cliente.dart';

class ClienteRepository{

  Future<List<ClienteModel>> getClienteApi() async {
    final url = Uri.parse(RoutersApi.clientes);
    final response = await http.get(url);
    final list = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return list.map((json) => ClienteModel.fromJson(json)).toList();
  }

  Future<ClienteModel> postClienteApi(RegisterClienteModel cliente) async {
    final url = Uri.parse(RoutersApi.signup);
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode(cliente.toJson());
    final response = await http.post(url,headers: headers ,body: body);
    return ClienteModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
  
}
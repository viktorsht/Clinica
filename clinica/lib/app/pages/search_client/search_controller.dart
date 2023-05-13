import 'package:clinica/app/models/model_cliente.dart';
import 'package:clinica/app/repositories/repository_cliente.dart';
import 'package:flutter/material.dart';

class SearchController{
  List<ClienteModel> clientes = [];
  List<ClienteModel> clientesEncontrados = [];
  final repositoryCliente = ClienteRepository();
  
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future startCliente() async {
    state.value = HomeState.loading;
    try {
      clientes = await repositoryCliente.getClienteApi();
      clientesEncontrados = List.from(clientes);
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

  

}

enum HomeState {start, loading, sucess, error}
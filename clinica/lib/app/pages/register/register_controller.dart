import 'package:flutter/material.dart';
import '../../models/model_cliente.dart';
import '../../models/model_register_cliente.dart';
import '../../repositories/repository_cliente.dart';

class RegisterController{
  ClienteModel cliente = ClienteModel();
  final repository = ClienteRepository();
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start(RegisterClienteModel newCliente) async {
    state.value = HomeState.loading;
    try {
      cliente = await repository.postClienteApi(newCliente);
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}
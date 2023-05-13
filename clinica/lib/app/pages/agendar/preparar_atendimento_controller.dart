import 'package:flutter/material.dart';
import '../../models/model_cliente.dart';
import '../../models/model_medico.dart';
import '../../repositories/repository_cliente.dart';
import '../../repositories/repository_medico.dart';

class PrepararAtendimentoController{
  List<ClienteModel> clientes = [];
  List<MedicoModel> medicos = [];

  final repositoryCliente = ClienteRepository();
  final repositoryMedico = MedicoRepository();
  
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      clientes = await repositoryCliente.getClienteApi();
      medicos = await repositoryMedico.getMedicoApi();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}

import 'package:clinica/app/models/model_atendimento.dart';
import 'package:clinica/app/repositories/repository_atendimento.dart';
import 'package:clinica/app/pages/agendar/components/agendar_model.dart';
import 'package:flutter/material.dart';

class AgendarController{
  AtendimentoModel atendimento = AtendimentoModel();
  final repository = AtendimentoRepository();
  
  final state = ValueNotifier <AgendarState>(AgendarState.start);

  Future start(AgendarModel agenda) async {
    state.value = AgendarState.loading;
    try {
      atendimento = await repository.postAtendimentoApi(agenda);
      state.value = AgendarState.sucess;
    } catch (e) {
      state.value = AgendarState.error;
    }
  }

}

enum AgendarState {start, loading, sucess, error}

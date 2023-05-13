import 'package:clinica/app/pages/agendar/components/agendar_model.dart';
import 'package:clinica/app/repositories/repository_atendimento.dart';

import 'package:flutter/material.dart';


class EditarController{
  
  final repository = AtendimentoRepository();
  final state = ValueNotifier <EditarState>(EditarState.start);

  Future start(AgendarModel agenda, int id) async {
    state.value = EditarState.loading;
    try {
      await repository.updateAtendimentoApi(agenda, id.toString());
      state.value = EditarState.sucess;
    } catch (e) {
      state.value = EditarState.error;
    }
  }
}
enum EditarState {start, loading, sucess, error}
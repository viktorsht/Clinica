import 'package:clinica/app/models/model_atendimento.dart';
import 'package:clinica/app/repositories/repository_atendimento.dart';
import 'package:flutter/material.dart';

class RemoverController{
  AtendimentoModel atendimento = AtendimentoModel();
  final repository = AtendimentoRepository();
  
  final state = ValueNotifier <RemoverState>(RemoverState.start);

  Future start(String idAtendimento) async {
    state.value = RemoverState.loading;
    try {
      atendimento = await repository.deleteAtendimentoApi(idAtendimento);
      state.value = RemoverState.sucess;
    } catch (e) {
      state.value = RemoverState.error;
    }
  }

}

enum RemoverState {start, loading, sucess, error}

import 'package:clinica/app/models/model_atendimento.dart';
import 'package:clinica/app/repositories/repository_atendimento.dart';
import 'package:flutter/material.dart';

class SearchAtendimentoController{
  List<AtendimentoModel> atendimentos = [];
  List<AtendimentoModel> atendimentosEncontrados = [];
  final repository = AtendimentoRepository();

  final state = ValueNotifier <HomeState>(HomeState.start);
  Future start() async {
    state.value = HomeState.loading;
    try {
      atendimentos = await repository.getAtendimentosHojeApi();
      atendimentosEncontrados = List.from(atendimentos);
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}
enum HomeState {start, loading, sucess, error}
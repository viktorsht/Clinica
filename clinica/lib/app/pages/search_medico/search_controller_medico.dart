import '../../models/model_medico.dart';
import '../../repositories/repository_medico.dart';
import 'package:flutter/material.dart';

class MedicoSearchController{
  List<MedicoModel> medicos = [];
  List<MedicoModel> medicosEncontrados = [];
  final repositoryMedico = MedicoRepository();

  final state = ValueNotifier <HomeState>(HomeState.start);
  Future start() async {
    state.value = HomeState.loading;
    try {
      medicos = await repositoryMedico.getMedicoApi();
      medicosEncontrados = List.from(medicos);
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}
enum HomeState {start, loading, sucess, error}
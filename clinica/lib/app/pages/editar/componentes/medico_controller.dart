import '../../../models/model_medico.dart';
import 'package:flutter/material.dart';

import '../../../repositories/repository_medico.dart';

class MedicoController{
  List<MedicoModel> medicos = [];
  final repositoryMedico = MedicoRepository();

  final state = ValueNotifier <MedicoState>(MedicoState.start);
  Future start() async {
    state.value = MedicoState.loading;
    try {
      medicos = await repositoryMedico.getMedicoApi();
      state.value = MedicoState.sucess;
    } catch (e) {
      state.value = MedicoState.error;
    }
  }
}
enum MedicoState {start, loading, sucess, error}
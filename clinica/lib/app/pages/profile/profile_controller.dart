import 'package:clinica/app/models/model_funcionario.dart';
import 'package:flutter/material.dart';

import '../../repositories/repository_funcionario.dart';

class ProfileController{
  var funcionario = FuncionarioModel();
  final repository = FuncionarioRepository();
  final state = ValueNotifier <HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      funcionario = (await repository.getMeApi())!;
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState {start, loading, sucess, error}
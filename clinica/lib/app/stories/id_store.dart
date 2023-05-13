import 'package:flutter/material.dart';

class IdStore {
  static final IdStore instance = IdStore._();
  IdStore._();

  final id = ValueNotifier<int>(0);


  void changeIdStore(int idAtendimento) {
    id.value = idAtendimento;
  }
}

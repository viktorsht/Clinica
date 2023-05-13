import 'package:flutter/material.dart';
import '../../config/token.dart';
import '../../repositories/repository_funcionario.dart';

class Authentication extends ChangeNotifier {
  final repository = FuncionarioRepository();
  bool _isAuthenticated = false;
  String? _token;

  String? get token => _token;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String email, String senha) async {
    // Fazer a lógica de login aqui
    try {
      _token = await repository.postLoginApp(email, senha);
      await saveToken(_token!);
      _isAuthenticated = true;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }


  Future<void> autoLogin() async {
    // Verifica se um token já foi salvo anteriormente e, se sim, faz login automaticamente
    final token = await getToken();
    if (token != null) {
      _token = token;
      _isAuthenticated = true;
      notifyListeners();
    }
  }


  void logout() async {
    // Fazer a lógica de logout aqui
    await clearToken();
    // Atualizar o estado para `AuthenticationState.loggedOut` e limpar o token
    _isAuthenticated = false;
    _token = null;
    notifyListeners();
  }

}
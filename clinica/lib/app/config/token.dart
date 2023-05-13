import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

// Salva o token de login
Future<void> saveToken(String token) async {
  await storage.write(key: 'login_token', value: token);
}

// Obtém o token de login salvo
Future<String?> getToken() async {
  return await storage.read(key: 'login_token');
}

// Limpa o token de login salvo
Future<void> clearToken() async {
  await storage.delete(key: 'login_token');
}
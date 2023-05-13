import 'package:flutter/material.dart';

import '../../../models/model_funcionario.dart';

class MyProfile extends StatelessWidget {
  final FuncionarioModel user;

  const MyProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Text(
              'Nome Completo: ${user.nome}',
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Email: ${user.email}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Telefone: ${user.telefone}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Cargo: ${user.cargo}',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
    );
  }
}
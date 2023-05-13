import 'package:flutter/material.dart';

class ErroAtendimentoPage extends StatelessWidget {
  const ErroAtendimentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 50,
        ),
        SizedBox(height: 20),
        Text(
          "Oops, algo parece que não temos atendimentos para hoje!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Não foi possível carregar esta página!",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
      ]
    );
  }
}
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: AppColors.secundaryColorApp,
            strokeWidth: 8,
          ),
          SizedBox(height: 20),
          Text(
            "Carregando...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColorApp
            ),
          ),
        ],
      ),
    );
  }
}
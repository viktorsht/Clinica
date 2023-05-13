import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';

class DonePage extends StatelessWidget {
  final String labelPrincipal;
  final String labelCarregarPage;
  final String labelRoute;
  final IconData icon;

  const DonePage({
    super.key, 
    required this.labelPrincipal, 
    required this.labelCarregarPage, 
    required this.labelRoute, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColors.grayColorApp,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.done,
                color: Colors.green,
                size: 50,
              ),
              const SizedBox(height: 20),
              Text(
                labelPrincipal,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                style: ButtonApp.themeButtonAppPrimary,
                onPressed: () => Navigator.of(context).pushNamed(labelRoute), 
                child: Text(labelCarregarPage)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
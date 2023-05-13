
import 'package:flutter/material.dart';

import '../../../../theme/app_buttons.dart';

class HomeButtons extends StatelessWidget {
  final IconData icon;
  final String label; 
  final Function()? onPressed;
  const HomeButtons({super.key, required this.label, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 250,
      child: ElevatedButton.icon(
        style: ButtonApp.themeButtonAppSecundary,
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontSize: 20),),
        onPressed: onPressed, 
      ),
    );
  }
}
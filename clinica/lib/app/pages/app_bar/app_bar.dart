import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.secundaryColorApp,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryColorApp,
          fontWeight: FontWeight.bold,
          fontSize: 45,
        ),
      ),
      centerTitle: true,
    );
  }
}

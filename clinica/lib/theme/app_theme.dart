import 'package:clinica/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData get theme => ThemeData(
    fontFamily: 'Nunito Sans',
    primaryColor: AppColors.primaryColorApp,
    //iconTheme: const IconThemeData(color: AppColors.blackColorApp),
  );

  static ThemeData get themeDark => ThemeData(
    fontFamily: 'Nunito Sans',
    primaryColor: const Color.fromARGB(255, 56, 56, 56),
    iconTheme: const IconThemeData(color: AppColors.blackColorApp),
  );
}
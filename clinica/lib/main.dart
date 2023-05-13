import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'app/app.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  initializeDateFormatting().then((_) => runApp(const App()));
}
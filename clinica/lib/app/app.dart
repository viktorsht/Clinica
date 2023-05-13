import 'package:clinica/app/pages/login/login_controller.dart';
import 'package:clinica/app/routers/routers_app.dart';
import 'package:clinica/app/pages/agendar/agendar_page.dart';
import 'package:clinica/app/pages/remover/remover_page.dart';
import 'package:clinica/app/pages/home/home.dart';
import 'package:clinica/app/pages/login/login_page.dart';
import 'package:clinica/app/pages/profile/profile_user.dart';
import 'package:clinica/app/pages/register/register_user_page.dart';
import 'package:clinica/app/pages/search_schedule/search_atendimentos_page.dart';
import 'package:clinica/app/pages/search_client/search_cliente_page.dart';
import 'package:clinica/app/pages/search_medico/search_medico_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
      ],
      child: MaterialApp(
        title: 'Clinica Médica',
        debugShowCheckedModeBanner: false,
        initialRoute: RoutersApp.root,
        routes: {
          RoutersApp.root: (context) => const LoginPage(), // LoginPage dentro do MultiProvider
          RoutersApp.home: (context) => const Home(),
          RoutersApp.profile : (context) => const ProfileUser(),
          RoutersApp.registerClientes : (context) => const RegisterUserPage(),
          RoutersApp.listarClientes : (context) => const SearchClientePage(),
          RoutersApp.listarMedicos :(context) => const SearchMedicoPage(),
          RoutersApp.atendimentosHoje :(context) => const SearchAtendimentosPage(),
          RoutersApp.agendar: (context) => const AgendarPage(),
          RoutersApp.remover: (context) => const RemoverPage(),
        },
      ),
    );
  }
}

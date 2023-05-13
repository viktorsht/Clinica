
import 'package:clinica/app/routers/routers_app.dart';
import 'package:clinica/app/pages/home/componentes/home_buttons.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColorApp,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: AppColors.secundaryColorApp,
        iconTheme: const IconThemeData(color: AppColors.primaryColorApp),
        title: const Text(
          'Clínica Médica', 
          style: TextStyle(
            color: AppColors.primaryColorApp,
            fontWeight: FontWeight.bold,
            fontSize: 45
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/profile');
            }, 
            icon: const Icon(Icons.person, grade: 5,),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeButtons(
                  label: 'Cadastro de Clientes*', 
                  icon: Icons.people, 
                  onPressed:(){Navigator.of(context).pushNamed(RoutersApp.registerClientes);}
                ),
                const SizedBox(width: 16,),
                HomeButtons(
                  label: 'Buscar Cliente*', 
                  icon: Icons.person_search, 
                  onPressed:(){Navigator.of(context).pushNamed(RoutersApp.listarClientes);}
                ),
                const SizedBox(width: 16,),
                HomeButtons(
                  label: 'Agendar Consulta*', 
                  icon: Icons.border_color, 
                  onPressed:(){Navigator.of(context).pushNamed(RoutersApp.agendar);}
                ),
                const SizedBox(width: 16,),
                HomeButtons(
                  label: 'Consultas de Hoje*', 
                  icon: Icons.today, 
                  onPressed:(){Navigator.of(context).pushNamed(RoutersApp.atendimentosHoje);}
                ),
                const SizedBox(width: 16,),
                HomeButtons(
                  label: 'Buscar Médico*', 
                  icon: Icons.person_search, 
                  onPressed:(){Navigator.of(context).pushNamed(RoutersApp.listarMedicos);}
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
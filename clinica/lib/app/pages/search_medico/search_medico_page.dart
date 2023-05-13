import 'package:clinica/app/pages/search_medico/components/search_list_medico.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';
import 'search_controller_medico.dart';
import '../../components/erro/erro.dart';
import '../../components/loading/loading_page.dart';

class SearchMedicoPage extends StatefulWidget {
  const SearchMedicoPage({super.key});

  @override
  State<SearchMedicoPage> createState() => _SearchMedicoPageState();
}

class _SearchMedicoPageState extends State<SearchMedicoPage> {

  final controller = MedicoSearchController();

  _sucess(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16), // espaço entre o botão e a appBar
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 10,),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    onChanged: (texto) {
                      setState(() {
                        controller.medicosEncontrados = controller.medicos
                        .where((medico) => medico.nome!
                            .toLowerCase()
                            .contains(texto.toLowerCase()))
                        .toList();
                      });
                    },
                    decoration: const InputDecoration(hintText: 'Digite um nome'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16), // espaço entre o botão e a ListView
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: controller.medicosEncontrados.length,
              itemBuilder: (BuildContext context, int index) {
                return ListMedicos(medico: controller.medicosEncontrados[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  _start(){
    return Container();
  }

  _loading(){
    return const LoadingPage();
  }

  _error(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ErroPage(),
          ElevatedButton(
            style: ButtonApp.themeButtonAppSecundary,
            onPressed: () {
              controller.start();
            },
            child: const Text("Tentar Novamente"),
          ),
        ],
      ),
    );
  }
  
  stateManager(HomeState state){
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.error:
        return _error();
      case HomeState.sucess:
        return _sucess();
      case HomeState.loading:
        return _loading();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secundaryColorApp,
        toolbarHeight: 100,
        iconTheme: const IconThemeData(color: AppColors.blackColorApp),
        title: const Text(
          'Clínica Médica', 
          style: TextStyle(
            color: AppColors.primaryColorApp,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder:(context, child) => stateManager(controller.state.value),
      )
    );
  }
}
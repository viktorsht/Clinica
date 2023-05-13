import 'package:clinica/app/pages/search_schedule/components/erro_atendimento_page.dart';
import 'package:clinica/app/pages/search_schedule/components/search_list_atendimentos.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';
import 'search_controller_atendimento.dart';
import '../../components/loading/loading_page.dart';

class SearchAtendimentosPage extends StatefulWidget {
  const SearchAtendimentosPage({super.key});

  @override
  State<SearchAtendimentosPage> createState() => _SearchAtendimentosPageState();
}

class _SearchAtendimentosPageState extends State<SearchAtendimentosPage> {

  final controller = SearchAtendimentoController();

  _sucess(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16), // espaço entre o botão e a ListView
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: controller.atendimentos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListAtendimentos(atendimentos: controller.atendimentos[index]);
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
          const ErroAtendimentoPage(),
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
        toolbarHeight: 100,
        backgroundColor: AppColors.secundaryColorApp,
        iconTheme: const IconThemeData(color: AppColors.blackColorApp),
        title: const Text(
          'Clínica Médica', 
          style: TextStyle(
            color: AppColors.primaryColorApp,
            fontWeight: FontWeight.bold,
            fontSize: 40
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
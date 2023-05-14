import 'package:clinica/app/pages/app_bar/app_bar.dart';
import 'package:clinica/app/pages/search_client/components/search_list_cliente.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';
import 'search_controller.dart';
import '../../components/erro/erro.dart';
import '../../components/loading/loading_page.dart';

class SearchClientePage extends StatefulWidget {
  const SearchClientePage({super.key});

  @override
  State<SearchClientePage> createState() => _SearchClientePageState();
}

class _SearchClientePageState extends State<SearchClientePage> {

  final controller = SearchController();

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
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    onChanged: (texto) {
                      setState(() {
                        controller.clientesEncontrados = controller.clientes
                        .where((cliente) => cliente.nome!
                            .toLowerCase()
                            .contains(texto.toLowerCase()))
                        .toList();
                      });
                    },
                    decoration: const InputDecoration(hintText: 'Digite um nome'),
                  ),
                ),
                const SizedBox(width: 10,),
                const Icon(Icons.search),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16), // espaço entre o botão e a ListView
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: controller.clientesEncontrados.length,
              itemBuilder: (BuildContext context, int index) {
                return ListClientes(cliente: controller.clientesEncontrados[index]);
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
              controller.startCliente();
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
    controller.startCliente();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Clinica Médica'),
      body: AnimatedBuilder(
        animation: controller.state,
        builder:(context, child) => stateManager(controller.state.value),
      )
    );
  }
}
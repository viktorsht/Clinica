
import 'package:clinica/app/stories/id_store.dart';
import 'package:clinica/app/pages/remover/components/remover_controller.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../components/done/done_page.dart';
import '../../components/erro/erro.dart';
import '../../components/loading/loading_page.dart';
import '../../routers/routers_app.dart';

class RemoverPage extends StatefulWidget {
  const RemoverPage({super.key});

  @override
  State<RemoverPage> createState() => _RemoverPageState();
}

class _RemoverPageState extends State<RemoverPage> {

  final controller = RemoverController();

  _sucess(){
    return DonePage(
      labelPrincipal: "Atendimento removido com sucesso!",
      labelCarregarPage: "Ir a tela inicial",
      labelRoute: RoutersApp.home,
      icon: Icons.done,
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
              controller.start(IdStore.instance.id.value as String);
            },
            child: const Text("Tentar Novamente"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.start(IdStore.instance.id.value.toString());
  }

  stateManager(RemoverState state){
    switch (state) {
      case RemoverState.start:
        return _start();
      case RemoverState.error:
        return _error();
      case RemoverState.sucess:
        return _sucess();
      case RemoverState.loading:
        return _loading();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller.state,
        builder:(context, child) => stateManager(controller.state.value),
      )
    );
  }
}
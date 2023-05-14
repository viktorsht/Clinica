import 'package:clinica/app/models/model_cliente.dart';
import 'package:clinica/app/models/model_medico.dart';
import 'package:clinica/app/pages/agendar/components/agendar_model.dart';
import 'package:clinica/app/pages/agendar/components/agendar_controller.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';
import '../app_bar/app_bar.dart';
import 'preparar_atendimento_controller.dart';
import '../../components/erro/erro.dart';
import '../../components/loading/loading_page.dart';

class AgendarPage extends StatefulWidget {
  const AgendarPage({super.key});

  @override
  State<AgendarPage> createState() => _AgendarPageState();
}

class _AgendarPageState extends State<AgendarPage> {

  final controllerPreparar = PrepararAtendimentoController();
  final controllerAgendar = AgendarController();

  //List<ClienteModel> clientes = [];
  //List<MedicoModel> medicos = [];
  MedicoModel? medicoSelecionado;
  ClienteModel? clienteSelecionado;

  //String dataSelecionada = '';

  DateTime _dataSelecionada = DateTime.now();


  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, 12, 31),
      selectableDayPredicate: (DateTime date) {
        // Define uma função personalizada para evitar que os domingos sejam selecionáveis
        return date.weekday != DateTime.sunday;
      },
    );
    if (dataSelecionada != null && dataSelecionada != _dataSelecionada) {
      setState(() {
        _dataSelecionada = dataSelecionada;
      });
    }
  }

  _sucess() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //DropdownButtonApp,
          const SizedBox(height: 25,),
          SizedBox(
            width: 500,
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: const Text("Escolha um médico"),
              value: medicoSelecionado,
              onChanged: (value){
                setState(() {
                  medicoSelecionado = value;
                });
              },
              items: controllerPreparar.medicos.map((medico){
                  return DropdownMenuItem<MedicoModel>(
                    value: medico,
                    child: Text("${medico.nome!} - ${medico.especialidade!}"),
                  );
                }
              ).toList(),
              decoration: InputDecoration(
                label: const Text("Médico"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16,),
          SizedBox(
            width: 500,
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: const Text("Escolha um cliente"),
              value: clienteSelecionado,
              onChanged: (value){
                setState(() {
                  clienteSelecionado = value;
                });
              },
              items: controllerPreparar.clientes.map((cliente){
                  return DropdownMenuItem<ClienteModel>(
                    value: cliente,
                    child: Text("${cliente.nome!} - ${cliente.endereco!}"),
                  );
                }
              ).toList(),
              decoration: InputDecoration(
                label: const Text("Cliente"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16,),
          const Text(
              'Data selecionada:',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_dataSelecionada.day}/${_dataSelecionada.month}/${_dataSelecionada.year}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ButtonApp.themeButtonAppToBack,
                  onPressed: () => _selecionarData(context),
                  child: const Text('Selecionar Data'),
                ),
              ],
            ),
          const SizedBox(height: 20,),
          ElevatedButton(
            style: ButtonApp.themeButtonAppSecundary,
            onPressed: () {
              String horario = "${_dataSelecionada.year}-${_dataSelecionada.month}-${_dataSelecionada.day}";
              final clienteId = clienteSelecionado?.id;
              final medicoId = medicoSelecionado?.id;
              final newAtendimendo = AgendarModel(
                clienteId: clienteId, 
                medicoId: medicoId, 
                horario: horario
              );
              controllerAgendar.start(newAtendimendo);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Atendimento cadastrado com sucesso!', 
                    style: TextStyle(
                      color: AppColors.primaryColorApp, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  backgroundColor: AppColors.greenColorApp,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Agendar'),
          ),
        ],
      ),
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
              controllerPreparar.start();
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
    controllerPreparar.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Clinica Médica'),
      body: AnimatedBuilder(
        animation: controllerPreparar.state,
        builder: (context, child) => stateManager(controllerPreparar.state.value),
      ),
    );
  }
}
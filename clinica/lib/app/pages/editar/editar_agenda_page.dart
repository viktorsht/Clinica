import 'package:clinica/app/pages/editar/componentes/editar_controller.dart';
import 'package:clinica/app/pages/editar/componentes/medico_controller.dart';
import 'package:clinica/app/models/model_atendimento.dart';
import 'package:clinica/app/stories/id_store.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';
import '../../components/erro/erro.dart';
import '../../components/loading/loading_page.dart';
import '../../models/model_medico.dart';
import '../agendar/components/agendar_model.dart';
import '../app_bar/app_bar.dart';

class EditarAgendaPage extends StatefulWidget {
  final AtendimentoModel atendimento;
  const EditarAgendaPage({super.key, required this.atendimento});

  @override
  State<EditarAgendaPage> createState() => _EditarAgendaPageState();
}

class _EditarAgendaPageState extends State<EditarAgendaPage> {

  final medicoController = MedicoController();
  final editarController = EditarController();
  MedicoModel? medicoSelecionado;

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

  @override
  void initState() {
    super.initState();
    medicoController.start();
    //String? medico = widget.atendimento.medico!.nome;
    //medicoSelecionado = widget.atendimento.medico!;
  }

  _sucess(){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Atualizar dados do Agendamento",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 500,
              child: Text(
                "Cliente: Sr(a) ${widget.atendimento.cliente!.nome}",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 500,
              child: Text(
                "Data Agendada: ${widget.atendimento.horario}",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 20,),
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
                items: medicoController.medicos.map((medico){
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
            const SizedBox(height: 30),
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
                  child: const Text('Alterar Data'),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              style: ButtonApp.themeButtonAppPrimary,
              onPressed: (){
                String horario = "${_dataSelecionada.year}-${_dataSelecionada.month}-${_dataSelecionada.day}";
                final medicoId = medicoSelecionado?.id;
                final agenda = AgendarModel(
                  clienteId: widget.atendimento.cliente!.id, 
                  medicoId: medicoId, 
                  horario: horario
                );
                IdStore.instance.changeIdStore(widget.atendimento.id!);
                editarController.start(agenda, IdStore.instance.id.value);
              //controllerAgendar.start(newAtendimendo);
              
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
              child: const Text("Editar")
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
              medicoController.start();
            },
            child: const Text("Tentar Novamente"),
          ),
        ],
      ),
    );
  }

  stateManager(MedicoState state){
    switch (state) {
      case MedicoState.start:
        return _start();
      case MedicoState.error:
        return _error();
      case MedicoState.sucess:
        return _sucess();
      case MedicoState.loading:
        return _loading();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Clinica Médica'),
      body: AnimatedBuilder(
        animation: medicoController.state,
        builder: (context, child) => stateManager(medicoController.state.value),
      ),
    );
  }
}
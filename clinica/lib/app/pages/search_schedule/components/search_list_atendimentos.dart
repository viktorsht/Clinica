import 'package:clinica/app/models/model_atendimento.dart';
import 'package:clinica/app/pages/editar/editar_agenda_page.dart';
import 'package:clinica/app/stories/id_store.dart';
import 'package:clinica/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../routers/routers_app.dart';

class ListAtendimentos extends StatelessWidget {

  final AtendimentoModel atendimentos;
  const ListAtendimentos({super.key, required this.atendimentos});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        leading: const Icon(Icons.person),
        title: Text(
          "Cliente: ${atendimentos.cliente?.nome}    Telefone: ${atendimentos.cliente?.telefone}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "Médico: ${atendimentos.medico?.nome}    Especialidade: ${atendimentos.medico?.especialidade}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => EditarAgendaPage(
                        atendimento: atendimentos,
                      )
                    )
                  );
                }, 
                icon: const Icon(Icons.edit),
                color: AppColors.editColorApp,
              ),
              const SizedBox(width: 20,),
              IconButton(
                onPressed: (){
                  //var id = atendimentos.id as String;
                  IdStore.instance.changeIdStore(atendimentos.id!);
                  Navigator.of(context).pushNamed(RoutersApp.remover);
                }, 
                icon: const Icon(Icons.delete),
                color: AppColors.removeColorApp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
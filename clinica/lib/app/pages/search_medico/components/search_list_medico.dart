import 'package:clinica/app/models/model_medico.dart';
import 'package:flutter/material.dart';

class ListMedicos extends StatelessWidget {

  final MedicoModel medico;
  const ListMedicos ({super.key, required this.medico});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        leading: const Icon(Icons.person),
        title: Text(
          "Nome: ${medico.nome}    Telefone: ${medico.telefone}    Email: ${medico.email}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "Especialidade: ${medico.especialidade}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}


/*

SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                //Navigator.of(context).pushNamed(RoutersApp.edit);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserPage(usuario: user)));
              }, 
              color: AppColors.editColorApp,
              icon: const Icon(Icons.edit),
            ),
            const SizedBox(width: 20,),
            IconButton(
              onPressed: (){
                /*
                final controller = RemoveController();
                controller.start(medico.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Usuário removido com sucesso!', style: TextStyle(color: AppColors.blackColorApp, fontWeight: FontWeight.w500),),
                    backgroundColor: AppColors.notificationColorApp,
                    behavior: SnackBarBehavior.floating
                  ),
                );
                Navigator.of(context).pushNamed(RoutersApp.home);
                */
              }, 
              color: AppColors.removeColorApp,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),

*/
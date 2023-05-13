import 'package:clinica/app/models/model_cliente.dart';
import 'package:flutter/material.dart';

class ListClientes extends StatelessWidget {

  final ClienteModel cliente;
  const ListClientes({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        leading: const Icon(Icons.person),
        title: Text(
          "Nome: ${cliente.nome}    Telefone: ${cliente.telefone}    CPF: ${cliente.cpf}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "Email: ${cliente.email}",
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
                controller.start(cliente.id!);
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
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';
import '../app_bar/app_bar.dart';
import 'register_controller.dart';
import '../../models/model_register_cliente.dart';
import '../../routers/routers_app.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  
  final _formKey = GlobalKey<FormState>();

  final _controllerNome = TextEditingController();
  final _controllerCpf = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerTelefone = TextEditingController();
  final _controllerEndereco = TextEditingController();

  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const CustomAppBar(title: 'Clinica Médica'),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            height: 600,
            width: 500,
            padding: const EdgeInsets.all(35),
            child: Column(
              children: [
                TextFormField(
                  controller: _controllerNome,
                  decoration: const InputDecoration(label: Text('Nome')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerCpf,
                  decoration: const InputDecoration(label: Text('CPF')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(label: Text('Email')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerTelefone,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Telefone')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerEndereco,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(label: Text('Endereço')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonApp.themeButtonAppToBack,
                        onPressed: (){
                          Navigator.of(context).pushReplacementNamed(RoutersApp.home);
                        }, 
                        child: const Text('Cancelar', style: TextStyle(color: AppColors.primaryColorApp, fontWeight: FontWeight.w500),),
                      ),
                      const SizedBox(width: 10,),
                      ElevatedButton(
                        style: ButtonApp.themeButtonAppPrimary,
                        onPressed: () {
                            final nome = _controllerNome.text;
                            final cpf = _controllerCpf.text; 
                            final email = _controllerEmail.text;
                            final telefone = _controllerTelefone.text;
                            final endereco = _controllerEndereco.text;
                            if(_formKey.currentState!.validate()){
                              try{
                                final cliente = RegisterClienteModel(nome: nome,cpf: cpf,email: email,telefone: telefone,endereco: endereco);
                                controller.start(cliente);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Usuário cadastrado com sucesso!', style: TextStyle(color: AppColors.primaryColorApp, fontWeight: FontWeight.w500),),
                                    backgroundColor: AppColors.greenColorApp,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Erro no cadastrado: $e', style: const TextStyle(color: AppColors.primaryColorApp, fontWeight: FontWeight.w500),),
                                    backgroundColor: AppColors.greenColorApp,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                              }
                              //Navigator.of(context).pushNamed(RoutersApp.home);
                        }, 
                        child: const Text('Salvar', style: TextStyle(color: AppColors.primaryColorApp, fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
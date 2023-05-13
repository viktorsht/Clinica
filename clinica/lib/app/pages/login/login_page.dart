import 'package:clinica/app/pages/login/login_controller.dart';
import 'package:clinica/theme/app_buttons.dart';
import 'package:clinica/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final double containerLogin = 400;
  bool sucessLogin = false;

  void showInvalidCredentialsSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      backgroundColor: AppColors.errorColorApp,
      content: Text('Email ou senha inválidos'),
      duration: Duration(seconds: 2),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Authentication>(context);
    return Scaffold(
      backgroundColor: AppColors.greenColorApp,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.grayColorApp,
              borderRadius: BorderRadius.circular(15)),
          height: containerLogin,
          width: containerLogin,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bem-vindo!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _senhaController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ButtonApp.themeButtonAppSecundary,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final senha = _senhaController.text;
                      bool sucess = await auth.login(email, senha);
                      setState(() {
                        sucessLogin = sucess;
                      });
                      if(sucessLogin == false){
                        // ignore: use_build_context_synchronously
                        showInvalidCredentialsSnackbar(context);
                      }
                      else{
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacementNamed('/home');
                      }
                    }
                  },
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

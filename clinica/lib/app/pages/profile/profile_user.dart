import 'package:clinica/app/pages/profile/componentes/my_profile.dart';
import 'package:clinica/app/config/token.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_buttons.dart';
import '../../../theme/app_colors.dart';
import 'profile_controller.dart';
import '../../components/erro/erro.dart';
import '../../components/loading/loading_page.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {

  final controller = ProfileController();

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
              controller.start();
            },
            child: const Text("Tentar Novamente"),
          ),
        ],
      ),
    );
  }
  _sucess(){
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60,),
          MyProfile(user: controller.funcionario),
          const SizedBox(height: 60,),
          ElevatedButton(
            style: ButtonApp.themeButtonAppPrimary,
            onPressed: (){
              clearToken();
              Navigator.of(context).pushReplacementNamed('/');
            }, 
            child: const Text('Sair', style: TextStyle(fontSize: 20),),
          ),
        ],
      )
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
      backgroundColor: AppColors.bodyColorApp,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: AppColors.secundaryColorApp,
        iconTheme: const IconThemeData(color: AppColors.primaryColorApp),
        title: const Text(
          'Clínica Médica', 
          style: TextStyle(
            color: AppColors.primaryColorApp,
            fontWeight: FontWeight.bold,
            fontSize: 45
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/home');
            }, 
            icon: const Icon(Icons.home, grade: 5,),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) => stateManager(controller.state.value),
      ),
    );
  }
}

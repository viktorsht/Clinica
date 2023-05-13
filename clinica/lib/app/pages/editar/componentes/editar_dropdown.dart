import 'package:clinica/app/models/model_atendimento.dart';
import 'package:flutter/material.dart';

class EditarDropDown extends StatefulWidget {
  final AtendimentoModel atendimento;
  const EditarDropDown({super.key, required this.atendimento});

  @override
  State<EditarDropDown> createState() => _EditarDropDownState();
}

class _EditarDropDownState extends State<EditarDropDown> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 16,),
          Text('Data selecionada:',),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
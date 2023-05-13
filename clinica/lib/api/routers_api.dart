import 'package:clinica/api/api.dart';

class RoutersApi{
  static String clientes = '${Api.urlApi}clientes';
  static String medicos = '${Api.urlApi}medicos';
  static String funcionarios = '${Api.urlApi}funcionarios';
  static String login = '${Api.urlApi}token';
  static String me = '${Api.urlApi}me';
  static String signup = '${Api.urlApi}signup';
  static String atendimentos = '${Api.urlApi}atendimentos';
  static String atendimentosHoje = '${Api.urlApi}atendimentos/hoje';
  static String atendimentosMedico = '${Api.urlApi}atendimentos/medico';
  static String remover = '${Api.urlApi}atendimentos/'; //completa com o id
  static String editar = '${Api.urlApi}atendimentos/'; //completa com o id
}
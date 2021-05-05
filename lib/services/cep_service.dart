import 'dart:convert';

import 'package:cep/models/address.dart';
import 'package:http/http.dart' as http;

Future<Address> buscarCep(String cep) async {
  String url = 'https://viacep.com.br/ws/$cep/json/';
  final response = await http.get(url);
  var json = jsonDecode(response.body);
  if (response.statusCode == 200) {
    if (response.body.indexOf('erro') != -1) {
      throw Exception('CEP inválido');
    }

    return Address.fromJson(json);
  } else {
    throw Exception('Failed to load address');
  }
}

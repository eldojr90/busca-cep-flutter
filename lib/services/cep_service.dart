import 'dart:convert';

import 'package:cep/models/address.dart';
import 'package:http/http.dart' as http;

Future<Address> buscarCep(String cep) async {
  String url = 'https://viacep.com.br/ws/$cep/json/';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return Address.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load address');
  }
}

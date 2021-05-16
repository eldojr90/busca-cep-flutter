import 'package:cep/models/address.dart';
import 'package:cep/services/cep_service.dart';
import 'package:cep/widgets/cep_response%20future.dart';
import 'package:flutter/material.dart';

class BuscaCepScreen extends StatefulWidget {
  @override
  _BuscaCepState createState() => _BuscaCepState();
}

class _BuscaCepState extends State<BuscaCepScreen> {
  Future<Address> addressFuture;
  String _cep = '';
  String addressFormatted = '';

  void _searchCEP(String cepSearch) {
    setState(() {
      if (cepSearch.length == 8) {
        this.addressFuture = buscarCep(cepSearch);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar CEP Correios'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  _cep = value;
                  _searchCEP(_cep);
                },
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CEP',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                //FutureBuilder trata objetos do tipo Future
                child: Center(
                  child: CepResponseFuture(
                    addressFuture: this.addressFuture,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

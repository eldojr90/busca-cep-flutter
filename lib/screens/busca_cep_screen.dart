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
      this.addressFuture =
          (cepSearch.length == 8) ? buscarCep(cepSearch) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Buscar CEP Correios'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    _cep = value;
                    _searchCEP(_cep);
                  },
                  maxLength: 8,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'CEP'),
                ),
                SizedBox(
                  height: 25,
                ),
                CepResponseFuture(
                  addressFuture: this.addressFuture,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

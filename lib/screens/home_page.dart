import 'package:cep/models/address.dart';
import 'package:cep/services/cep_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Address> futureAddress;
  String _cep = '';

  void _getAddressByCep(String cepSearch) {
    setState(() {
      this.futureAddress = buscarCep(cepSearch);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buscar CEP Correios')),
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
                },
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CEP',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  if (this._cep.length == 8) {
                    _getAddressByCep(this._cep);
                  }
                },
                child: Text(
                  'Buscar',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: FutureBuilder(
                  future: futureAddress,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var enderecoObj = snapshot.data;
                      var text = (enderecoObj.logradouro != null)
                          ? "${enderecoObj.logradouro}, "
                          : "";
                      text += (enderecoObj.complemento != null)
                          ? "${enderecoObj.complemento}, "
                          : "";
                      text += (enderecoObj.bairro != null)
                          ? "${enderecoObj.bairro}, "
                          : "";
                      text += (enderecoObj.localidade != null)
                          ? "${enderecoObj.localidade}, "
                          : "";
                      text +=
                          (enderecoObj.uf != null) ? "${enderecoObj.uf}." : "";
                      return Text(
                        text,
                        style: TextStyle(fontSize: 30),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

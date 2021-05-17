import 'package:cep/models/address.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CepResponse extends StatelessWidget {
  final AsyncSnapshot snapshot;
  List<Text> _addressView = List.empty(growable: true);
  Widget _responseView;
  double _sizeTextResponse = 18;

  CepResponse({this.snapshot});

  void _setFormattedAddress(Address address) {
    if ((address.logradouro != '')) {
      _addressView.add(Text(
        "${address.logradouro}",
        style: TextStyle(
          fontSize: _sizeTextResponse,
        ),
      ));
    }

    if ((address.complemento != '')) {
      _addressView.add(Text(
        "${address.complemento}",
        style: TextStyle(
          fontSize: _sizeTextResponse,
        ),
      ));
    }

    if ((address.bairro != '')) {
      _addressView.add(Text(
        "Bairro ${address.bairro}",
        style: TextStyle(
          fontSize: _sizeTextResponse,
        ),
      ));
    }

    if ((address.localidade != '' && address.uf != '')) {
      _addressView.add(Text(
        "${address.localidade} - ${address.uf}",
        style: TextStyle(
          fontSize: _sizeTextResponse,
        ),
      ));
    }
  }

  void _setResponseView() {
    if (this.snapshot.hasData) {
      _setFormattedAddress(this.snapshot.data);
      _responseView = Column(
        children: _addressView,
      );
    }

    if (this.snapshot.hasError) {
      _responseView = Text('${this.snapshot.error}');
    }

    if (this.snapshot.connectionState == ConnectionState.none) {
      _responseView = Text("Informe um CEP");
    }
  }

  @override
  Widget build(BuildContext context) {
    _setResponseView();

    return _responseView;
  }
}

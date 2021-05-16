import 'package:cep/models/address.dart';
import 'package:flutter/material.dart';

class CepResponseBuilder extends StatelessWidget {
  final AsyncSnapshot snapshot;
  String _addressFormatted;
  String _responseText;

  CepResponseBuilder({this.snapshot});

  void _updateAddressFormatted(Address address) {
    _addressFormatted =
        (address.logradouro != '') ? "${address.logradouro}, " : "";
    _addressFormatted +=
        (address.complemento != '') ? "${address.complemento}, " : "";
    _addressFormatted += (address.bairro != '') ? "${address.bairro}, " : "";
    _addressFormatted +=
        (address.localidade != '') ? "${address.localidade}, " : "";
    _addressFormatted += (address.uf != null) ? "${address.uf}." : "";

    _responseText = _addressFormatted;
  }

  void _updateResponseText() {
    if (this.snapshot.hasData) {
      _updateAddressFormatted(this.snapshot.data);
    }

    if (this.snapshot.hasError) {
      _responseText = '${this.snapshot.error}';
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateResponseText();

    return Text(
      _responseText ?? "",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

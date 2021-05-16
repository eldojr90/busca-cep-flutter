import 'package:cep/models/address.dart';
import 'package:cep/widgets/cep_response.dart';
import 'package:flutter/material.dart';

class CepResponseFuture extends StatelessWidget {
  final Future<Address> addressFuture;

  CepResponseFuture({
    this.addressFuture,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.addressFuture,
      builder: (context, snapshot) {
        return CepResponse(
          snapshot: snapshot,
        );
      },
    );
  }
}

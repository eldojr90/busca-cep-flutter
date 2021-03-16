class Address {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;

  Address(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
    );
  }
}

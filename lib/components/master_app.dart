import 'package:cep/screens/busca_cep_screen.dart';
import 'package:flutter/material.dart';

class Master extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: BuscaCepScreen(),
    );
  }
}

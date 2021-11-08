import 'package:flutter/material.dart';
import 'package:lead_calculadora/model/calculadora_model.dart';
import 'package:provider/provider.dart';

import 'controller.dart/calculadora_controller.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CalculadoraController>.value(value: CalculadoraController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculadora",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CalculadoraWidget(),
      ),
    );
  }
}

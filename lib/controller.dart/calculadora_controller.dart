import 'package:lead_calculadora/model/calculadora_model.dart';

class CalculadoraController {
  List<CalculadoraModel> calculadoraModel = [
    CalculadoraModel(
      button1: "7",
      button2: "4",
      button3: "1",
      operador: "x",
    ),
    CalculadoraModel(
      button1: "8",
      button2: "5",
      button3: "2",
      operador: "-",
    ),
    CalculadoraModel(
      button1: "9",
      button2: "6",
      button3: "3",
      operador: "+",
    ),
    CalculadoraModel(
      button1: "0",
      button2: "=",
      button3: "DEL",
      operador: "/",
    ),
  ];
}

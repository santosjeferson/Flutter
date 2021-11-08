import 'package:flutter/material.dart';
import 'package:lead_calculadora/model/calculadora_model.dart';
import 'package:provider/provider.dart';

import 'controller.dart/calculadora_controller.dart';

class CalculadoraWidget extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<CalculadoraWidget> {
  String _out = "0";
  String output = "";
  String inicio = "0.0";
  String operadores = "";
  double numero1 = 0.0;
  double numero2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Consumer<CalculadoraController>(
        builder: (context, calculadoraController, widget) {
          return _calculadora(calculadoraController);
        },
      ),
    );
  }

  _calculadora(CalculadoraController calc) {
    return Column(
      children: <Widget>[
        _top(),
        const Divider(
          height: 0.1,
        ),
        _table(calc),
      ],
    );
  }

  Widget _top() {
    return Container(
        // width: (MediaQuery.of(context).size.width).toDouble(),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 80.0),
        color: Colors.black,
        child: inicio == "0.0"
            ? Text(
                inicio,
                style: const TextStyle(fontSize: 25.0, color: Colors.white60),
              )
            : Text(
                output,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ));
  }

  Widget _table(
    CalculadoraController calc,
  ) {
    return Flexible(
        child: GridView.count(
      controller: ScrollController(keepScrollOffset: false),
      childAspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height /
          2.42,
      crossAxisCount: 4,
      children: List.generate(calc.calculadoraModel.length, (index) {
        return Container(
          height: 250,
          margin: const EdgeInsets.only(top: 1.0),
          padding: const EdgeInsets.all(1),
          child: Card(child: _itens(calc.calculadoraModel[index])),
        );
      }),
    ));
  }

  _itens(CalculadoraModel calcModel) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 100.0,
          child: RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text(
              calcModel.button1,
              style: const TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _calcular(calcModel.button1);
            },
          ),
          padding: const EdgeInsets.all(2.0),
        ),
        Container(
          color: Colors.white,
          height: 100.0,
          child: RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text(
              calcModel.button2,
              style: const TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _calcular(calcModel.button2);
            },
          ),
          padding: const EdgeInsets.all(2.0),
        ),
        Container(
          color: Colors.white,
          height: 100.0,
          child: RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text(
              calcModel.button3,
              style: const TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _calcular(calcModel.button3);
            },
          ),
          padding: const EdgeInsets.all(2.0),
        ),
        Container(
          color: Colors.white,
          height: 100.0,
          child: RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text(
              calcModel.operador,
              style: const TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _calcular(calcModel.operador);
            },
          ),
          padding: const EdgeInsets.all(2.0),
        ),
      ],
    );
  }

  _calcular(String opcao) {
    inicio = "";
    if (opcao == "DEL") {
      _out = "0";
      inicio = "0.0";
      numero1 = 0.0;
      numero2 = 0.0;
      operadores = "";
    } else if (opcao == "+" || opcao == "-" || opcao == "x" || opcao == "/") {
      numero1 = double.parse(output);
      operadores = opcao;
      _out = "0";
      output = output + opcao;
    } else if (opcao == "=") {
      numero2 = double.parse(output);
      if (operadores == "+") {
        _out = (numero2 + numero1).toString();
      }
      if (operadores == "-") {
        _out = (numero1 - numero2).toString();
      }
      if (operadores == "x") {
        _out = (numero2 * numero1).toString();
      }
      if (operadores == "/") {
        _out = (numero1 / numero2).toString();
      }
      numero1 = 0.0;
      numero2 = 0.0;
      //_out = "0";
    } else {
      _out = _out + opcao;
    }
    setState(() {
      output = double.parse(_out).toString();
    });
  }
}

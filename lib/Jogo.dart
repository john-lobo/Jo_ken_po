import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagem = AssetImage("images/padrao.png");
  var resultado = "Escolha uma opção abaixo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //TEXTO
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Escolha do app:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            //IMAGEM
            Image(
              image: this._imagem,
            ),
            //TEXTO
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                resultado,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            //ROW 3 IMAGENS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      opcaoSelecioda("pedra");
                    },
                    child: Image.asset("images/pedra.png", height: 100)),
                GestureDetector(
                  onTap: () {
                    opcaoSelecioda("papel");
                  },
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                    onTap: () {
                      opcaoSelecioda("tesoura");
                    },
                    child: Image.asset("images/tesoura.png", height: 100)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void opcaoSelecioda(String usuario) {
    var random = new Random().nextInt(3);
    var opcoes = ["pedra", "papel", "tesoura"];
    var escolhApp = opcoes[random];

    setState(() {
      switch (escolhApp) {
        case "pedra":
          _imagem = AssetImage("images/pedra.png");
          break;
        case "papel":
          _imagem = AssetImage("images/papel.png");
          break;
        case "tesoura":
          _imagem = AssetImage("images/tesoura.png");
      }
    });

    setState(() {
      if (
          (escolhApp == "pedra" && usuario == "pedra") ||
          (escolhApp == "tesoura" && usuario == "tesoura") ||
          (escolhApp == "papel" && usuario == "papel")
      ) {
        resultado = "Empate";
      } else if (
          (escolhApp == "papel" && usuario == "pedra") ||
          (escolhApp == "pedra" && usuario == "tesoura") ||
          (escolhApp == "tesoura" && usuario == "papel")
      ){
        resultado = "Voce perdeu";
      } else {
        resultado = "Voce ganhou";
      }
    });
  }
}

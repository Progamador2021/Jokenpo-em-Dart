import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção a baixo ";

  void _opcaoSelecionada(String escolhaUsuario){
      print("Opção Selecionada Usuario: "+ escolhaUsuario);

      var opcoes = ["pedra","papel","tesoura"];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];
      print("Opção Selecionada App: "+ escolhaApp);

      switch (escolhaApp){
        case "pedra":
          setState(() {
            this._imagemApp = AssetImage("imagens/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            this._imagemApp = AssetImage("imagens/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            this._imagemApp = AssetImage("imagens/tesoura.png");
          });
          break;
      }

      //Validação
    if((escolhaUsuario == "pedra" && escolhaApp == "tesoura")||
       (escolhaUsuario == "tesoura" && escolhaApp == "papel")||
       (escolhaUsuario == "papel" && escolhaApp == "pedra")

    ){
      this._mensagem = "Usuário ganhou";
    }else if(
        (escolhaUsuario == "pedra" && escolhaApp == "pedra")||
        (escolhaUsuario == "tesoura" && escolhaApp == "tesoura")||
        (escolhaUsuario == "papel" && escolhaApp == "papel")

    ){
      this._mensagem = "Empate";
    }else{
      this._mensagem = "Maquina ganhou";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(


        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           //text
          Padding(padding:EdgeInsets.only(top: 25, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Image(image: this._imagemApp),

          Padding(padding:EdgeInsets.only(top: 25, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Expanded(
                  child: Image.asset("imagens/pedra.png", height: 100),
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Expanded(
                  child: Image.asset("imagens/papel.png", height: 100),
                ),
              ) ,
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Expanded(
                  child: Image.asset("imagens/tesoura.png", height: 100)
                ),
              ) ,
            ],
          )

           //imagem

          //Image(image: Image.asset("images/padrao.png"))
           //texto
          //Text("TEXTO")
           //linha
        ],
      ),
    );
  }
}

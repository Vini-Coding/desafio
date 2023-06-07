import 'package:flutter/material.dart';
import '../model/intro.dart';

class IntroController extends ValueNotifier<PageController> {
  IntroController() : super(PageController(initialPage: 0));
  ValueNotifier<int> pageIndex = ValueNotifier(0);

  void newPageIndex(int newIndex) {
    pageIndex.value = newIndex;
  }

  final List<Intro> introContent = [
    Intro(
      title: "Bem-vindo ao PROTECHTOR GEARS",
      assetImage: "assets/vectors/introview1.png",
      description:
          "O Protechtor Gears é um aplicativo onde você pode validar quais senhas em uma lista são fracas ou fortes",
    ),
    Intro(
      title: "ADICIONE, LEIA, EDITE E DELETE",
      assetImage: "assets/vectors/introview2.png",
      description:
          "Além disso, você ainda pode adicionar novas senhas, ler, editar ou deletar senhas existentes na lista",
    ),
    Intro(
      title: "NÃO PERCA TEMPO",
      assetImage: "assets/vectors/introview3.png",
      description:
          "Aproveite e dê início nessa jornada com o Protechtive Gears",
    ),
  ];
}

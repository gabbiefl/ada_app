// Ponto de entrada do app. É o primeiro arquivo que o Flutter executa.
//
// Mantemos este arquivo mínimo de propósito: ele só "liga" o app.
// A configuração (tema, rotas, tela inicial) fica em app.dart.

import 'package:flutter/material.dart';

// 'package:ada_app/...' é o caminho a partir da pasta lib/ do nosso projeto.
// O nome 'ada_app' vem do campo `name` do pubspec.yaml.
import 'package:ada_app/app.dart';

// main() é a porta de entrada de qualquer programa Dart. É a primeira função executada.
void main() {
  // runApp(...) recebe o widget raiz (AdaApp), "infla" a tela com ele e fica vivo desenhando e reagindo a toques.
  //
  // const diz que esse widget é imutável e conhecido em tempo de compilação. O Flutter o reaproveita em vez de recriar, o que economiza trabalho.
  runApp(const AdaApp());
}

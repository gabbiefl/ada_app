// Teste de widget: monta o app em um ambiente de teste (sem emulador)
// e verifica o que aparece na tela.
//
// Rode com: flutter test

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/app.dart';

void main() {
  // `testWidgets` cria um teste que recebe um `tester`, o "controle remoto"
  // para montar widgets, tocar na tela e consultar o que está visível.
  testWidgets('A tela inicial mostra o nome e o lema do ADA', (tester) async {
    // Monta o app e espera o primeiro quadro ser desenhado.
    await tester.pumpWidget(const AdaApp());

    // `find.text` procura um Text com exatamente esse conteúdo.
    expect(find.text('ADA'), findsOneWidget);
    expect(find.text('Alerta, Defesa e Apoio'), findsOneWidget);
  });

  testWidgets('O app aplica o tema do ADA', (tester) async {
    await tester.pumpWidget(const AdaApp());

    // Procura o MaterialApp montado e confere o fundo do tema que ele recebeu.
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.theme?.scaffoldBackgroundColor, const Color(0xFFF8FAFC));
  });
}

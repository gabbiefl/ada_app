// Teste de widget: monta o app em um ambiente de teste (sem emulador)
// e verifica o que aparece na tela.
//
// Rode com: flutter test

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/app.dart';
import 'package:ada_app/core/theme/app_theme.dart';
import 'package:ada_app/features/home/pages/home_page.dart';

void main() {
  // `testWidgets` cria um teste que recebe um `tester`, o "controle remoto"
  // para montar widgets, tocar na tela e consultar o que está visível.
  testWidgets('A tela inicial mostra a saudação', (tester) async {
    // Monta o app e espera o primeiro quadro ser desenhado.
    await tester.pumpWidget(const AdaApp());

    // `find.text` procura um Text com exatamente esse conteúdo.
    expect(find.text('Olá, Gabriela'), findsOneWidget);
    expect(find.text('Estamos com você!'), findsOneWidget);
    // Os dois cards dos modos aparecem.
    expect(find.text('MODO PERIGO'), findsOneWidget);
    expect(find.text('MODO ATENÇÃO'), findsOneWidget);
  });

  testWidgets('O app aplica o tema do ADA', (tester) async {
    await tester.pumpWidget(const AdaApp());

    // Procura o MaterialApp montado e confere o fundo do tema que ele recebeu.
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.theme?.scaffoldBackgroundColor, const Color(0xFFF8FAFC));
  });

  testWidgets('A Home mostra o estado Modo perigo ativo', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const HomePage(dangerActive: true),
      ),
    );

    expect(find.text('Modo perigo ativo'), findsOneWidget);
    expect(find.text('Toque no ícone para desativar.'), findsOneWidget);
    expect(find.text('Nenhum alerta ativo no momento.'), findsNothing);
  });
}

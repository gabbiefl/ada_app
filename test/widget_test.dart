// Teste de widget: monta o app em um ambiente de teste (sem emulador)
// e verifica o que aparece na tela.
//
// Rode com: flutter test

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
}

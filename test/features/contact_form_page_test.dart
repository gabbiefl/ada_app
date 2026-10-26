// Testa a tela Novo contato (estática).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/core/theme/app_theme.dart';
import 'package:ada_app/features/contacts/pages/contact_form_page.dart';

void main() {
  testWidgets('O cadastro mostra os campos e os botões', (tester) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.light, home: const ContactFormPage()),
    );

    expect(find.text('Novo contato'), findsOneWidget);
    expect(find.text('Nome'), findsOneWidget);
    expect(find.text('Telefone'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Salvar contato'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);
  });

  test('o botão principal do tema é azul-marinho', () {
    final cor = AppTheme.light.colorScheme.primary;
    expect(cor, const Color(0xFF172033));
  });
}

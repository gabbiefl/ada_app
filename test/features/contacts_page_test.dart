// Testa a tela Rede de contatos (estática).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/core/theme/app_theme.dart';
import 'package:ada_app/features/contacts/pages/contacts_page.dart';

void main() {
  testWidgets('A Rede mostra 3 contatos, 2 espaços vazios e o contador', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.light, home: const ContactsPage()),
    );

    expect(find.text('Rede de contatos'), findsOneWidget);
    expect(find.text('3/5'), findsOneWidget);
    expect(find.text('Gabriela Flores'), findsOneWidget);
    // Iniciais calculadas a partir do nome.
    expect(find.text('YC'), findsOneWidget);
    expect(find.text('Adicionar contato'), findsNWidgets(2));
  });
}

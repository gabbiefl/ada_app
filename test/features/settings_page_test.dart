// Testa a tela Configurações (estática).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/core/theme/app_theme.dart';
import 'package:ada_app/features/settings/pages/settings_page.dart';

void main() {
  testWidgets('Configurações mostra os três itens do menu', (tester) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.light, home: const SettingsPage()),
    );

    expect(find.text('Configurações'), findsOneWidget);
    expect(find.text('Horário de cobertura'), findsOneWidget);
    expect(find.text('Histórico de alertas'), findsOneWidget);
    expect(find.text('Mensagens personalizadas'), findsOneWidget);
  });
}

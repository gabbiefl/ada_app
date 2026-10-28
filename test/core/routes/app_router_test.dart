// Testa a navegação do app: barra inferior, telas internas e voltar.
//
// Não usamos pumpAndSettle porque a Home tem uma animação que nunca termina
// (os anéis pulsando): ele esperaria para sempre. `pump` com duração avança o
// relógio do teste por um tempo fixo, o suficiente para a transição de tela.

import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:ada_app/app.dart';

Future<void> _passTime(WidgetTester tester) =>
    tester.pump(const Duration(milliseconds: 600));

void main() {
  testWidgets('A barra inferior leva às abas', (tester) async {
    await tester.pumpWidget(const AdaApp());
    await _passTime(tester);
    expect(find.text('Olá, Gabriela'), findsOneWidget);

    await tester.tap(find.byIcon(LucideIcons.users));
    await _passTime(tester);
    expect(find.text('Rede de contatos'), findsOneWidget);

    await tester.tap(find.byIcon(LucideIcons.mapPin));
    await _passTime(tester);
    expect(find.text('Mapa'), findsOneWidget);
  });

  testWidgets('Configurações abre Mensagens e a edição, e dá para voltar', (
    tester,
  ) async {
    await tester.pumpWidget(const AdaApp());
    await _passTime(tester);

    await tester.tap(find.byIcon(LucideIcons.settings));
    await _passTime(tester);
    await tester.tap(find.text('Mensagens personalizadas'));
    await _passTime(tester);
    expect(find.text('Modo atenção'), findsOneWidget);

    await tester.tap(find.text('Editar').first);
    await _passTime(tester);
    expect(find.text('Texto da mensagem'), findsOneWidget);

    await tester.tap(find.text('Cancelar'));
    await _passTime(tester);
    expect(find.text('Modo atenção'), findsOneWidget);
  });

  testWidgets('Adicionar contato abre o cadastro e Cancelar volta', (
    tester,
  ) async {
    await tester.pumpWidget(const AdaApp());
    await _passTime(tester);

    await tester.tap(find.byIcon(LucideIcons.users));
    await _passTime(tester);
    await tester.tap(find.text('Adicionar contato').first);
    await _passTime(tester);
    expect(find.text('Novo contato'), findsOneWidget);

    await tester.tap(find.text('Cancelar'));
    await _passTime(tester);
    expect(find.text('Rede de contatos'), findsOneWidget);
  });
}

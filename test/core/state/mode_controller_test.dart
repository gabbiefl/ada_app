// Testa a lógica do modo atual, sem desenhar nenhuma tela.

import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/core/state/mode_controller.dart';
import 'package:ada_app/core/state/security_mode.dart';

void main() {
  test('começa no modo normal', () {
    expect(ModeController().mode, SecurityMode.normal);
  });

  test('activate troca o modo e deactivate volta ao normal', () {
    final controller = ModeController();

    controller.activate(SecurityMode.danger);
    expect(controller.mode, SecurityMode.danger);

    controller.deactivate();
    expect(controller.mode, SecurityMode.normal);
  });

  test('avisa quem está ouvindo só quando o modo muda', () {
    final controller = ModeController();
    var avisos = 0;
    controller.addListener(() => avisos++);

    controller.activate(SecurityMode.attention);
    controller.activate(SecurityMode.attention); // igual: não avisa
    controller.deactivate();

    expect(avisos, 2);
  });
}

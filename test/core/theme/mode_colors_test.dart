// Testa se as cores dos modos estão disponíveis pelo tema do ADA.
//
// Se alguém apagar `extensions: [ModeColors.light]` do AppTheme, este teste falha
// e avisa antes de o app travar (lembra do `!` em ModeColors.of?).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/core/theme/app_colors.dart';
import 'package:ada_app/core/theme/app_theme.dart';
import 'package:ada_app/core/theme/mode_colors.dart';

void main() {
  testWidgets('ModeColors fica disponível pelo tema', (tester) async {
    // `late`: a variável começa vazia e recebe valor mais abaixo, dentro do Builder.
    late ModeColors cores;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        // Builder entrega um `context` que está DENTRO do MaterialApp,
        // onde o tema já existe. Sem isso, Theme.of não acharia o nosso tema.
        home: Builder(
          builder: (context) {
            cores = ModeColors.of(context);
            return const SizedBox();
          },
        ),
      ),
    );

    // expect(valor_obtido, valor_esperado): o teste passa se forem iguais.
    expect(cores.danger, AppColors.modeDanger);
    expect(cores.attention, AppColors.modeAttention);
    expect(cores.normal, AppColors.modeNormal);
  });
}

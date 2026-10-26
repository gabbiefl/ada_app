// Testa os valores básicos do tema do ADA: a fonte e o fundo das telas.
//
// Os valores esperados estão escritos aqui de propósito (e não vêm de AppColors):
// assim, se alguém mudar o valor no tema, o teste acusa em vez de mudar junto.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ada_app/core/theme/app_theme.dart';

void main() {
  // `test` comum: não desenha nada na tela, só confere valores.
  test('o tema usa a fonte Nunito e o fundo #F8FAFC', () {
    final tema = AppTheme.light;

    expect(tema.scaffoldBackgroundColor, const Color(0xFFF8FAFC));
    expect(tema.textTheme.bodyMedium?.fontFamily, 'Nunito');
  });
}

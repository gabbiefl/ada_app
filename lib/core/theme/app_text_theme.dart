// Estilos de texto do ADA, todos na fonte Nunito.
//
// Material 3 define 15 "papéis" de texto (displayLarge, titleMedium, bodySmall...).
// Aqui dizemos qual tamanho e peso o design usa em cada papel. Nos widgets,
// usamos o papel (Theme.of(context).textTheme.titleMedium), e não um tamanho solto.

import 'package:flutter/material.dart';

import 'package:ada_app/core/theme/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  // Nome da família, igual ao declarado no pubspec.yaml.
  static const String fontFamily = 'Nunito';

  // FONTE VARIÁVEL: o arquivo Nunito-VariableFont_wght.ttf contém TODOS os pesos
  // em um só arquivo, controlados por um "eixo" chamado `wght` (de 200 a 1000).
  // O peso padrão do arquivo é o mais fino (200), então precisamos pedir o peso
  // exato com FontVariation. Fazemos isso em todos os estilos, para que nenhum
  // texto do app saia "magro" sem querer.
  static TextStyle _style(
    double size,
    FontWeight weight, {
    Color color = AppColors.textPrimary,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      // weight.value é o número do peso (400, 700...). O eixo espera um double.
      fontVariations: [FontVariation('wght', weight.value.toDouble())],
      color: color,
    );
  }

  // Os valores abaixo vêm do Figma (seção 12.2 do plano da Fase 2).
  static TextTheme get textTheme => TextTheme(
        // Papéis que o design usa de fato
        headlineSmall: _style(24, FontWeight.w600), // "Olá, Gabriela"
        titleMedium: _style(16, FontWeight.w700), // "MODO PERIGO"
        bodyLarge: _style(16, FontWeight.w400, color: AppColors.textSecondary),
        bodyMedium: _style(15, FontWeight.w300, color: AppColors.textSecondary),
        bodySmall: _style(13, FontWeight.w400, color: AppColors.textSecondary),
        labelLarge: _style(15, FontWeight.w500), // chip "Modo perigo ativo"
        labelMedium: _style(14, FontWeight.w300, color: AppColors.textSecondary),

        // Papéis que o design ainda não usa: ficam com valores razoáveis
        // (tamanhos padrão do Material 3) e serão ajustados se aparecerem.
        displayLarge: _style(57, FontWeight.w400),
        displayMedium: _style(45, FontWeight.w400),
        displaySmall: _style(36, FontWeight.w400),
        headlineLarge: _style(32, FontWeight.w400),
        headlineMedium: _style(28, FontWeight.w400),
        titleLarge: _style(22, FontWeight.w400),
        titleSmall: _style(14, FontWeight.w500),
        labelSmall: _style(11, FontWeight.w500),
      );
}

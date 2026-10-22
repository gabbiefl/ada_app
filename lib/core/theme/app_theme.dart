// Tema do ADA: junta a paleta (app_colors.dart) e os textos (app_text_theme.dart)
// em um único ThemeData, que o MaterialApp distribui para o app inteiro.
//
// Só existe o tema claro: o design não tem modo escuro (ver IDEIA-07 no backlog).

import 'package:flutter/material.dart';

import 'package:ada_app/core/theme/app_colors.dart';
import 'package:ada_app/core/theme/app_text_theme.dart';
import 'package:ada_app/core/theme/mode_colors.dart';

class AppTheme {
  AppTheme._();

  // `static` + `get`: um valor calculado, acessado como AppTheme.light.
  static ThemeData get light {
    // ColorScheme: o conjunto de cores "por função" do Material 3. Cada cor tem
    // um par `on...` (a cor do conteúdo desenhado SOBRE ela, ex.: texto no botão).
    // Aqui usamos as cores explícitas do Figma, e não ColorScheme.fromSeed, que
    // inventaria tons que o design não tem.
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.brand, // PROVISÓRIO: confirmar com os botões (Fase 3)
      onPrimary: Colors.white,
      secondary: AppColors.modeNormal,
      onSecondary: Colors.white,
      error: AppColors.modeDanger,
      onError: Colors.white,
      surface: AppColors.background,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.border,
      outlineVariant: AppColors.border,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // Cor de fundo das telas (Scaffold).
      scaffoldBackgroundColor: AppColors.background,
      // Fonte padrão do app e estilos de texto.
      fontFamily: AppTextTheme.fontFamily,
      textTheme: AppTextTheme.textTheme,
      // Extensões: valores próprios do ADA dentro do tema (cores dos modos).
      // Nos widgets: ModeColors.of(context).danger
      extensions: const [ModeColors.light],
    );
  }
}

// Cores dos três modos de segurança do ADA: Normal, Atenção e Perigo.
//
// O ColorScheme do Material não tem "cor do modo perigo": ele só conhece papéis
// genéricos (primary, error...). Para guardar valores próprios do nosso app dentro
// do tema, o Flutter oferece o ThemeExtension. Assim, qualquer widget pega as cores
// dos modos com ModeColors.of(context), do mesmo jeito que pega o resto do tema.

import 'package:flutter/material.dart';

import 'package:ada_app/core/theme/app_colors.dart';

// `extends ThemeExtension<ModeColors>`: dizemos ao Flutter que esta classe pode
// ser guardada dentro do ThemeData. O tipo entre < > é a própria classe.
@immutable
class ModeColors extends ThemeExtension<ModeColors> {
  const ModeColors({
    required this.normal,
    required this.attention,
    required this.attentionText,
    required this.danger,
    required this.dangerText,
  });

  final Color normal;
  final Color attention; // círculo do ícone
  final Color attentionText; // texto e sublinhado
  final Color danger;
  final Color dangerText;

  // Os valores do design (Figma), reunidos em um objeto pronto para usar.
  static const ModeColors light = ModeColors(
    normal: AppColors.modeNormal,
    attention: AppColors.modeAttention,
    attentionText: AppColors.modeAttentionText,
    danger: AppColors.modeDanger,
    dangerText: AppColors.modeDangerText,
  );

  // Cores derivadas: no design, o fundo do card é a cor do modo a 15% de
  // opacidade e a borda a 50%. Calculamos aqui para não repetir as contas.
  // `withValues(alpha: 0.15)` devolve a mesma cor, só que mais transparente.
  Color get attentionBackground => attention.withValues(alpha: 0.15);
  Color get attentionBorder => attention.withValues(alpha: 0.5);
  Color get dangerBackground => danger.withValues(alpha: 0.15);
  Color get dangerBorder => danger.withValues(alpha: 0.5);

  // Atalho de leitura: ModeColors.of(context). O `!` afirma que a extensão existe;
  // ela é registrada em AppTheme, então sempre estará lá.
  static ModeColors of(BuildContext context) {
    return Theme.of(context).extension<ModeColors>()!;
  }

  // O Flutter exige estes dois métodos em todo ThemeExtension.

  // copyWith: cria uma cópia trocando só alguns campos (a classe é imutável).
  @override
  ModeColors copyWith({
    Color? normal,
    Color? attention,
    Color? attentionText,
    Color? danger,
    Color? dangerText,
  }) {
    return ModeColors(
      normal: normal ?? this.normal,
      attention: attention ?? this.attention,
      attentionText: attentionText ?? this.attentionText,
      danger: danger ?? this.danger,
      dangerText: dangerText ?? this.dangerText,
    );
  }

  // lerp (de "linear interpolation"): o valor intermediário entre dois temas,
  // usado quando o tema muda com animação. `t` vai de 0.0 (este tema) a 1.0
  // (o outro). Hoje só temos o tema claro, mas o Flutter pede o método mesmo assim.
  @override
  ModeColors lerp(ThemeExtension<ModeColors>? other, double t) {
    if (other is! ModeColors) return this;
    return ModeColors(
      normal: Color.lerp(normal, other.normal, t)!,
      attention: Color.lerp(attention, other.attention, t)!,
      attentionText: Color.lerp(attentionText, other.attentionText, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerText: Color.lerp(dangerText, other.dangerText, t)!,
    );
  }
}

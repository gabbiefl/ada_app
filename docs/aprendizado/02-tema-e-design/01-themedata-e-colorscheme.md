# 01 — ThemeData e ColorScheme

O `ThemeData` reúne o visual do app (cores, textos, fundo) em um só objeto. O `MaterialApp` o distribui para todas as telas, e qualquer widget lê com `Theme.of(context)`.

## ColorScheme: cores por função
Em vez de "azul" ou "rosa", o Material 3 nomeia a cor pelo **papel**: `primary`, `error`, `surface`, `outline`. Cada cor tem um par `on...` (a cor do conteúdo desenhado sobre ela): `onPrimary` é o texto dentro de um botão `primary`.

```dart
const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.brand,
  onPrimary: Colors.white,
  // ...
);
```

Há duas formas de montar um `ColorScheme`:
- `ColorScheme.fromSeed(seedColor: ...)`: gera a paleta toda a partir de uma cor. Rápido, mas inventa tons.
- `ColorScheme(...)` explícito: você informa cada cor. É o que o ADA usa, para ser fiel ao Figma.

## Lendo o tema num widget
```dart
final cor = Theme.of(context).colorScheme.primary;
```
O `context` precisa estar **dentro** do `MaterialApp`, onde o tema já existe.

## Design tokens
São os valores do design guardados com nome (`AppColors.background`) e não como números soltos (`0xFFF8FAFC`) espalhados pelas telas. Mudou o design? Muda em um lugar só.

## No ADA
- `lib/core/theme/app_colors.dart`: os tokens de cor, extraídos do Figma (seção 12 do plano da Fase 2).
- `lib/core/theme/app_theme.dart`: monta o `ThemeData`.
- `lib/app.dart`: entrega `AppTheme.light` ao `MaterialApp`.

# 03 — ThemeExtension e testes do tema

## ThemeExtension
O `ColorScheme` só conhece papéis genéricos. Para guardar valores próprios do app dentro do tema (as cores dos modos Normal, Atenção e Perigo), cria-se uma classe que estende `ThemeExtension`:

```dart
class ModeColors extends ThemeExtension<ModeColors> {
  final Color danger;
  // copyWith e lerp são obrigatórios
}
```

- `copyWith`: devolve uma cópia trocando só alguns campos.
- `lerp`: calcula o valor "no meio do caminho" entre dois temas (usado em transições de tema).

Registra-se no tema com `extensions: [ModeColors.light]` e lê-se com `ModeColors.of(context).danger`.

## Testes do tema
Um teste de tema é um **alarme**: se alguém mudar um valor sem querer, ele avisa.

- Escreva o valor esperado **direto no teste** (`Color(0xFFF8FAFC)`). Se usar a mesma variável do tema, teste e tema mudam juntos e o teste nunca falha.
- `test(...)`: para conferir valores. `testWidgets(...)`: quando precisa montar widgets.
- Use `Builder` para obter um `context` que esteja dentro do `MaterialApp`.
- Um teste só vale se consegue falhar: apague a linha `extensions` e veja o teste falhar.

## No ADA
- `lib/core/theme/mode_colors.dart`
- `test/core/theme/mode_colors_test.dart` e `test/core/theme/app_theme_test.dart`
- `test/widget_test.dart`: confere que o `AdaApp` aplica o tema.

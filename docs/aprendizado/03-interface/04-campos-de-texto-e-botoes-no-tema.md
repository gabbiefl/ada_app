# 04 — Campos de texto e botões no tema

O aspecto dos campos e botões fica **no tema**, não em cada tela. As telas só dizem o que o botão faz e o que escreve.

## Estilos no `ThemeData`
```dart
ThemeData(
  inputDecorationTheme: InputDecorationTheme(/* fundo, borda, cantos */),
  filledButtonTheme: FilledButtonThemeData(style: ...), // botão principal
  outlinedButtonTheme: OutlinedButtonThemeData(style: ...), // botão secundário
)
```

- `FilledButton`: botão preenchido (azul-marinho no ADA), ação principal.
- `OutlinedButton`: botão branco com borda, ação secundária (Cancelar).
- Um caso diferente (o "Escolher da agenda") **muda só o que difere** com `styleFrom` e herda o resto.

## Cor primária
O `primary` do `ColorScheme` é o que pinta os botões. No ADA o design usa azul-marinho nos botões, então ele é a cor primária. O rosa da marca ficou em `tertiary`, como destaque.

## `TextField` e o controlador
```dart
final _controller = TextEditingController(text: 'texto inicial');

TextField(controller: _controller, maxLength: 200)
```

- O `TextEditingController` guarda e permite mudar o texto (`_controller.text = ...`).
- Ele é um `Listenable`: `ListenableBuilder` refaz só um trecho da tela quando o texto muda (como o contador `90/200`).
- Sempre chame `_controller.dispose()` no `dispose` da tela.
- `keyboardType: TextInputType.phone` abre o teclado numérico; `TextCapitalization.words` põe maiúscula em cada palavra.

## Dois erros que já aconteceram
- Testar uma tela **sem** o tema do app: o `ModeColors.of(context)` quebra, porque o tema não existe naquele teste. No teste, monte `MaterialApp(theme: AppTheme.light, ...)`.
- Esquecer de declarar a pasta de imagens no `pubspec.yaml`: o `Image.asset` não acha o arquivo.

## No ADA
- `lib/core/theme/app_theme.dart`: temas de campo e botões.
- `features/contacts/pages/contact_form_page.dart` e `features/messages/pages/message_edit_page.dart`.

# 02 — TextTheme e fonte variável

O `TextTheme` é a tabela de estilos de texto do app: tamanho, peso e cor de cada papel (título, corpo, rótulo).

## Papéis de texto
Os nomes vêm do Material 3: `headlineSmall`, `titleMedium`, `bodyLarge`, `bodyMedium`, `labelLarge`... Na tela, escolhe-se o papel e não o tamanho:

```dart
Text('Olá', style: Theme.of(context).textTheme.headlineSmall)
```

## Fonte como asset
A fonte Nunito fica na pasta `assets/fonts/` e é declarada no `pubspec.yaml`. Assim funciona **sem internet**, importante num app de emergência. (O pacote `google_fonts` baixaria a fonte pela rede.)

Depois de mexer no `pubspec.yaml`, é preciso parar e rodar `flutter run` de novo: hot reload não basta.

## Fonte variável
Um único arquivo serve para todos os pesos (300, 400, 700...). Listamos o arquivo uma vez por peso, para o Flutter reconhecer cada um, e aplicamos o peso exato com `FontVariation`:

```dart
TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w300,
  fontVariations: [FontVariation('wght', 300)],
)
```

## No ADA
- `lib/core/theme/app_text_theme.dart`: a função `_style` monta todos os estilos com Nunito e o peso certo.
- `pubspec.yaml`: seção `fonts`.

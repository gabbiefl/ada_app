# 06 — Sintaxe Dart que aparece no começo

Cola rápida do que você vê nos primeiros arquivos do projeto.

## Variáveis
```dart
int _cliques = 0;          // pode mudar depois
final String titulo = 'A'; // recebe valor uma vez e não muda
const pi = 3.14;           // constante conhecida em tempo de compilação
```
- **`final`**: valor definido uma vez (pode ser calculado em execução).
- **`const`**: valor já conhecido ao compilar. É "mais fixo" que `final`.
- Campos de um widget são sempre `final`, porque o widget é imutável.

## Privado com `_`
Um nome começando com `_` é **privado ao arquivo**: `_cliques`, `_ContadorState`. Dart não tem a palavra `private`.

## Construtores e parâmetros
```dart
const HomePage({super.key});               // repassa a key à classe-mãe
const Botao({super.key, required this.texto}); // required = obrigatório
final String texto;                        // this.texto já atribui o campo
```
Parâmetros dentro de `{ }` são **nomeados**: na chamada, escrevemos `Botao(texto: 'Ok')`.

## Interpolação de texto
```dart
Text('Você tem $_cliques cliques');       // variável simples
Text('Total: ${_cliques * 2}');           // expressão exige { }
```

## Herança e sobrescrita
```dart
class AdaApp extends StatelessWidget {    // extends = herda de
  @override                               // estou substituindo um método da mãe
  Widget build(BuildContext context) { ... }
}
```

## Imports
```dart
import 'package:flutter/material.dart';       // pacote externo
import 'package:ada_app/app.dart';            // arquivo do próprio projeto
```
`ada_app` é o `name` do `pubspec.yaml`, e o caminho começa em `lib/`.

## Forma abreviada (dot shorthand)
Em Dart recente, quando o tipo é óbvio pelo contexto, dá para omitir o nome da classe:
```dart
mainAxisAlignment: .center,   // = MainAxisAlignment.center
```
Você verá os dois estilos (o código gerado pelo `flutter create` usa a forma curta). A forma completa costuma ser mais fácil de ler para quem está aprendendo.

## Null safety (aparece logo)
`String` nunca é nulo. `String?` pode ser. O compilador obriga a tratar o caso nulo, o que evita uma classe inteira de erros.

## No ADA
Veja tudo isso em [`lib/app.dart`](../../../lib/app.dart) e [`lib/features/home/pages/home_page.dart`](../../../lib/features/home/pages/home_page.dart).

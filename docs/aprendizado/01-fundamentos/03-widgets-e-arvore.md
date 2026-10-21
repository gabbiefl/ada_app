# 03 — Widgets e a árvore de widgets

Em Flutter, **tudo na tela é um widget**: texto, botão, espaçamento, centralização, a tela inteira. Montar uma interface é **compor widgets pequenos dentro de outros**.

## O caminho do app
```dart
void main() {
  runApp(const AdaApp());   // runApp coloca o widget raiz na tela
}
```
- `main()` é a primeira função executada em qualquer programa Dart.
- `runApp(...)` recebe o widget raiz e fica vivo desenhando e reagindo a toques.

## A árvore
Widgets aninhados (via `child:` e `children:`) formam uma **árvore**:

```
AdaApp
└─ MaterialApp            (tema, título, tela inicial)
   └─ HomePage
      └─ Scaffold         (esqueleto da tela)
         └─ SafeArea
            └─ Center
               └─ Column
                  ├─ Text('ADA')
                  ├─ SizedBox(height: 8)
                  └─ Text('Alerta, Defesa e Apoio')
```

## Widgets de layout mais comuns
| Widget | Função |
|---|---|
| `Scaffold` | Esqueleto da tela: barra superior, corpo, botão flutuante |
| `SafeArea` | Evita áreas ocupadas pela barra de status e pelo notch |
| `Center` | Centraliza o filho |
| `Column` / `Row` | Empilham filhos na vertical / horizontal |
| `SizedBox` | Espaço vazio com tamanho definido |
| `Text` | Texto |

## O método `build`
Todo widget descreve como aparece no método `build(BuildContext context)`, que **devolve outros widgets**. O Flutter o chama sempre que precisa desenhar ou redesenhar.

## `const`
`const Text('ADA')` cria um widget imutável, conhecido em tempo de compilação. O Flutter o reaproveita em vez de recriar, o que economiza trabalho.

## No ADA
- [`lib/main.dart`](../../../lib/main.dart), [`lib/app.dart`](../../../lib/app.dart) e [`home_page.dart`](../../../lib/features/home/pages/home_page.dart) formam essa árvore.
- Cores e fontes vêm de `Theme.of(context)`, e não de valores fixos nos widgets.

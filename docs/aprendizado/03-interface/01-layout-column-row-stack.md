# 01 — Layout: Column, Row, Expanded e Stack

Uma tela é montada encaixando widgets de layout, que só organizam outros widgets na tela.

| Widget | O que faz |
|---|---|
| `Column` | Empilha os filhos na **vertical** |
| `Row` | Coloca os filhos lado a lado, na **horizontal** |
| `Stack` | Põe um widget **sobre** o outro (camadas) |
| `Padding` | Cria espaço ao redor de um filho |
| `SizedBox` | Caixa de tamanho fixo; sem filho, serve de espaço (`SizedBox(height: 16)`) |
| `Expanded` | Faz o filho ocupar o espaço que sobrou |
| `SafeArea` | Evita a barra de status, o notch e os botões do sistema |
| `SingleChildScrollView` | Deixa o conteúdo rolar quando não cabe |

## Os dois eixos
Em uma `Column`, o eixo **principal** é o vertical e o **cruzado** é o horizontal. Na `Row` é o contrário.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // distribui no eixo principal
  crossAxisAlignment: CrossAxisAlignment.start,       // alinha no eixo cruzado
  children: [Text('Olá'), Icon(LucideIcons.bell)],
)
```

## Stack: camadas
O primeiro filho fica no fundo. No ADA, os anéis ficam atrás e o círculo com o símbolo na frente:

```dart
Stack(
  alignment: Alignment.center,
  children: [
    ModeRings(color: ringColor),  // atrás
    Container(/* círculo */),     // na frente
  ],
)
```

## Erro comum: overflow
Se o conteúdo é maior que a tela, o Flutter mostra uma faixa amarela e preta (*RenderFlex overflowed*). A solução é envolver o conteúdo em `SingleChildScrollView`, como fazem a Home e a Rede, ou usar `Expanded` quando o espaço é dividido.

## No ADA
- `lib/features/home/pages/home_page.dart`: `Column` + `Stack` + `Expanded`.
- `lib/features/contacts/widgets/contact_card.dart`: `Row` com avatar, textos (`Expanded`) e o "x".

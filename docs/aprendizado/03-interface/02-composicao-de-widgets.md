# 02 — Composição: widgets pequenos e reutilizáveis

Em vez de uma tela gigante, divide-se em widgets pequenos que recebem **parâmetros**. O visual é escrito uma vez e reaproveitado.

## Exemplo vivido: o `ModeCard`
Os cards "Modo perigo" e "Modo atenção" são iguais, só mudam título, frase, ícone e cores. Um widget serve para os dois:

```dart
ModeCard(
  title: 'MODO PERIGO',
  caption: 'Clique em caso de emergências.',
  icon: LucideIcons.triangleAlert,
  color: modeColors.danger,
  textColor: modeColors.dangerText,
)
```

## Regras que usamos
- **`required`** para o que o widget precisa para existir; opcional recebe valor padrão ou é nulo (`this.onTap`).
- **`final`** nos campos e **`const`** no construtor: o widget não muda depois de criado, e o Flutter pode reaproveitá-lo.
- **Callbacks** (`VoidCallback? onTap`): quem usa o widget diz o que acontece ao tocar. Com `null`, nada acontece (útil em telas estáticas).
- **Cores e estilos vêm do tema**, e não de valores escritos no widget (`Theme.of(context)`).
- Um widget usado só dentro de um arquivo ganha `_` no nome (`_NavItem`): é privado.
- Um widget usado em várias telas vai para `core/widgets/`; o de uma funcionalidade fica em `features/<nome>/widgets/`.

## Quando extrair um widget
Quando o mesmo pedaço aparece duas ou mais vezes, ou quando o `build` de uma tela fica longo demais para ler.

## No ADA
- `features/home/widgets/mode_card.dart`, `status_chip.dart`
- `features/contacts/widgets/contact_card.dart`
- `core/widgets/ada_bottom_nav.dart`, `page_header.dart`

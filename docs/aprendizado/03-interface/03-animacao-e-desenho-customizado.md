# 03 — Animação e desenho customizado

## Animação com `AnimationController`
Uma animação é um valor que muda com o tempo (de 0 a 1, por exemplo). Três peças trabalham juntas:

1. **`AnimationController`**: gera o valor e controla duração e repetição.
2. **`SingleTickerProviderStateMixin`**: dá ao controlador o "relógio" que avisa a cada quadro. Por isso o widget precisa ser `StatefulWidget`.
3. **`AnimatedBuilder`**: redesenha só um trecho da tela a cada valor novo.

```dart
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true); // vai de 0 a 1 e volta, sem parar
  }

  @override
  void dispose() {
    _pulse.dispose(); // libera o relógio quando a tela sai
    super.dispose();
  }
}
```

O widget dos anéis não cria a animação: ele **recebe** uma `Animation<double>` e usa `pulse.value` para crescer. Assim, quem decide quando pulsar é a tela.

## Desenho customizado: `CustomPainter`
Quando o Flutter não tem o widget pronto (uma borda **tracejada**, por exemplo), desenha-se direto numa tela de desenho (`Canvas`):

```dart
class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // percorre o contorno e desenha "traço, espaço, traço, espaço..."
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) => false;
}
```

Usa-se com `CustomPaint(painter: ..., child: ...)`. O `shouldRepaint` diz se precisa redesenhar quando os dados mudam.

## No ADA
- `features/home/widgets/mode_rings.dart` e `home_page.dart`: anéis que pulsam.
- `features/contacts/widgets/add_contact_card.dart`: borda tracejada do "Adicionar contato".

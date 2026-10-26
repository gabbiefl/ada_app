// Anéis translúcidos que ficam em volta do símbolo central da Home.
//
// Em vez de uma imagem, os anéis são desenhados em código: assim a cor muda com o
// modo e eles podem pulsar. O widget NÃO cria a animação: ele só recebe uma
// `Animation<double>` (valor de 0 a 1) e a usa para crescer um pouco.
// Sem animação (o padrão), ficam parados.

import 'package:flutter/material.dart';

class ModeRings extends StatelessWidget {
  const ModeRings({
    super.key,
    required this.color,
    this.size = 223,
    // kAlwaysDismissedAnimation: uma animação "parada em 0", usada como padrão.
    this.pulse = kAlwaysDismissedAnimation,
  });

  // Cor do modo (vem do ModeColors, não é escrita aqui).
  final Color color;

  // Diâmetro do anel maior, em pixels (223 no Figma).
  final double size;

  // Quem usa o widget entrega a animação (Fase 3, passo final, ou Fase 7).
  final Animation<double> pulse;

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder redesenha só este trecho a cada valor novo da animação.
    return AnimatedBuilder(
      animation: pulse,
      builder: (context, _) {
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Anel externo: cresce até 10% quando pulse chega a 1.
              Transform.scale(
                scale: 1 + 0.10 * pulse.value,
                child: _circle(size, color.withValues(alpha: 0.06)),
              ),
              // Anel interno (82% do tamanho do externo), mais forte. Também pulsa,
              // porém menos (5%), e a diferença entre os dois dá o efeito de onda.
              Transform.scale(
                scale: 1 + 0.05 * pulse.value,
                child: _circle(size * 0.82, color.withValues(alpha: 0.15)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _circle(double diameter, Color fill) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(shape: BoxShape.circle, color: fill),
    );
  }
}

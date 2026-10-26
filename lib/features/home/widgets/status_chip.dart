// "Chip" de estado da Home, ex.: ● Modo perigo ativo.
// Uma pílula com um pontinho e um texto, nas cores do modo.

import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
  });

  final String label;
  final Color color; // fundo (a 15%) e ponto
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: ShapeDecoration(
        color: color.withValues(alpha: 0.15),
        shape: const StadiumBorder(),
      ),
      child: Row(
        // min: o chip tem só a largura do conteúdo.
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge
                ?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}

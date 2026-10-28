// Cabeçalho das telas internas: título, subtítulo e (opcional) algo à direita,
// como a seta de voltar. Mantém o espaçamento igual em todas as telas.

import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget? trailing; // widget opcional à direita (null = nada)

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.headlineSmall),
              Text(subtitle, style: textTheme.bodySmall),
            ],
          ),
        ),
        // `?` antes do valor: só entra na lista se não for null.
        ?trailing,
      ],
    );
  }
}

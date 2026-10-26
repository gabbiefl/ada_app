// Card de um contato de confiança: avatar com iniciais, nome, telefone e um "x"
// para remover. Os dados chegam por parâmetro (por enquanto vêm da tela, fixos).

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:ada_app/core/theme/app_colors.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.name,
    required this.phone,
    required this.color,
    this.onRemove,
  });

  final String name;
  final String phone;
  final Color color; // cor do avatar
  final VoidCallback? onRemove;

  // Iniciais: primeira letra do primeiro e do último nome ("Gabriela Flores" -> "GF").
  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 88,
      padding: const EdgeInsets.symmetric(horizontal: 21),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.placeholder.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 44,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: color,
              shape: const StadiumBorder(),
            ),
            child: Text(
              _initials,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          const SizedBox(width: 19),
          // Expanded: o texto ocupa o espaço entre o avatar e o "x".
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: theme.textTheme.titleMedium),
                Text(phone, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          InkResponse(
            onTap: onRemove,
            child: const Icon(
              LucideIcons.x,
              size: 12,
              color: AppColors.placeholder,
            ),
          ),
        ],
      ),
    );
  }
}

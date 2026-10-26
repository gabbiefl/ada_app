// Caixa azul informativa da tela de cadastro: avisa que o contato será
// notificado por WhatsApp. O texto mistura normal e negrito (Text.rich).

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:ada_app/core/theme/app_colors.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall
        ?.copyWith(color: AppColors.info);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.badgeInfo, size: 22, color: AppColors.info),
          const SizedBox(width: 19),
          Expanded(
            // Text.rich: um texto com pedaços (TextSpan) de estilos diferentes.
            child: Text.rich(
              TextSpan(
                style: style,
                children: const [
                  TextSpan(text: 'O usuário receberá um '),
                  TextSpan(
                    text: 'aviso via Whatsapp',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontVariations: [FontVariation('wght', 700)],
                    ),
                  ),
                  TextSpan(
                    text: ' informando que foi cadastrado na sua rede de confiança.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

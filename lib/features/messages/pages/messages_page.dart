// Tela "Mensagens": as três mensagens enviadas nos alertas (Perigo, Atenção e
// "Cheguei bem"). Estática: o "Editar" ainda não abre a edição (Fase 4) e as
// mensagens são de exemplo (armazenamento na Fase 6).

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:ada_app/core/routes/app_router.dart';
import 'package:ada_app/core/theme/app_colors.dart';
import 'package:ada_app/core/theme/mode_colors.dart';
import 'package:ada_app/core/widgets/page_header.dart';
import 'package:ada_app/features/messages/widgets/message_card.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final modeColors = ModeColors.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 24),
          child: Column(
            children: [
              PageHeader(
                title: 'Mensagens',
                subtitle: 'Personalize as mensagens enviadas em alertas.',
                trailing: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(LucideIcons.arrowLeft),
                  color: AppColors.placeholder,
                ),
              ),
              const SizedBox(height: 32),
              MessageCard(
                title: 'Modo perigo',
                text: 'Preciso de ajuda. estou em situação de perigo. Minha localização está sendo compartilhada.',
                color: modeColors.danger,
                onEdit: () => context.push(AppRoutes.editMessage),
              ),
              const SizedBox(height: 15),
              MessageCard(
                title: 'Modo atenção',
                text: 'Estou me sentindo insegura. Acompanhe minha localização e fique atento ao meu contato.',
                color: modeColors.attention,
                onEdit: () => context.push(AppRoutes.editMessage),
              ),
              const SizedBox(height: 15),
              MessageCard(
                onEdit: () => context.push(AppRoutes.editMessage),
                title: 'Cheguei bem',
                text: 'Cheguei em segurança. Pode ficar tranquilo(a). Obrigada por acompanhar!',
                color: AppColors.avatarGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tela "Mensagens - Editar": edição do texto de uma mensagem.
//
// StatefulWidget porque guarda o controlador do campo de texto. O contador
// (94/200) e o "Resetar para padrão" já funcionam; salvar de verdade entra na
// Fase 6.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:ada_app/core/theme/app_colors.dart';
import 'package:ada_app/core/widgets/page_header.dart';

class MessageEditPage extends StatefulWidget {
  const MessageEditPage({super.key});

  @override
  State<MessageEditPage> createState() => _MessageEditPageState();
}

class _MessageEditPageState extends State<MessageEditPage> {
  static const _maxLength = 200;
  static const _defaultText =
      'Preciso de ajuda. estou em situação de perigo. Minha localização está sendo compartilhada.';

  // TextEditingController: guarda e controla o texto do campo.
  final _controller = TextEditingController(text: _defaultText);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(height: 24),
                    Text(
                      'Texto da mensagem',
                      style: textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontVariations: const [FontVariation('wght', 600)],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Stack: o contador fica SOBRE o campo, no canto inferior.
                    Stack(
                      children: [
                        SizedBox(
                          height: 172,
                          child: TextField(
                            controller: _controller,
                            maxLength: _maxLength,
                            // expands + maxLines null: o texto ocupa a caixa toda.
                            expands: true,
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.top,
                            style: textTheme.bodyMedium,
                            // counterText vazio: o contador padrão do Flutter
                            // fica fora da caixa; desenhamos o nosso dentro.
                            decoration: const InputDecoration(
                              counterText: '',
                              contentPadding: EdgeInsets.fromLTRB(
                                26,
                                26,
                                26,
                                36,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 14,
                          // ListenableBuilder: refaz só o contador a cada letra.
                          child: ListenableBuilder(
                            listenable: _controller,
                            builder: (context, _) => Text(
                              '${_controller.text.length}/$_maxLength',
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => _controller.text = _defaultText,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              LucideIcons.rotateCcw,
                              size: 16,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Resetar para padrão',
                              style: textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontVariations: const [
                                  FontVariation('wght', 600),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 24),
              child: Column(
                children: [
                  OutlinedButton.icon(
                    onPressed: () => context.pop(),
                    icon: const Icon(LucideIcons.x, size: 24),
                    label: const Text('Cancelar'),
                  ),
                  const SizedBox(height: 11),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Salvar mensagem'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

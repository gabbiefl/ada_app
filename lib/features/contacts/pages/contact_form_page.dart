// Tela "Novo contato": cadastro de uma pessoa da rede de confiança.
//
// Por enquanto é estática: os campos aceitam texto, mas nada é validado nem
// salvo e os botões não fazem nada. Formulário de verdade (validação e
// armazenamento) entra na Fase 5.

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:ada_app/core/theme/app_colors.dart';
import 'package:ada_app/features/contacts/widgets/info_box.dart';

class ContactFormPage extends StatelessWidget {
  const ContactFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Expanded + rolagem: o formulário rola; os botões ficam fixos embaixo.
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Novo contato', style: textTheme.headlineSmall),
                        Text('4/5', style: textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 28),
                    // Botão de borda azul-marinho: muda só a aparência do
                    // OutlinedButton do tema (cantos 20, altura 71, texto preto).
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(LucideIcons.bookUser, size: 24),
                      label: const Text('Escolher da agenda'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 71),
                        foregroundColor: theme.colorScheme.onSurface,
                        side: BorderSide(color: theme.colorScheme.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        iconSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const _OrDivider(),
                    const SizedBox(height: 28),
                    const _FieldLabel('Nome'),
                    const SizedBox(height: 8),
                    TextField(
                      style: textTheme.labelLarge,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'Nome do contato',
                        prefixIcon: Icon(LucideIcons.user, size: 18),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const _FieldLabel('Telefone'),
                    const SizedBox(height: 8),
                    TextField(
                      style: textTheme.labelLarge,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '(51) 99999-0000',
                        prefixIcon: Icon(LucideIcons.phone, size: 18),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const InfoBox(),
                  ],
                ),
              ),
            ),
            // Botões fixos no rodapé: Cancelar (secundário) e Salvar (principal).
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 24),
              child: Column(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.x, size: 24),
                    label: const Text('Cancelar'),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Salvar contato'),
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

// Rótulo acima de cada campo (Bold 15, azul-marinho).
class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: AppColors.modeNormal,
        fontWeight: FontWeight.w700,
        fontVariations: const [FontVariation('wght', 700)],
      ),
    );
  }
}

// Linha com "ou preencha" no meio.
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Divider(color: theme.colorScheme.outline)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'ou preencha',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              fontVariations: const [FontVariation('wght', 600)],
            ),
          ),
        ),
        Expanded(child: Divider(color: theme.colorScheme.outline)),
      ],
    );
  }
}

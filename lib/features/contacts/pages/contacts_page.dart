// Tela "Rede de contatos": as pessoas de confiança que recebem o alerta.
//
// Por enquanto é estática: a lista é fixa e os botões não fazem nada. Salvar,
// adicionar e remover contatos de verdade entra na Fase 5.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ada_app/core/routes/app_router.dart';
import 'package:ada_app/core/theme/app_colors.dart';
import 'package:ada_app/features/contacts/widgets/add_contact_card.dart';
import 'package:ada_app/features/contacts/widgets/contact_card.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  // Limite de contatos da rede (o design mostra "3/5").
  static const _maxContacts = 5;

  // Contatos de exemplo. Cada item é um "record": um grupo (nome, telefone).
  static const _contacts = [
    (name: 'Gabriela Flores', phone: '(51) 9999-0001'),
    (name: 'Yasmin Chervenski', phone: '(51) 9999-0002'),
    (name: 'Milena Alves', phone: '(51) 9999-0003'),
  ];

  // Cores dos avatares, na ordem em que aparecem no design.
  static const _avatarColors = [
    AppColors.brand,
    AppColors.avatarGreen,
    AppColors.modeAttention,
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final emptySlots = _maxContacts - _contacts.length;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(39, 30, 39, 24),
          child: Column(
            children: [
              // Título à esquerda e contador à direita.
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rede de contatos',
                          style: textTheme.headlineSmall,
                        ),
                        Text(
                          'Cadastre a sua rede de confiança.',
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${_contacts.length}/$_maxContacts',
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              for (var i = 0; i < _contacts.length; i++) ...[
                ContactCard(
                  name: _contacts[i].name,
                  phone: _contacts[i].phone,
                  color: _avatarColors[i % _avatarColors.length],
                ),
                const SizedBox(height: 9),
              ],
              for (var i = 0; i < emptySlots; i++) ...[
                AddContactCard(onTap: () => context.push(AppRoutes.newContact)),
                const SizedBox(height: 9),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

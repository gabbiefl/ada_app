// Tela provisória para áreas do app que ainda não foram desenhadas ou feitas
// (Mapa, Horário de cobertura, Histórico). Mantém a navegação completa.

import 'package:flutter/material.dart';

import 'package:ada_app/core/widgets/page_header.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 24),
          child: PageHeader(title: title, subtitle: 'Em breve.'),
        ),
      ),
    );
  }
}

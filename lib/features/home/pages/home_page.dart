// Tela inicial (provisória) do ADA.
//
// Fica em lib/features/home/pages/: cada funcionalidade tem sua pasta
// (features/<nome>/) e, dentro dela, as telas ficam em pages/.
// Na Fase 3 esta tela será refeita a partir do Figma.

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme.of(context) busca o tema definido no MaterialApp.
    // Assim cores e fontes vêm do tema, e não de valores fixos aqui.
    final textTheme = Theme.of(context).textTheme;

    // Scaffold: o "esqueleto" de uma tela (barra superior, corpo, botões...).
    return Scaffold(
      // SafeArea evita que o conteúdo fique sob a barra de status ou o notch.
      body: SafeArea(
        // Center posiciona o filho no meio da tela.
        child: Center(
          // Column empilha os filhos na vertical.
          child: Column(
            // Centraliza os filhos no eixo principal (vertical, numa Column).
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ADA', style: textTheme.displayMedium),
              // Espaço vertical entre os textos. `const` pois nunca muda.
              const SizedBox(height: 8),
              Text(
                'Alerta, Defesa e Apoio',
                style: textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

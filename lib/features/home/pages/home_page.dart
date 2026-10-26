// Tela inicial do ADA (modo Normal), montada a partir do Figma.
//
// Fica em lib/features/home/pages/: cada funcionalidade tem sua pasta
// (features/<nome>/) e, dentro dela, as telas ficam em pages/.
// Por enquanto é estática: os cards dos modos e a barra de navegação entram
// nos próximos passos da Fase 3.

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:ada_app/core/theme/mode_colors.dart';
import 'package:ada_app/features/home/widgets/mode_rings.dart';

// StatefulWidget: agora a tela guarda algo que vive e muda, o controlador da
// animação dos anéis. (Ver o resumo 04 de aprendizado sobre Stateless x Stateful.)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// SingleTickerProviderStateMixin: fornece o "relógio" (ticker) que faz a animação
// avançar a cada quadro. Todo AnimationController precisa de um.
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )
      // repeat(reverse: true): vai de 0 a 1 e volta, sem parar (efeito de pulsar).
      ..repeat(reverse: true);
  }

  // dispose: libera o controlador quando a tela sai, para não gastar bateria.
  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Cores e estilos vêm do tema, e não de valores fixos aqui.
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final modeColors = ModeColors.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          // 40 é a margem lateral do design.
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              // Cabeçalho: logo à esquerda, sino à direita.
              SizedBox(
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/logo_horizontal_azul.png', height: 36),
                    Icon(LucideIcons.bell, color: theme.colorScheme.onSurface),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Alignment.centerLeft: o texto encosta na esquerda.
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olá, Gabriela', style: textTheme.headlineSmall),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Estamos com você!', style: textTheme.bodyLarge),
                        const SizedBox(width: 6),
                        // colorScheme.primary é o rosa da marca (AppColors.brand).
                        Icon(LucideIcons.heart,
                            size: 15, color: theme.colorScheme.primary),
                      ],
                    ),
                  ],
                ),
              ),
              // Expanded: ocupa o espaço que sobrar, e o Center põe o símbolo no meio.
              Expanded(
                child: Center(
                  // Stack: um widget SOBRE o outro (anéis atrás, círculo na frente).
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ModeRings(color: modeColors.normal, pulse: _pulse),
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: modeColors.normal,
                        ),
                        padding: const EdgeInsets.all(32),
                        child: Image.asset('assets/images/simbolo_ada.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

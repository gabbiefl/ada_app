// Widget raiz do ADA: configura o MaterialApp (título, tema e tela inicial).
//
// Este arquivo cresce nas próximas fases:
//  - Fase 4: a tela inicial é substituída pelas rotas (go_router)

import 'package:flutter/material.dart';

import 'package:ada_app/core/theme/app_theme.dart';
import 'package:ada_app/features/home/pages/home_page.dart';

// StatelessWidget: um widget que NÃO guarda dados que mudam.
// A configuração do app é fixa, então não precisamos de StatefulWidget.
class AdaApp extends StatelessWidget {
  // `super.key` repassa a `key` (identificador do widget) para a classe-mãe.
  // `const` no construtor permite criar o widget com `const AdaApp()`.
  const AdaApp({super.key});

  // `build` descreve COMO este widget aparece: ele devolve outros widgets.
  // O Flutter chama `build` sempre que precisa desenhar (ou redesenhar) a tela.
  @override
  Widget build(BuildContext context) {
    // MaterialApp: a "casca" que dá ao app o visual e o comportamento do
    // Material Design (navegação, tema, textos do sistema).
    return MaterialApp(
      // Nome que o sistema usa, por exemplo na lista de apps recentes.
      title: 'ADA',
      // Tema do ADA (cores e fonte do Figma), definido em core/theme/.
      theme: AppTheme.light,
      // `home` é a primeira tela exibida.
      home: const HomePage(),
    );
  }
}

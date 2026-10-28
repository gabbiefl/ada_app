// Guarda o modo atual do app em um único lugar.
//
// ChangeNotifier: quando o modo muda, avisa (notifyListeners) quem está
// "ouvindo". Assim a Home pode se redesenhar sozinha, sem a lógica ficar
// misturada com a tela. Por enquanto nada chama activate: os toques nos cards
// só serão ligados depois de lermos as variações no Figma.

import 'package:flutter/foundation.dart';

import 'package:ada_app/core/state/security_mode.dart';

class ModeController extends ChangeNotifier {
  SecurityMode _mode = SecurityMode.normal;

  // Só leitura por fora: para mudar, é preciso passar por activate/deactivate.
  SecurityMode get mode => _mode;

  void activate(SecurityMode mode) {
    // Evita avisar à toa quando o modo não mudou.
    if (mode == _mode) return;
    _mode = mode;
    notifyListeners();
  }

  void deactivate() => activate(SecurityMode.normal);
}

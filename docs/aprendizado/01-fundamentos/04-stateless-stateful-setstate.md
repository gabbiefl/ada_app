# 04 — StatelessWidget x StatefulWidget e setState

A diferença é uma pergunta: **esse widget guarda dados que mudam enquanto o app está aberto?**

| | `StatelessWidget` | `StatefulWidget` |
|---|---|---|
| Guarda dados que mudam? | Não | Sim, em um objeto `State` |
| Quando reconstrói? | Só se o pai mandar | Quando chamamos `setState` |
| Exemplo | Texto fixo, tema, tela estática | Contador, formulário, interruptor |

## Stateless (mínimo)
```dart
class Saudacao extends StatelessWidget {
  const Saudacao({super.key});

  @override
  Widget build(BuildContext context) => const Text('Olá');
}
```

## Stateful (mínimo)
```dart
class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int _cliques = 0;

  void _incrementar() {
    setState(() {
      _cliques++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _incrementar,
      child: Text('$_cliques'),
    );
  }
}
```

São **duas classes**: o widget (imutável, configuração) e o `State` (guarda os dados que mudam e tem o `build`).

## O que o `setState` faz
1. Executa a mudança dentro da função.
2. **Avisa o Flutter** para rodar `build()` de novo.

## Erro clássico: esquecer o `setState`
Sem ele, `_cliques++` muda o valor **na memória**, mas a tela continua igual. Quando algo "só atualiza às vezes", suspeite de um `setState` esquecido.

## Quando usar cada um
Comece com `StatelessWidget`. Vire `StatefulWidget` só quando precisar guardar um dado local que muda. Para estado compartilhado entre telas (como o modo atual do ADA), usaremos gerenciamento de estado com Provider (Fase 4).

## No ADA
Hoje [`AdaApp`](../../../lib/app.dart) e [`HomePage`](../../../lib/features/home/pages/home_page.dart) são stateless. O primeiro estado real aparece nas Fases 4 e 5.

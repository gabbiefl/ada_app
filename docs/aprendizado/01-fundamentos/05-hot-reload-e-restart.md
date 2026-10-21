# 05 — Hot reload x hot restart

Duas formas de ver uma alteração de código sem recompilar o app do zero. O que as diferencia é o que acontece com o **estado**.

| | Hot reload (`r`) | Hot restart (`R`) |
|---|---|---|
| O que faz | Injeta o código novo no app em execução e reconstrói a tela | Reinicia o app com o código novo |
| Estado (variáveis do `State`) | **Preservado** | **Zerado** |
| Velocidade | Mais rápido | Um pouco mais lento |

## Exemplo vivido no projeto
Com o contador em 5, trocamos um texto no código:
- **Hot reload:** o texto mudou, o contador continuou em 5.
- **Hot restart:** o texto continuou novo, o contador voltou a 0.

O contador vive no objeto `State`. O reload troca o código dos métodos (como o `build`) e mantém esse objeto vivo. O restart descarta tudo e roda o `main()` de novo.

## Quando usar cada um
- **Reload:** mudou layout, texto, cor, conteúdo do `build`.
- **Restart:** mudou `main()`, valor inicial de uma variável de estado, ou algo que só é lido na partida.
- Mudou `web/index.html`, `AndroidManifest.xml` ou o `pubspec.yaml`? Nenhum dos dois basta: pare (`q`) e rode `flutter run` de novo.

## Comandos do `flutter run`
| Tecla | Ação |
|---|---|
| `r` | Hot reload |
| `R` | Hot restart |
| `q` | Encerrar |
| `h` | Listar todos os comandos |

## Se o reload "não fez nada"
- O arquivo foi salvo?
- O terminal do `flutter run` estava em foco ao apertar a tecla?
- A mudança é do tipo que exige restart?

## No ADA
Desenvolvemos no Chrome com `flutter run -d chrome`. No VS Code, salvar o arquivo também dispara o hot reload.

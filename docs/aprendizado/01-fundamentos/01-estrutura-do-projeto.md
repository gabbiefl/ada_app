# 01 — Estrutura de um projeto Flutter

Um projeto Flutter é uma pasta com o código Dart (`lib/`) e as "casquinhas" de cada plataforma (`android/`, `web/`...) que embrulham o app.

## Pastas e arquivos principais

| Item | Para que serve | Edito à mão? |
|---|---|---|
| `lib/` | Todo o código Dart do app | Sim |
| `test/` | Testes automatizados | Sim |
| `android/` | Projeto Android nativo (manifest, permissões, `applicationId`) | Pouco |
| `web/` | Arquivos para rodar no navegador | Quase nunca |
| `pubspec.yaml` | Nome, versão, dependências e assets | Sim |
| `pubspec.lock` | Versões exatas das dependências, para todos rodarem igual | Não (é gerado) |
| `analysis_options.yaml` | Regras do analisador (`flutter analyze`) | Às vezes |
| `build/` | Resultado da compilação | **Nunca** |
| `.dart_tool/` | Cache interno das ferramentas | **Nunca** |

`build/` e `.dart_tool/` ficam no `.gitignore`: são gerados, então ninguém precisa versioná-los. Quem clona o projeto roda `flutter pub get` e os recria.

## Organização do `lib/` (feature-first)

Organizamos **por funcionalidade**, e não por tipo de arquivo:

```
lib/
├── main.dart            # ponto de entrada
├── app.dart             # MaterialApp (tema, rotas)
├── core/                # tema, constantes, utilitários, rotas
└── features/
    └── home/
        └── pages/       # telas da funcionalidade
```

Cada funcionalidade guarda suas telas (`pages/`), peças visuais (`widgets/`) e, quando precisar, `models/` e `services/`. Assim, tudo sobre "contatos" está em um lugar só, e o projeto escala sem virar uma pasta gigante de telas.

## No ADA
- Estrutura definida no [CLAUDE.md](../../CLAUDE.md), seção 3.
- Primeira tela em [`lib/features/home/pages/home_page.dart`](../../../lib/features/home/pages/home_page.dart).

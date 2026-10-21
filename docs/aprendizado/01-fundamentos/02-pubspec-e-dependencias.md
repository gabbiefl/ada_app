# 02 — pubspec.yaml e dependências

O `pubspec.yaml` é a identidade do projeto e a lista de pacotes que ele usa. A sintaxe é **YAML**: a **indentação** (dois espaços) define a hierarquia, e um espaço errado quebra o arquivo.

## Campos principais

```yaml
name: ada_app                 # nome do pacote Dart (aparece nos imports)
description: "..."            # descrição curta
publish_to: 'none'            # impede publicar por engano no pub.dev
version: 1.0.0+1              # 1.0.0 = versão visível; +1 = número do build

environment:
  sdk: ^3.13.5                # versão mínima do Dart

dependencies:                 # usados quando o app RODA
  flutter:
    sdk: flutter

dev_dependencies:             # só ajudam a DESENVOLVER (testes, lints)
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

## O `^` nas versões
`^1.0.8` significa "1.0.8 ou uma versão mais nova que seja compatível". O Dart não pula para uma versão com mudanças incompatíveis (a próxima "major").

## Fluxo para adicionar um pacote
1. Adicionar em `dependencies` (ou rodar `flutter pub add <pacote>`).
2. Rodar `flutter pub get`: baixa o pacote e atualiza o `pubspec.lock`.
3. Importar no código: `import 'package:<pacote>/<pacote>.dart';`.

## Assets e fontes
Imagens e fontes próprias são declaradas na seção `flutter:` (`assets:`, `fonts:`). Se o arquivo não estiver listado ali, o app não o encontra.

## No ADA
- Regra do projeto: **cada pacote só entra na fase em que for usado**, com justificativa e confirmação. Por isso o [pubspec.yaml](../../../pubspec.yaml) ainda tem só o básico.
- Pacotes planejados: [stack da Fase 0](../../planejamento/fase-00-viabilidade.md), seção 9.1.

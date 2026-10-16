# Fase 1 — Fundamentos e estrutura do projeto

> **Status:** 📝 em planejamento (aguardando aprovação)
> **Itens do backlog:** F1-01 a F1-05

## 1. Objetivo
Entender o projeto criado pelo `flutter create`, limpar o código de exemplo e organizar as pastas conforme o CLAUDE.md, com o app rodando no emulador Android.

## 2. Resultado esperado
Um app mínimo do ADA (uma tela inicial simples) rodando no emulador, com a estrutura `lib/core/` e `lib/features/` pronta, `flutter analyze` sem avisos e o primeiro commit da estrutura feito.

## 3. Conceitos que vamos aprender
- Estrutura de um projeto Flutter (`lib/`, `android/`, `test/`, `web/`)
- `pubspec.yaml`: dependências, versão do SDK e assets
- `main.dart` e a função `main()` / `runApp()`
- Widgets e a **árvore de widgets**
- `StatelessWidget` x `StatefulWidget` (o exemplo do contador usa o segundo)
- `MaterialApp` e Material 3
- Hot reload x hot restart
- `flutter analyze` e `flutter test`
- Git no dia a dia: `status`, `add`, `commit`, `pull`, `push` e como evitar/resolver conflitos de merge
- `applicationId` do Android (identidade única do app)

## 4. Escopo
**Dentro:**
- Criar e configurar o emulador Android
- Rodar o app de exemplo e explorar o projeto
- Limpar o código de exemplo (contador) e ajustar o teste que depende dele
- Criar a estrutura de pastas
- Definir o nome visível do app e o `applicationId`
- Atualizar a seção "Como rodar" do README

**Fora (vai para o backlog ou para outras fases):**
- Tema, cores e fontes (Fase 2)
- Telas reais do Figma (Fase 3)
- Rotas e gerenciamento de estado (Fase 4)
- Adicionar qualquer pacote novo (cada um entra na fase em que for usado)
- Suporte a iOS (IDEIA-06)

## 5. Pré-requisitos
- Fase 0 concluída (commit `f3e150e` feito)
- Flutter instalado (3.47.6 estável, verificado) e projeto criado com `flutter create` (verificado)
- Android Studio com o SDK do Android: **não está instalado** (confirmado pela usuária); a instalação entra no passo 1
- Celular Xiaomi sem uso disponível para testes por cabo USB (plano B ao emulador e teste de segundo plano na Fase 8)

**Situação atual do projeto (verificada):**
- Git já configurado, com `.gitignore` do Flutter e commits no GitHub
- Plataformas criadas: `android/` e `web/` (não há `ios/`)
- `lib/main.dart` com 122 linhas do app de exemplo (contador); `test/widget_test.dart` testa esse contador
- `applicationId` e `namespace` atuais: `com.example.ada_app`

## 6. Passos
| # | Passo | Tamanho | O que a usuária aprende |
|---|---|---|---|
| 1 | Rodar o app de exemplo no Chrome (`flutter run -d chrome`) e simular o tamanho de celular (F12 → ícone de dispositivo) | P | Ciclo de desenvolvimento, `flutter devices`, janela x tela de celular |
| 2 | Testar hot reload e hot restart alterando um texto | P | Diferença entre reload e restart |
| 3 | Passeio guiado pelo projeto: `pubspec.yaml`, `main.dart`, `android/`, `test/` | M | Para que serve cada pasta e arquivo, árvore de widgets |
| 4 | Definir o nome do app e o `applicationId` (pede confirmação, ver seção 7) | P | Identidade do app no Android e por que mudar cedo |
| 5 | Limpar o código de exemplo: `main.dart` mínimo e `app.dart` com `MaterialApp` e uma tela inicial simples; ajustar o teste | M | `StatelessWidget`, `MaterialApp`, `Scaffold`, `const`, testes de widget |
| 6 | Criar a estrutura de pastas do CLAUDE.md (`lib/core/`, `lib/features/...`) | P | Organização por funcionalidade (*feature-first*) e por que ela escala |
| 7 | Rodar `flutter analyze`, `flutter test` e o app no Chrome | P | Como ler avisos do analyzer e o resultado de um teste |
| 8 | Atualizar o README ("Como rodar"), o backlog, preencher a retrospectiva e sugerir o commit | P | Fechar uma fase com registro; commit e `push` sem conflito |
| 9 | **Adiado (antes da Fase 7):** instalar o Android Studio e o SDK, aceitar as licenças (`flutter doctor --android-licenses`), criar o emulador (AVD), preparar o Xiaomi (depuração USB) e aplicar o `applicationId` (o build Android valida a troca) | G | Emulador x aparelho real, SDK, `flutter doctor`, depuração USB, identidade do app no Android |

## 7. Decisões técnicas
| Decisão | Alternativas consideradas | Motivo da escolha |
|---|---|---|
| Trocar `com.example.ada_app` por um `applicationId` próprio (escolhido pela usuária: `br.academico.cesuca.ada`; nome neutro, sem nomes pessoais, por ser projeto de grupo; válido, embora não siga a convenção de domínio real; pode ser trocado até o passo 4) | `br.edu.cesuca.mostra.ada`, `com.academico.cesuca.ada` (válida, mas usa um domínio de terceiros), `io.github.<usuário>.ada` (usa nome pessoal), manter `com.example` | O prefixo `com.example` é rejeitado pela Play Store, e mudar depois que o app estiver instalado em aparelhos e configurado no Firebase (Nível 2) dá mais trabalho. `io.github.<usuário>` é a convenção para quem não tem domínio, e o sufixo `academico` deixa o caráter do projeto explícito. Evitamos `br.edu`, que indica instituição registrada. **Pede confirmação** (altera arquivos do Android, incluindo o pacote do `MainActivity.kt`) |
| Manter a pasta `web/` | Remover | O CLAUDE.md permite Web para testes visuais rápidos. Não atrapalha o Android |
| Não criar `ios/` | Rodar `flutter create --platforms=ios .` | Fora do escopo (IDEIA-06) |
| `minSdk` fica no padrão do Flutter por enquanto | Fixar um número agora | Só vale decidir quando os pacotes (localização, permissões) exigirem; registrar na Fase 8 |
| Estrutura *feature-first* (`features/<nome>/`) | Por camadas (`pages/`, `models/` na raiz) | Cada funcionalidade fica isolada e fácil de achar; já definida no CLAUDE.md |
| Pastas vazias recebem um arquivo `.gitkeep` | Criar só quando houver arquivo | O Git não guarda pastas vazias; o `.gitkeep` mantém a estrutura visível no repositório |

## 8. Riscos e plano B
| Risco | Impacto | Plano B |
|---|---|---|
| O computador não rodar o emulador (virtualização desativada ou pouca memória) | Não conseguir testar em Android | Testar no Chrome/Edge (web) para o visual e usar um celular real via depuração USB para o resto |
| Projeto dentro do OneDrive: a sincronização pode travar arquivos da pasta `build/` e deixar builds lentos ou com erros de arquivo em uso | Builds falhando de forma estranha | Pausar a sincronização durante o desenvolvimento ou mover o projeto para uma pasta fora do OneDrive (o Git continua sendo o backup) |
| Caminho do projeto com espaços e acentos | Falhas raras em ferramentas de build | Observar os erros; se aparecerem, mover o projeto para um caminho simples |
| Esquecer de fazer `git pull` antes de editar no GitHub (conflito de merge, como aconteceu no README) | Marcadores `<<<<<<<` no arquivo | Rodar `git pull` antes de começar e conferir o `git status` depois de qualquer merge |
| Mudar o `applicationId` quebrar o build | App não compila | Mudar em um commit separado, rodar o app em seguida e reverter com Git se necessário |

## 9. Critérios de pronto
- [ ] App rodando no Chrome
- [ ] Código de exemplo do contador removido
- [ ] Estrutura `lib/core/` e `lib/features/` criada
- [ ] Nome do app definido (o `applicationId` `br.academico.cesuca.ada` é aplicado no passo 9, junto com o Android)
- [ ] `flutter analyze` sem avisos
- [ ] `flutter test` passando
- [ ] README ("Como rodar") e backlog atualizados
- [ ] Commit feito

## 10. Como testar
```
flutter doctor            # ambiente em ordem
flutter emulators         # lista os emuladores
flutter emulators --launch <id>
flutter run               # roda no emulador (r = hot reload, R = hot restart, q = sair)
flutter analyze
flutter test
```

## 11. Perguntas em aberto
- ✅ Android Studio: não instalado; será instalado no passo 1.
- ✅ Celular: há um Xiaomi sem uso para testes por cabo (precisa de cabo USB de dados).
- ✅ `applicationId`: `br.academico.cesuca.ada` (o grupo pode trocar até o passo 4). Não é necessário ter domínio próprio.
- 🔓 OneDrive: pausar a sincronização (temporário, 2/8/24 h) ou mover o projeto para fora do OneDrive (por exemplo `C:\dev\ada_app`, mais robusto). A decidir.

---

## Retrospectiva (preencher ao concluir)

**O que aprendi:**
- <...>

**O que mudou em relação ao plano:**
- <...>

**Dívidas técnicas e novos itens para o backlog:**
- <...>

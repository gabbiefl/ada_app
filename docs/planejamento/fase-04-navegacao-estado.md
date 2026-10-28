# Fase 4 — Navegação e estado

> **Status:** 🔄 em execução (plano aprovado)
> **Itens do backlog:** F4-01, F4-02

## 1. Objetivo
Fazer o app navegável (barra inferior, abrir e voltar de telas) e guardar o modo atual (Normal, Atenção ou Perigo) em um único lugar, para que a Home e as outras telas reajam a ele.

## 2. Resultado esperado
- A barra de navegação leva a Início, Rede, Mapa e Ajustes.
- Configurações abre Mensagens, e Mensagens abre a edição; "Cancelar" e as setas voltam.
- Na Rede, "Adicionar contato" abre o cadastro.
- O modo atual vive em um único controlador, lido pela Home. **Tocar nos cards ainda não ativa nada**: os estados Atenção e Perigo precisam ser lidos no Figma antes (decisão da usuária).

## 3. Conceitos que vamos aprender
- Rotas e `go_router`: `go` x `push`, rotas aninhadas, barra inferior com `StatefulShellRoute`
- Estado: `ChangeNotifier` e `Provider`; por que separar UI e lógica
- `enum` para o modo (`SecurityMode`)
- Teste unitário da lógica (sem desenhar tela) e teste de navegação

## 4. Escopo
**Dentro:**
- Rotas das telas já feitas e navegação entre elas
- `SecurityMode` e o controlador do modo, lido pela Home
- Controlador com `activate`/`deactivate` e teste, **sem ligar aos toques** da Home (as variações de Atenção e Perigo ainda não foram lidas no Figma)
- Aba "Mapa" com uma tela provisória ("Em breve")
- Itens "Horário de cobertura" e "Histórico de alertas" sem destino (tela provisória)

**Fora (vai para o backlog):**
- Splash, onboarding e permissões (F3-09, F3-10)
- Persistência do modo ao fechar o app (Fase 5 em diante)
- Desativação segura contra toque acidental (F7-03)
- Estado visual do Modo Atenção ativo na Home (ainda não lido no Figma)

## 5. Pré-requisitos
- Fase 3 concluída
- Confirmação dos pacotes `go_router` e `provider` (cada um pede aprovação)

## 6. Passos
| # | Passo | Tamanho | O que a usuária aprende |
|---|---|---|---|
| 1 ✅ | Adicionar `go_router` e criar as rotas simples (sem barra) em `core/routes/` | M | Rotas, `MaterialApp.router`, `go` x `push` |
| 2 ✅ | Barra inferior com `StatefulShellRoute`: `AdaBottomNav` passa a navegar | M | Rotas aninhadas, índice da aba |
| 3 ✅ | Ligar os botões: itens de Configurações, "Editar", "Adicionar contato", "Cancelar" e setas | P | `context.push`, `context.pop` |
| 4 | Criar `SecurityMode` (enum) e `ModeController` (`ChangeNotifier`) com teste unitário | M | `enum`, `ChangeNotifier`, teste de lógica |
| 5 | Adicionar `provider` e fornecer o controlador ao app | P | Provider, `context.watch` x `context.read` |
| 6 | Home lê o modo do controlador (sempre Normal por enquanto); `dangerActive` deixa de ser parâmetro; toques nos cards ficam para depois de ler o Figma | M | Estado global, reconstrução da tela |
| 7 | Testes de navegação e de estado; `flutter analyze` | P | Testar fluxo, não só tela |
| 8 | Retrospectiva, resumos em `docs/aprendizado/`, backlog e commit | P | Fechar a fase |

## 7. Decisões técnicas
| Decisão | Alternativas consideradas | Motivo |
|---|---|---|
| `go_router` | `Navigator` puro; `auto_route` | Oficial do time do Flutter, rotas por caminho (`/rede`), simples para barra inferior |
| `provider` com `ChangeNotifier` | `Riverpod`; `Bloc` | Mais simples de aprender e suficiente para um estado pequeno (modo atual); o CLAUDE.md aceita Provider ou Riverpod |
| `StatefulShellRoute.indexedStack` | Trocar de tela sem preservar estado | Cada aba mantém seu estado (a rolagem da Rede não volta ao topo) |
| Modo como `enum` | Três booleanos; strings | O compilador garante que só existem 3 valores |
| Telas provisórias para Mapa, Horário e Histórico | Deixar os botões mortos | A navegação já fica completa e demonstrável |

## 8. Riscos e plano B
| Risco | Impacto | Plano B |
|---|---|---|
| Ativar o Modo Perigo por toque acidental no card | Alerta falso no futuro (hoje só visual) | Fica registrado em F7-03; na Fase 7 entra confirmação ou segurar para ativar |
| Nome das rotas e barra inferior confusos no começo | Atraso | Começar pelas rotas simples (passo 1) e só depois a barra |
| Prazo da mostra (23/11/2026) | Passo 8 e extras não cabem | Priorizar passos 1 a 6; testes e resumos no fim |

## 9. Critérios de pronto
- [ ] Barra inferior navega entre as 4 abas
- [ ] Configurações → Mensagens → Editar e voltar funcionam
- [ ] Modo atual vive em um único controlador, lido pela Home
- [ ] Controlador do modo com `activate`/`deactivate` testado (toques na Home ficam para depois de ler o Figma)
- [ ] Teste unitário do controlador e teste de navegação passando
- [ ] `flutter analyze` sem avisos
- [ ] Testado no Chrome
- [ ] Backlog atualizado e commit feito

## 10. Como testar
`flutter run -d chrome`, tocar na barra, abrir Mensagens e editar, ativar e desativar o Modo Perigo. `flutter analyze` e `flutter test`.

## 11. Perguntas em aberto
- ✅ `go_router` instalado (passo 1). `provider`: confirmar no passo 5.
- ✅ Cards Atenção e Perigo não ativam nada até lermos as variações no Figma (decisão da usuária).
- Tela de Mapa: como mostrar a localização se não dá para acompanhar em tempo real? Ideia da usuária: **checkpoints** da posição (ver F3-11 no backlog). Fica para a Fase 8; aqui o Mapa é provisório.

---

## Retrospectiva (preencher ao concluir)

**O que aprendi:**
- <...>

**O que mudou em relação ao plano:**
- <...>

**Dívidas técnicas e novos itens para o backlog:**
- <...>

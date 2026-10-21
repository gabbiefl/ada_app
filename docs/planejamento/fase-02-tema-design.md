# Fase 2 — Tema e design system (Figma → Flutter)

> **Status:** 🔄 em execução (plano aprovado)
> **Itens do backlog:** F2-01 a F2-04

## 1. Objetivo
Conectar o Figma ao Claude Code por MCP, extrair cores, tipografia e espaçamentos do design do ADA e transformá-los em um tema Flutter central (`app_theme.dart`), incluindo as cores dos modos 🔵🟡🔴.

## 2. Resultado esperado
O app inteiro passa a ter as cores e fontes do design. A tela inicial provisória já aparece com o visual do ADA, sem nenhum valor de cor ou fonte espalhado pelos widgets.

## 3. Conceitos que vamos aprender
- MCP (Model Context Protocol): como o Claude Code lê ferramentas externas, como o Figma
- Design tokens: cores, fontes e espaçamentos como "valores nomeados", não números soltos
- `ThemeData`, `ColorScheme`, `TextTheme` e Material 3
- `ThemeExtension`: como guardar no tema valores que o Material não conhece (cores dos modos)
- Fontes personalizadas (assets) em Flutter

## 4. Escopo
**Dentro:**
- Configurar e autenticar o MCP do Figma
- Extrair tokens do arquivo "ADA-Atualizado" e registrá-los neste plano antes de codar
- `lib/core/theme/app_theme.dart` (e arquivos auxiliares de cores e textos)
- Cores dos modos Normal, Atenção e Perigo
- Aplicar o tema no `app.dart`

**Fora (vai para o backlog):**
- Telas reais (Fase 3)
- Modo escuro (o design não tem)
- Ícones e imagens do design (entram junto com cada tela, Fase 3)

## 5. Pré-requisitos
- Fase 1 concluída (estrutura de pastas e app rodando)
- Design no Figma: arquivo "ADA-Atualizado", página "Page 2" (link mantido privado, fora do repositório)
- Conta do Figma com acesso ao arquivo e login feito no navegador
- Servidor MCP do Figma declarado em `.mcp.json` (feito) e autenticado pela usuária

## 6. Passos
| # | Passo | Tamanho | O que a usuária aprende |
|---|---|---|---|
| 1 ✅ | Configurar o MCP: `.mcp.json` (feito) e autenticar pelo `/mcp` (F2-01) | P | O que é MCP, escopos de configuração, OAuth |
| 2 ✅ | Testar a conexão lendo o frame do link e confirmar o que o Figma devolve | P | Como o Claude "enxerga" um design |
| 3 ✅ | Extrair e registrar os tokens: cores, tipografia, espaçamentos, raios (F2-02) | M | Design tokens; ler um design de forma sistemática |
| 4 ✅ | Revisar os tokens com a usuária (checkpoint antes de codar) | P | Validar decisões de design antes de implementar |
| 5 | Criar `app_theme.dart` com `ColorScheme` e `TextTheme` (F2-03) | M | `ThemeData`, `ColorScheme`, `TextTheme`, Material 3 |
| 6 | Criar as cores dos modos 🔵🟡🔴 com `ThemeExtension` (F2-04) | M | `ThemeExtension`, `lerp`, `copyWith` |
| 7 | Aplicar o tema no `app.dart`, conferir a `HomePage`, `flutter analyze` e `flutter test` | P | `Theme.of(context)`, teste de widget do tema |
| 8 | Retrospectiva, resumos em `docs/aprendizado/`, backlog e commit | P | Fechar a fase com registro |

## 7. Decisões técnicas
| Decisão | Alternativas consideradas | Motivo |
|---|---|---|
| `ColorScheme` com as cores **explícitas** do Figma | `ColorScheme.fromSeed` (gera a paleta a partir de uma cor) | Queremos fidelidade ao design; `fromSeed` inventa tons que o design não tem. Pode combinar os dois (`fromSeed` e ajustes) se o Figma só definir poucas cores |
| Cores dos modos em um `ThemeExtension` | Constantes soltas em `constants/`; enum com cores | Ficam no tema (regra do CLAUDE.md), acessíveis por `Theme.of(context)` e preparadas para claro/escuro |
| Fontes como **assets** no projeto | Pacote `google_fonts` (baixa a fonte pela internet) | Funciona offline, importante para um app de emergência e para a mostra. Se escolhermos `google_fonts`, ele é um pacote novo e pede sua confirmação |
| Tokens registrados no plano antes de codar | Codar direto a partir do Figma | Dá um ponto de revisão e um registro do que foi extraído |

## 8. Riscos e plano B
| Risco | Impacto | Plano B |
|---|---|---|
| Limite de uso do MCP do Figma no plano gratuito (conferir; pode ser de poucas chamadas por mês) | Não conseguir ler todo o design | Extrair com cuidado em poucas chamadas; plano B: copiar cores e fontes do modo Inspect do Figma e me passar em texto ou imagem |
| O design não define alguns tokens (modo escuro, espaçamentos) | Faltam valores para o tema | Definir valores provisórios e registrar no backlog |
| Fonte do design com licença que não permite embutir | Não poder distribuir o app | Escolher uma fonte livre equivalente (ex.: Google Fonts, licença aberta) |
| Autenticação do MCP falhar na extensão do VS Code | Não conectar | Autenticar pelo `/mcp`; se não der, instalar o Claude Code CLI ou usar o plano B de cópia manual |

## 9. Critérios de pronto
- [x] MCP do Figma conectado e lendo o frame
- [ ] Tokens registrados e revisados
- [ ] `app_theme.dart` criado, sem cores ou fontes fixas nos widgets
- [ ] Cores dos modos 🔵🟡🔴 acessíveis pelo tema
- [ ] `flutter analyze` sem avisos e `flutter test` passando
- [ ] Testado no Chrome
- [ ] Backlog atualizado e commit feito

## 10. Como testar
```
flutter run -d chrome   # a tela inicial usa as cores e a fonte do design
flutter analyze
flutter test
```

## 11. Perguntas em aberto
- ✅ Fonte: **Nunito**, livre (licença SIL Open Font License). Será embutida como asset (baixar os `.ttf` do Google Fonts e listar no `pubspec.yaml`, sem pacote novo).
- ✅ Modo escuro: **o design não tem**. Fica só o tema claro; modo escuro vira ideia futura no backlog.
- 🔓 Cores dos três modos: a usuária acredita que estão no Figma. Confirmar na leitura (passo 3).
- ✅ Plano do Figma: **gratuito**. O limite de chamadas do MCP é o principal risco da fase (ver seção 8): ler o design inteiro em poucas chamadas e usar o plano B (Inspect) se acabar.

## 12. Tokens extraídos do Figma

> Fonte: arquivo "ADA-Atualizado", página "Page 2" (22 telas de 393×852). O design **não usa variáveis do Figma**: os valores estão aplicados direto nos elementos. Leitura feita só na tela **Home** (`120:175`); faltam as demais (ver 12.5).

### 12.1 Cores
| Uso | Valor | Onde aparece |
|---|---|---|
| Fundo das telas | `#F8FAFC` | Fundo da Home |
| Borda da barra de navegação | `#E2E2E2` | `nav` |
| Texto principal | `#000000` | "Olá, Gabriela" |
| Texto secundário | `#64748B` | Subtítulos, mensagens |
| Destaque / marca (rosa-coral) | `#F3586B` | Coração; item ativo da navegação (a 15% de opacidade) |
| Perigo, ícone e círculo | `#C93A3A` | Círculo do "Modo perigo" |
| Perigo, texto e sublinhado | `#A82B2B` | "MODO PERIGO" |
| Perigo, fundo / borda do card | `#C93A3A` a 15% / 50% | Card do modo |
| Atenção, ícone e círculo | `#F2B632` | Círculo do "Modo atenção" |
| Atenção, texto e sublinhado | `#8A5A00` | "MODO ATENÇÃO" |
| Atenção, fundo / borda do card | `#F2B632` a 15% / 50% | Card do modo |
| Perigo ativo, "chip" de estado | fundo `#C93A3A` a 15%, texto `#A82B2B`, ponto de 9 | "Modo perigo ativo" (mesmas cores do Perigo; **nenhuma cor nova**) |
| Normal (modo padrão) | `#172033` (azul-marinho, informado pela usuária) | A **Home já é o modo Normal**; o modo **não é verde** no design. Combina com o círculo da logo |

### 12.2 Tipografia (fonte **Nunito**)
| Uso | Peso | Tamanho |
|---|---|---|
| Título da saudação ("Olá, Gabriela") | SemiBold (600) | 24 |
| Rótulo do modo ("MODO PERIGO") | Bold (700) | 16 |
| Subtítulo ("Estamos com você!") | Regular (400) | 16 |
| Texto de apoio ("Nenhum alerta ativo...") | Light (300) | 15 |
| Instrução ("Toque no ícone para desativar.") | Light (300) | 14 |
| Chip de estado ("Modo perigo ativo") | Medium (500) | 15 |
| Legenda do card ("Clique em caso de...") | Regular (400) | 13 |

Altura de linha: normal (sem valor fixo). Pesos a embutir: **Light, Regular, Medium, SemiBold, Bold**.

### 12.3 Medidas e formas
| Item | Valor |
|---|---|
| Tela de referência | 393 × 852 |
| Margem lateral do conteúdo | ~40 |
| Card de modo | 309 × 88, raio 20, borda 1 |
| Círculo de ícone do modo | 46 × 44, totalmente arredondado |
| Ícones | 24 (navegação), 28 (dentro do círculo), 15 (coração) |
| Barra de navegação | altura 73; item ativo com fundo de raio 15 |
| Cabeçalho (logo + sino) | altura 85 |
| Chip de estado | 161 × 25, totalmente arredondado (raio 32) |

### 12.3.1 Como o estado "ativo" aparece (Home, Modo perigo ativo)
- O **símbolo central muda**: no Normal é um círculo azul-marinho com a logo branca; no Perigo ativo vira um círculo **branco com o símbolo vermelho**, e os anéis ficam avermelhados.
- Aparece o **chip** "Modo perigo ativo" e a frase "Toque no ícone para desativar."
- Os cards dos modos e a navegação **não mudam**.
- A tela "Home - Modo atenção ativo" deve seguir o mesmo padrão com as cores de Atenção. **Isto é uma inferência, ainda não lida**; conferir na Fase 3.

### 12.4 Ícones e imagens
- Ícones da família **Lucide** (house, users, map-pin, menu/settings, eye, triangle-alert, heart, bell). O Flutter não traz o Lucide: na Fase 3, decidir entre um pacote de ícones ou SVGs como assets (**pacote novo, pede confirmação**). Registrar no backlog.
- Logos (vertical branca, horizontal azul) e elipses decorativas: exportadas do Figma como PNG/SVG, tratadas na Fase 3. Os links do MCP expiram em 7 dias, então precisam ser baixados para `assets/`.

### 12.5 O que ainda falta ler
- ✅ Cor do modo Normal: `#172033` (informada pela usuária).
- **Cor primária dos botões** e estilo de **campos de texto** (provavelmente nas telas "Rede - cadastro", "Onboarding" e "Permissões"). **Decisão da usuária: ler na Fase 3**, junto com cada tela, para poupar chamadas do plano gratuito; o tema é ajustado nessa hora.
- Chamadas do MCP usadas até aqui: 2 leituras de tela (Home e Home - Modo perigo ativo) e 1 de estrutura, mais uma tentativa que falhou por falta de seleção. Conferir o limite do plano gratuito antes de continuar.

---

## Retrospectiva (preencher ao concluir)

**O que aprendi:**
- <...>

**O que mudou em relação ao plano:**
- <...>

**Dívidas técnicas e novos itens para o backlog:**
- <...>

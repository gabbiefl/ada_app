# Fase 3 — Telas estáticas

> **Status:** 📝 em planejamento
> **Itens do backlog:** F3-01 a F3-06

## 1. Objetivo
Construir as telas do ADA a partir do Figma, ainda sem lógica: dados fixos e botões que não fazem nada. A Home vem primeiro, porque seus tokens já foram lidos.

## 2. Resultado esperado
O app mostra a Home com o visual do design (saudação, símbolo central, cards dos modos e barra de navegação) e as demais telas do MVP, cada uma com widgets reutilizáveis e usando só o tema.

## 3. Conceitos que vamos aprender
- Layout: `Column`, `Row`, `Expanded`, `Stack`, `Padding`, `Container`/`DecoratedBox`
- Composição: dividir uma tela em widgets pequenos e reutilizáveis (`ModeCard`, `StatusChip`)
- Ícones (Lucide) e imagens como assets
- Estilos de botão e campo de texto no tema (`FilledButton`, `InputDecorationTheme`)

## 4. Escopo
**Dentro:**
- Home (Normal e Perigo ativo, com a variação de estado passada por parâmetro, sem lógica)
- Widgets compartilhados: card de modo, chip de estado, barra de navegação
- Telas: rede de contatos, cadastro/edição de contato, mensagens pré-definidas, configurações
- Ajustar o tema com botões e campos (confirmar a cor primária `#F3586B`)

**Fora (vai para o backlog):**
- Navegação real entre telas e estado (Fase 4)
- Salvar contatos e mensagens (Fases 5 e 6)
- Modos funcionando, localização e envio (Fases 7 a 9)

## 5. Pré-requisitos
- Fases 0, 1 e 2 concluídas (tema, fonte e cores dos modos)
- Tokens da Home no plano da Fase 2 (seção 12)
- Figma: poucas chamadas por mês no plano gratuito; ler uma tela por vez e só o necessário

## 6. Passos
| # | Passo | Tamanho | O que a usuária aprende |
|---|---|---|---|
| 1 ✅ | Ícones decididos e instalados; logo e símbolos exportados para `assets/` | P | Assets de imagem e ícones |
| 2 ✅ | Home, parte 1: cabeçalho, saudação e símbolo central (Normal); anéis animados em widget próprio | M | `Column`, `Row`, `Stack`, `Padding` |
| 3 ✅ | Home, parte 2: `ModeCard` reutilizável (Atenção e Perigo) | M | Composição, parâmetros de widget |
| 4 ✅ | Home, parte 3: barra de navegação e variação "Perigo ativo" (chip) | M | Widgets com parâmetros, `NavigationBar` |
| 5 | Ler "Rede - cadastro" no Figma; ajustar tema com botões e campos | M | `FilledButton`, `InputDecorationTheme` |
| 6 | Telas de rede e de cadastro de contato | M | `ListView`, `TextField`, `Form` (só visual) |
| 7 | Telas de mensagens e de configurações | M | Reuso dos widgets já criados |
| 8 | Testes de widget das telas, retrospectiva, resumos e commit | P | Testar o que a tela mostra |

## 7. Decisões técnicas
| Decisão | Alternativas consideradas | Motivo |
|---|---|---|
| Ícones: pacote `lucide_icons_flutter` 4.0.1 (licença MIT) | SVGs como assets (`flutter_svg`) | Mais rápido de usar e fiel ao design (que usa Lucide); SVGs também exigiriam um pacote |
| Variação de estado por parâmetro (`ModeCard(isActive: ...)`) | Lógica de estado já na tela | O estado real vem na Fase 4; aqui só o visual |
| Uma tela por vez, na ordem do uso | Todas de uma vez | Poupa chamadas do Figma e dá algo para mostrar logo |

## 8. Riscos e plano B
| Risco | Impacto | Plano B |
|---|---|---|
| Limite de chamadas do Figma | Não dá para ler todas as telas | Ler Home e uma tela de formulário; as outras seguem os mesmos padrões ou são definidas com você |
| Prazo da mostra (23/11/2026) | Telas fora do MVP não ficam prontas | Prioridade: Home, rede, cadastro; mensagens e configurações podem ser mais simples |
| Mudar de web para Android só na Fase 7 | Problema de layout só aparece tarde | Testar no Chrome com largura de celular (393 × 852) |

## 9. Critérios de pronto
- [ ] Telas do escopo montadas, sem cores ou fontes fixas nos widgets
- [ ] Widgets reutilizáveis em `features/<nome>/widgets/`
- [ ] `flutter analyze` sem avisos e `flutter test` passando
- [ ] Testado no Chrome
- [ ] Backlog atualizado e commit feito

## 10. Como testar
`flutter run -d chrome`, com a janela estreita (perto de 393 × 852). `flutter analyze` e `flutter test`.

## 11. Perguntas em aberto
- ✅ Ícones: pacote `lucide_icons_flutter` (decidido e instalado)
- A cor primária rosa `#F3586B` serve para os botões? (passo 5)
- Quais telas entram no MVP da mostra? Se faltar tempo, quais cortamos?

---

## Retrospectiva (preencher ao concluir)

**O que aprendi:**
- <...>

**O que mudou em relação ao plano:**
- <...>

**Dívidas técnicas e novos itens para o backlog:**
- <...>

# Fase 0 — Entendimento e viabilidade

> **Status:** 📝 em planejamento (aguardando aprovação)
> **Itens do backlog:** F0-01 a F0-06

## 1. Objetivo
Entender tecnicamente cada funcionalidade do ADA, classificá-la (viável, viável com limitações, inviável) e fechar o escopo do MVP da mostra com planos B.

## 2. Resultado esperado
Um documento (este) com a classificação de cada funcionalidade, o MVP em dois níveis, as decisões já tomadas e os riscos. Nenhum código é escrito nesta fase.

## 3. Conceitos que vamos aprender
- Requisitos funcionais x não funcionais
- MVP (produto mínimo viável) e priorização MoSCoW (M/S/C/W)
- Spike técnico (teste rápido de viabilidade)
- Intent do Android, permissões em tempo de execução e foreground service
- Backend como peça de arquitetura (cliente x servidor)

## 4. Escopo
**Dentro:**
- Análise de viabilidade de WhatsApp, SMS, chamada, localização, acionamento com tela bloqueada e acompanhamento ao vivo
- Levantamento de requisitos de privacidade e LGPD
- Definição do MVP e dos planos B

**Fora (vai para o backlog):**
- Qualquer implementação ou spike com código (acontecem nas fases de cada funcionalidade)
- Acionamento com o celular bloqueado (IDEIA-01, fora do MVP por decisão da usuária)
- Envio automático de WhatsApp (inviável sem API Business e backend)

## 5. Pré-requisitos
- CLAUDE.md e BACKLOG.md lidos
- Decisões da usuária: mostra em emulador primeiro, com celular real possível; APK instalado manualmente (sem Play Store)

## 6. Classificação das funcionalidades

| # | Funcionalidade | Classificação | Plano B / observação |
|---|---|---|---|
| 1 | Limite de 5 contatos, mensagens pré-definidas, modos Normal/Atenção/Perigo | ✅ Viável | Lógica local |
| 2 | Regras por horário | ✅ Viável | Dart puro, testável |
| 3 | Chamada rápida | ✅ Viável | `tel:` abre o discador (1 toque extra); `CALL_PHONE` permite ligar direto |
| 4 | Localização atual como link de mapa | ✅ Viável | Permissão de localização + link `maps.google.com/?q=lat,lng` |
| 5 | Mensagem por SMS | ⚠️ Com limitações | SMS direto (`SEND_SMS`) funciona no APK manual, mas não passaria na Play Store; alternativa: `sms:` abre o compositor |
| 6 | WhatsApp | ⚠️ Com limitações | `wa.me` abre a conversa com texto pronto; a usuária toca em enviar; um contato por vez |
| 7 | Acionar a rede "simultaneamente" | ⚠️ Com limitações | Simultâneo só por SMS direto; WhatsApp é sequencial |
| 8 | Acompanhamento ao vivo por link (estilo Uber) | ⚠️ Com limitações | Exige backend (Firebase), internet e foreground service; plano B: link estático (item 4) |
| 9 | Acionamento com celular bloqueado | ⚠️ Com limitações | Fora do MVP; ideia futura: notificação com botão, widget ou Quick Settings tile (código nativo) |
| 10 | Envio automático de WhatsApp sem toque | ❌ Inviável | Só via API Business + backend, ou gambiarra de acessibilidade que viola os termos |
| 11 | Privacidade e LGPD | ✅ Viável, obrigatório | Dados locais, consentimento, ID de sessão aleatório e encerrável |

## 7. Escopo do MVP da mostra

**Nível 1 — MVP garantido (sem backend):**
- Cadastro de até 5 contatos com validação
- Mensagens pré-definidas editáveis
- Modos Normal, Atenção e Perigo
- Localização atual enviada como link de mapa
- Chamada rápida
- WhatsApp com mensagem pronta e SMS como alternativa
- Regra de contato por horário

**Nível 2 — Meta ambiciosa (depois da Fase 9):**
- Link de acompanhamento ao vivo com Firebase + página web de mapa
- Só começa se o Nível 1 estiver estável

**Fora:** acionamento com tela bloqueada, envio automático de WhatsApp, iOS.

## 8. Passos
| # | Passo | Tamanho | O que a usuária aprende |
|---|---|---|---|
| 1 | Revisar a classificação da seção 6 e fechar F0-01 a F0-04 | P | Diferença entre viável, com limitações e inviável |
| 2 | Levantar requisitos de privacidade e LGPD (F0-05) | M | Dados pessoais, consentimento, minimização |
| 3 | Escrever requisitos funcionais e não funcionais | M | Como separar "o que faz" de "como deve se comportar" |
| 4 | Fechar o MVP em dois níveis e atualizar o backlog (F0-06) | P | Priorização e controle de escopo |
| 5 | Retrospectiva e commit | P | Fechar uma fase com registro |

## 9. Decisões técnicas
| Decisão | Alternativas consideradas | Motivo |
|---|---|---|
| Plataforma de demonstração: emulador primeiro, celular real depois | Só celular real | Mais rápido para iterar; localização simulável por rota GPX |
| SMS direto permitido no MVP | Só `sms:` | APK é instalado manualmente, sem restrição da Play Store |
| Acompanhamento ao vivo com Firebase (decisão na hora de implementar) | Supabase, backend próprio | Plano gratuito, escuta de mudanças em tempo real, hospedagem da página; comparar na época |
| Acionamento com tela bloqueada fora do MVP | Notificação, widget, tile | Exige código nativo e não é essencial para a mostra |

## 9.1 Stack tecnológica

> Base do Nível 1 **aprovada pela usuária**. Cada pacote é reconfirmado na fase em que entrar.

**Nível 1 (tudo no celular)**
| Necessidade | Escolha | Alternativas | Motivo |
|---|---|---|---|
| Linguagem e UI | Flutter + Dart, Material 3 | | Já definido |
| Navegação | `go_router` | `Navigator`, `auto_route` | Padrão recomendado e já previsto no CLAUDE.md |
| Estado | Provider (`ChangeNotifier`) | Riverpod, Bloc | Menos conceitos novos; suficiente para o tamanho do app |
| Dados locais | `shared_preferences` (preferências e mensagens) + `flutter_secure_storage` (contatos) | `sqflite`, `drift`, `Hive`, `Isar` | Poucos dados; sem necessidade de SQL; contatos de terceiros ficam criptografados (Keystore) |
| Localização | `geolocator` | `location` | Posição atual e stream contínuo com notificação de serviço |
| Permissões | `permission_handler` | Só o `geolocator` | Centraliza localização, telefone, SMS e notificações |
| Ligar, SMS, WhatsApp | `url_launcher` (`tel:`, `sms:`, `wa.me`) | | Padrão para abrir outros apps |
| Ligação e SMS diretos | A decidir na Fase 9 com spike | `flutter_phone_direct_caller`, pacotes de SMS | Manutenção dos pacotes muda; conferir na época |
| Háptico | `HapticFeedback` (nativo do Flutter) | | Sem pacote extra |
| Testes | `flutter_test` (e `mocktail` se necessário) | | |

**Nível 2 (acompanhamento ao vivo)**
| Necessidade | Escolha | Alternativas | Motivo |
|---|---|---|---|
| Banco em tempo real | Firebase (Realtime Database ou Firestore, decidir na época) | Supabase | Plano gratuito e atualização em tempo real |
| Escrita segura | Firebase Auth anônimo + regras de segurança | Sem autenticação | Só quem criou a sessão escreve; o link só lê |
| Página de rastreamento | HTML + JavaScript + Leaflet (OpenStreetMap) no Firebase Hosting | Google Maps API | Sem chave de API nem cartão |
| Deploy | Node.js + Firebase CLI | | Necessário para publicar a página |

**Fora de propósito:** servidor próprio, banco SQL e iOS.

**Ferramentas:** Git/GitHub, VS Code, Android Studio (emulador com rota GPX), Figma MCP (Fase 2) e `flutter analyze` antes de cada commit.

## 10. Riscos e plano B
| Risco | Impacto | Plano B |
|---|---|---|
| Prazo curto (mostra em 23/11/2026) | Nível 2 não ficar pronto | Congelar o Nível 1 até ~02/11; se atrasar, o Nível 2 vira apenas demonstração parcial |
| Internet do local instável | Acompanhamento ao vivo falhar na apresentação | Demonstrar o Nível 1 (link estático) e ter um vídeo gravado do Nível 2 |
| Android encerra serviço em segundo plano (Xiaomi, Samsung) | Rastreamento para de enviar | Testar em aparelho real; orientar desativar otimização de bateria |
| Limites do plano gratuito do Firebase mudarem | Custo inesperado | Conferir os limites antes de implementar; alternativa Supabase |
| Link de rastreamento vazar | Exposição da localização | ID aleatório longo, encerrar sessão ao desativar o modo, apagar dados |
| Aprovação de permissões sensíveis | Fluxo quebrado se negadas | Tratar negação e mostrar explicação clara |

## 11. Critérios de pronto
- [ ] Classificação revisada e aprovada pela usuária
- [ ] Requisitos funcionais e não funcionais escritos
- [ ] Requisitos de privacidade e LGPD levantados
- [ ] MVP em dois níveis fechado
- [ ] Backlog atualizado e commit feito

## 12. Como testar
Não há código. A validação é a usuária conseguir explicar, para cada funcionalidade, o que é automático, o que exige toque e qual é o plano B.

## 13. Perguntas em aberto
- ✅ Prazo: a mostra é em **23/11/2026** (cerca de 7 semanas a partir de 06/10/2026). O Nível 2 só começa se o Nível 1 estiver estável por volta de 02/11, restando ~3 semanas.
- ✅ Internet: **haverá internet** no local, então o acompanhamento ao vivo pode ser demonstrado. O link estático continua como plano B.

---

## Retrospectiva (preencher ao concluir)

**O que aprendi:**
- <...>

**O que mudou em relação ao plano:**
- <...>

**Dívidas técnicas e novos itens para o backlog:**
- <...>

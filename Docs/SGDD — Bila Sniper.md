# SGDD — Bila Sniper
**Título provisório**

**Autor:** @Natan

---

## 1. Enredo

Jogo de bila (bola de gude) em 2D, com vista de cima e controles exclusivos pelo mouse. O jogador escolhe um modo de jogo, uma skin de bila e um cenário, e lança sua bila para ticar as outras, como na brincadeira de rua do triângulo.

Cada modo modifica o objetivo — acertar um alvo, ser rápido, coletar bilas ou pontuar —, mas a habilidade central permanece a mesma: mirar, dosar a força e prever as colisões.

### Legenda de marcações

- **Negrito:** arte e interface.
- *Itálico:* programação e mecânicas.
- `[Colchetes]`: música e sons.

---

## 2. Fluxo do jogo e descrição das mecânicas

### 2.1. Menu inicial

O jogo começa na **tela inicial de menu**, com uma **animação de fundo** e as seguintes opções:

- **Jogar**
- **Multiplayer Local:** bloqueado, com cadeado, indicando um recurso futuro.
- **Conquistas**
- **Configurações**

**Áudio:**
- `[Trilha sonora do menu]`
- *Ao navegar entre as opções:* `[Som de troca de opção]`
- *Ao confirmar uma opção:* `[Som de confirmação]`

### 2.2. Tela de conquistas

A **tela de Conquistas** apresenta:

- **Total de bilas conquistadas.**
- **Melhor tempo no modo Velocidade.**
- **Maior sequência de acertos no modo Tiro ao Alvo.**

*Esses dados devem ser armazenados entre sessões.* Esse recurso é desejável para a V1 e será implementado se houver tempo disponível.

### 2.3. Seleção de modos de jogo

Ao clicar em **Jogar**, o jogador acessa a **tela de modos de jogo**, que apresenta um **fundo animado com texturas**.

A trilha sonora do menu continua tocando durante essa tela.

**Modos disponíveis na V1:**

- **Clássico Triângulo**
- **Velocidade**
- **Tiro ao Alvo**

**Modos bloqueados:**

- **x1 de Dano**
- **Pontuação**
- **Distância**

Os modos bloqueados aparecem com um cadeado e não podem ser selecionados.

### 2.4. Seleção de skin e cenário

Após escolher o modo, o jogador acessa:

1. **Tela de seleção de skin da bila.**
2. **Tela de seleção de cenário.**

*As escolhas são armazenadas e transferidas para a partida.*

O cenário básico apresenta:

- **Terreno de areia em 2D, visto de cima**, com uma composição semelhante à superfície de uma mesa de sinuca mas com uma area maior.
- **Pedras espalhadas** pelo terreno.
- **Pés de pessoas usando chinelos** ao redor do campo.

**Áudio:** `[Som ambiente de pessoas conversando]`

A partida começa com a **bila do jogador** e as **bilas-alvo** posicionadas de acordo com as regras do modo selecionado.

### 2.5. HUD e controles

A interface durante a partida apresenta um **HUD simples**, contendo os elementos relevantes para cada modo:

- **Bila escolhida pelo jogador.**
- **Indicador de turno:** jogador ou IA, no Clássico Triângulo.
- **Quantidade de bilas coletadas.**
- **Pontuação, tempo ou jogadas restantes**, conforme o modo.

O HUD varia conforme a família de modos:

- **HUD de coleta:** Clássico Triângulo.
- **HUD de velocidade:** Velocidade.
- **HUD de pontuação:** modos futuros.

Os **controles de direção e força do lançamento** aparecem somente durante a vez do jogador.

*O controle é realizado exclusivamente pelo mouse, utilizando uma mecânica semelhante à da sinuca:*

1. O jogador posiciona o mouse em relação à bila.
2. Arrasta o mouse para trás para definir a direção e a força.
3. A direção é determinada pelo sentido do arrasto.
4. A força é proporcional à distância do arrasto.
5. Ao soltar o botão do mouse, a bila é lançada.

**Áudio:**
- `[Som de lançamento]`
- `[Som de colisão entre bilas]`
- `[Som de colisão entre bila e pedra ou obstáculo]`
- `[Trilha sonora da partida]`

*A bila se movimenta com física simples de atrito e colisão, permanecendo no local onde termina o movimento.*

---

## 3. Modos de jogo

### 3.1. Clássico Triângulo

**Modo principal da V1 — jogador contra IA.**

O objetivo é conquistar o maior número possível de bilas posicionadas dentro de um triângulo.

#### Preparação e aposta

Após selecionar a skin e o cenário, o jogador acessa a **tela de aposta**, na qual escolhe quantas bilas cada lado colocará em jogo.

- *O jogador escolhe uma quantidade entre 1 e 6 bilas.*
- *A IA sorteia sua aposta: pode repetir a quantidade escolhida pelo jogador ou selecionar outro número entre 1 e 6.*
- *As bilas apostadas por ambos os lados são posicionadas dentro do triângulo.*

O campo apresenta:

- **Triângulo riscado no chão.**
- **Linha de lançamento**, posicionada a uma distância fixa, inspirada na distância de aproximadamente 3 metros da brincadeira real.

#### Disputa pela ordem de jogada

Antes de começar a disputa pelas bilas, ocorre uma disputa para determinar quem joga primeiro.

*Essa mecânica sera reaproveitada para lógica do modo Distância, previsto para versões futuras.*

1. Cada participante lança uma bila em direção à linha de lançamento.
2. Quem parar mais perto da linha, sem ultrapassá-la, joga primeiro.
3. Quem ultrapassar a linha joga por último.

#### Regras de jogada

Após definir a ordem, os participantes começam a lançar suas bilas para ticar as bilas posicionadas dentro do triângulo e empurrá-las para fora.

- *Se a bila atingida sair completamente do triângulo, o participante que realizou o lançamento conquista essa bila e joga novamente.*
- *Se o lançamento não resultar em uma conquista, a vez passa para o outro participante.*
- *A bila lançada permanece no local em que parou.*
- *A vez alterna entre os participantes até que uma nova conquista permita repetir a jogada.*
- *Uma bila de um jogador que esteja parada dentro do triângulo não pode ser conquistada pelo adversário.*

#### Contagem e condição de vitória

O contador de **bilas coletadas** de cada participante aumenta a cada conquista.

*A partida termina quando não restam bilas dentro do triângulo.*

- **Vitória:** vence quem tiver conquistado mais bilas.
- **Derrota:** perde quem tiver conquistado menos bilas.
- **Empate:** ocorre se ambos terminarem com a mesma quantidade de bilas conquistadas.

Não há derrota por tempo ou por número de jogadas. O jogador pode conquistar muitas bilas do adversário ou perder todas as suas, e o resultado depende da comparação das contagens finais.

*As bilas retornam ao estado inicial a cada partida.* Somente o total acumulado de bilas conquistadas é registrado na tela de Conquistas.

### 3.2. Velocidade

O objetivo é ticar todas as bilas do campo antes que o cronômetro chegue a zero.

#### Regras

- *O campo é gerado com um conjunto predefinido de bilas.*
- *Ticar uma bila exige apenas tocá-la.*
- *A bila do jogador permanece no local em que parou entre uma jogada e outra.*
- **O tempo máximo varia conforme a dificuldade.**
- *Uma configuração de exemplo estabelece o limite de 2 minutos.*
- *Uma variação pode combinar tempo e quantidade de jogadas, por exemplo, 2 minutos e 3 jogadas.*

Este é o único modo da V1 com limite de tempo.

#### Condições de vitória e derrota

- **Vitória:** todas as bilas são ticadas antes de o tempo ou o limite de jogadas acabar.
- **Derrota:** o jogador excede o tempo disponível ou o limite de jogadas.

Ao vencer, o **tempo gasto** é registrado como resultado da partida.

### 3.3. Tiro ao Alvo

O objetivo é acertar o maior número possível de bilas-alvo consecutivamente, sem errar.

#### Geração dos alvos

- *Uma bila é escolhida aleatoriamente como alvo.*
- *O alvo aparece em uma posição sorteada dentro da área jogável.*
- **A bila-alvo recebe um destaque visual** para facilitar sua identificação.

A posição sorteada deve respeitar as seguintes restrições:

- *Não pode haver colisão com pedras ou outras peças do cenário.*
- *Deve existir uma distância mínima entre o alvo e a bila do jogador.*
- *O valor da distância mínima será ajustado durante os testes.*

#### Regras de jogada

- *O jogador tem uma única tacada para acertar o alvo.*
- *A bila do jogador retorna à sua posição inicial fixa após cada tacada.*
- *A cada acerto, uma nova bila-alvo é sorteada em outra posição.*
- *A contagem de acertos aumenta a cada novo alvo atingido.*
- *O primeiro erro encerra a partida.*

Este modo não possui limite de tempo.

#### Condição de término

Ao errar, o jogador é direcionado para a **tela de resultado**, que apresenta a **sequência total de acertos consecutivos**.

---

## 4. Encerramento da partida

Quando o objetivo do modo é concluído ou ocorre uma condição de falha, *a partida termina e a tela de resultado é exibida*.

A tela apresenta o resultado correspondente ao modo:

| Modo | Resultado exibido |
|---|---|
| Clássico Triângulo | Contagem final de bilas conquistadas |
| Velocidade | Tempo gasto para concluir o objetivo |
| Tiro ao Alvo | Sequência de acertos consecutivos |

A interface oferece os seguintes botões:

- **Reiniciar**
- **Voltar ao menu**

Também devem existir uma **tela de pausa** e uma **tela de comandos**, além de botões **Voltar** nas telas de seleção.

---

## 5. Mecânicas futuras — fora da V1

### Coleção de skins de bilas

*O jogador poderá desbloquear skins de bilas ao conquistar bilas durante as partidas.*

A tela de Conquistas será o ponto de partida para essa coleção.

**Na V1:**
- Todas as skins ficam liberadas desde o início.
- A coleção desbloqueável não será implementada.
- O sistema de conquistas poderá armazenar o total acumulado de bilas, caso haja tempo disponível.

---

## 6. Listas de elementos

### 6.1. Arte e interface

#### Telas

- [ ] **Tela inicial de menu:** botões Jogar, Multiplayer Local (bloqueado, com cadeado), Conquistas e Configurações; animação de fundo.
- [ ] **Tela de Conquistas:** total de bilas conquistadas, melhor tempo no Velocidade e maior sequência no Tiro ao Alvo; persistência entre sessões desejável na V1.
- [ ] **Tela de Configurações:** controle de volume; demais opções a definir.
- [ ] **Tela de modos de jogo:** fundo animado com texturas, três modos ativos e três bloqueados com cadeado.
- [ ] **Tela de seleção de skin da bila.**
- [ ] **Tela de seleção de cenário:** uma opção na V1.
- [ ] **Tela de aposta de bilas:** seletor de 1 a 6.
- [ ] **Tela de pausa.**
- [ ] **Tela de comandos.**
- [ ] **Tela de resultado:** contagem final de bilas, tempo gasto ou sequência de acertos, conforme o modo.
- [ ] **Telas de seleção:** botão Voltar.
- [ ] **Tela futura de coleção de skins de bilas.**

#### Elementos gráficos

- [ ] **Skins de bila:** quantidade a definir; mínimo de três na V1, todas liberadas.
- [ ] **Bilas-alvo:** sprites.
- [ ] **Cenário 1:** terreno de areia em 2D, visto de cima, com pedras e pés usando chinelos ao redor.
- [ ] **Triângulo riscado no chão.**
- [ ] **Linha de lançamento.**
- [ ] **Destaque visual da bila-alvo:** Tiro ao Alvo.
- [ ] **Linha-guia de mira e indicador de força:** aparecem durante a vez do jogador.
- [ ] **Efeitos de poeira:** ao lançar e ao colidir, opcionais.

#### HUDs

- [ ] **HUD de coleta:** bila atual, indicação de turno (jogador ou IA) e bilas coletadas por cada lado.
- [ ] **HUD de velocidade:** bila atual, cronômetro e jogadas restantes.
- [ ] **HUD do Tiro ao Alvo:** bila atual e sequência de acertos, sem cronômetro.
- [ ] **HUD de pontuação:** destinado a um modo futuro.

#### Botões

- [ ] **Reiniciar.**
- [ ] **Voltar ao menu.**
- [ ] **Voltar:** nas telas de seleção.

### 6.2. Música e sons

- [ ] Trilha sonora do menu e da seleção de modos, compartilhada e contínua.
- [ ] Trilha sonora da partida.
- [ ] Som de troca de opção.
- [ ] Som de confirmação de opção.
- [ ] Som de lançamento da bila.
- [ ] Som de colisão entre bilas.
- [ ] Som de colisão entre bila e pedra ou obstáculo.
- [ ] Som ambiente de pessoas conversando.
- [ ] Som de bila saindo do triângulo ou sendo conquistada — sugestão.
- [ ] Sons de vitória e derrota na tela de resultado — sugestão.

### 6.3. Programação

#### Fluxo e gerenciamento de telas

- [ ] Máquina de estados para as telas: menu → modos → skin → cenário → aposta (quando aplicável) → partida → resultado.
- [ ] Navegação por mouse com sons de troca e confirmação.
- [ ] Bloqueio dos modos futuros e do Multiplayer Local.
- [ ] Armazenamento das escolhas de modo, skin, cenário e aposta.
- [ ] Botões de pausa, reinício e retorno ao menu.
- [ ] Persistência entre sessões do total de bilas, do melhor tempo no Velocidade e da maior sequência no Tiro ao Alvo, com exibição na tela de Conquistas; desejável na V1.

#### Câmera, controles e física

- [ ] Câmera 2D fixa, com vista de cima.
- [ ] Controle pelo mouse no estilo sinuca: arrastar para trás define direção e força; soltar lança a bila.
- [ ] Exibição dos controles somente durante a vez do jogador.
- [ ] Física de movimento, atrito e colisão entre bilas.
- [ ] Física de colisão entre bilas e elementos do cenário.
- [ ] Permanência da bila no local em que termina o movimento, nos modos Clássico e Velocidade.
- [ ] Detecção de bila completamente fora do triângulo.

#### Clássico Triângulo

- [ ] Gerenciamento de turnos entre jogador e IA.
- [ ] Disputa de ordem por proximidade da linha, reaproveitando a lógica do modo Distância; quem ultrapassa joga por último.
- [ ] Sistema de aposta entre 1 e 6 bilas.
- [ ] Posicionamento das bilas apostadas dentro do triângulo.
- [ ] Mecânica de conquista de bilas.
- [ ] Repetição da vez após uma conquista.
- [ ] Passagem da vez após um lançamento sem conquista.
- [ ] Regra de proteção das bilas próprias que permanecem dentro do triângulo.
- [ ] Detecção do fim da partida.
- [ ] Determinação do vencedor pela quantidade de bilas conquistadas.
- [ ] IA capaz de sortear a aposta, repetindo a do jogador ou escolhendo outra quantidade entre 1 e 6.
- [ ] IA capaz de escolher uma bila e calcular direção e força com erro controlado; um nível de dificuldade na V1.

#### Modo Velocidade

- [ ] Geração de campo com conjunto predefinido de bilas.
- [ ] Detecção de bila ticada por contato.
- [ ] Cronômetro com tempo máximo configurável por dificuldade.
- [ ] Limite opcional de jogadas.
- [ ] Condições de vitória e derrota por tempo ou jogadas.
- [ ] Registro do tempo gasto ao concluir o objetivo.

#### Modo Tiro ao Alvo

- [ ] Sorteio de uma bila-alvo em posição aleatória dentro do cenário.
- [ ] Validação da posição do alvo para evitar colisões com peças do cenário.
- [ ] Validação da distância mínima entre alvo e bila do jogador.
- [ ] Limite de uma tacada por alvo.
- [ ] Retorno da bila do jogador à posição inicial fixa após cada tacada.
- [ ] Sorteio de um novo alvo após cada acerto.
- [ ] Encerramento no primeiro erro.
- [ ] Registro da sequência de acertos.

#### Sistemas compartilhados

- [ ] Contagem de bilas conquistadas, acertos e tempo; o tempo é utilizado como limite e resultado somente no Velocidade.
- [ ] HUD dinâmico conforme a família do modo.
- [ ] Tela de resultado com Reiniciar e Voltar ao menu.
- [ ] Sistema de pausa.
- [ ] Reprodução e mixagem simples de trilhas, efeitos e sons ambientes.

### 6.4. Backlog pós-V1

- [ ] Multiplayer Local.
- [ ] Coleção de skins desbloqueáveis.
- [ ] Modo x1 de Dano.
- [ ] Modo Pontuação.
- [ ] Modo Distância.
- [ ] Segundo cenário.
- [ ] Mais níveis de dificuldade da IA.

---

## 7. Escopo da V1

A primeira versão prioriza um jogo funcional com três modos selecionáveis, controles por mouse e identidade visual consistente.

**Funcionalidades principais:**

1. Clássico Triângulo contra IA.
2. Velocidade com cronômetro e limite opcional de jogadas.
3. Tiro ao Alvo com sequência de acertos.
4. Seleção de skin e cenário.
5. Física básica de lançamento, atrito e colisão.
6. HUDs específicos para cada modo.
7. Telas de menu, seleção, partida e resultado.
8. Efeitos sonoros, trilhas e som ambiente.
9. Registro de conquistas entre sessões, se houver tempo disponível.

**Fora do escopo inicial:** Multiplayer Local, skins desbloqueáveis, modos adicionais e segundo cenário.

---

*Documento de design em desenvolvimento. Mecânicas, parâmetros de física, distâncias mínimas e detalhes de interface poderão ser ajustados durante a implementação e os testes.*

SGDD — Bila Sniper

Enredo
Jogo de bila (bola de gude) em 2D, vista de cima, jogado só com o mouse. O jogador escolhe um modo, uma skin de bila e um cenário, e lança sua bila para ticar as outras, como na brincadeira de rua do triângulo. Cada modo muda o objetivo (acertar um alvo, ser rápido, coletar bilas, pontuar), mas a habilidade central é sempre mirar, dosar a força e prever a colisão.
Legenda de marcações: negrito = arte/interface · itálico = programação · [colchetes] = música e sons.
Jogo (texto corrido)
O jogo começa na tela inicial de menu, com uma animação de fundo e as opções Jogar, Multiplayer Local (bloqueada, com cadeado, indicando um recurso futuro), Conquistas e Configurações [trilha sonora do menu]. Ao navegar entre as opções [som: trocar de opção] e ao confirmar uma delas [som: confirmar]. A tela de Conquistas mostra o total de bilas conquistadas, o melhor tempo no Velocidade e a maior sequência no Tiro ao Alvo, e esses dados são guardados entre sessões (item desejável, a fazer se o tempo permitir). Clicar em Jogar abre a tela de modos de jogo, com fundo animado com texturas, e a trilha do menu continua tocando. Nela, estão selecionáveis os modos Clássico Triângulo, Velocidade e Tiro ao Alvo; os modos x1 de Dano, Pontuação e Distância aparecem bloqueados (cadeado, não clicáveis).
Depois de escolher o modo, surge a tela de seleção de skin da bila e, em seguida, a tela de seleção de cenário. As escolhas são guardadas e passadas para a partida. O cenário básico é um terreno de areia em 2D, vista de cima, como uma mesa de sinuca, com pedras espalhadas e pés de pessoas de chinelo ao redor do campo [som ambiente: falatório de pessoas]. A partida começa com a bila do jogador e as bilas alvo posicionadas conforme o modo.
A tela mostra um HUD simples: a bila escolhida, de quem é a vez (no Clássico Triângulo, jogador e IA), quantidade de bilas coletadas e pontuação (ou tempo/tacadas restantes, conforme o modo). O HUD muda por família de modo: HUD de coleta (Clássico Triângulo), HUD de velocidade (Velocidade) e HUD de pontuação (modos futuros). Os controles de direção e força do lançamento só aparecem na vez do jogador e são operados pelo mouse: o jogador mira com o mouse arrastando para trás, como na sinuca: a direção vem do arrasto, a força vem do tamanho dele, e soltar lança a bila [som: lançamento]. A bila lançada se move com física simples de atrito e colisão e fica parada onde terminar o movimento [som: bila batendo em bila] [som: bila batendo em pedra ou obstáculo do cenário] [trilha sonora da partida].
Clássico Triângulo (modo principal da V1, jogador contra uma IA): depois da skin e do cenário, surge a tela de aposta, onde o jogador escolhe quantas bilas cada lado coloca no jogo, de 1 a 6. A IA sorteia a sua aposta: repete o número do jogador ou escolhe outro entre 1 e 6. As bilas apostadas pelos dois lados são posicionadas dentro do triângulo. O campo tem um triângulo riscado no chão e uma linha de lançamento a uma distância fixa (cerca de 3 metros na brincadeira real). Primeiro vem a disputa de ordem, que reaproveita a mecânica do modo Distância: cada um lança uma bila em direção à linha, e quem para mais perto dela, sem ultrapassar, joga primeiro; quem ultrapassa a linha joga por último. Depois, cada um lança sua bila para ticar as do triângulo e empurrá-las para fora. Se a bila atingida sai completamente do triângulo, quem lançou a conquista e joga de novo; se erra, passa a vez. A bila lançada fica onde parou, e a vez segue para o outro jogador, até voltar ao primeiro. A bila de um jogador parada dentro do triângulo não pode ser conquistada pelo adversário. O contador de bilas coletadas de cada lado sobe a cada conquista. A partida termina quando não restam bilas no triângulo, e vence quem coletou mais bilas. Não há derrota por tempo ou por jogadas: o jogador pode ganhar muitas bilas do adversário ou perder todas, e o resultado é a comparação das contagens. As bilas voltam ao estado inicial a cada partida; só o total conquistado é somado na tela de Conquistas.
Velocidade: o campo é gerado com um conjunto pré-definido de bilas, e o jogador deve ticar todas antes que o cronômetro chegue a zero. Ticar basta tocar na bila. A bila do jogador fica onde parou entre uma jogada e outra. O tempo máximo varia por dificuldade, por exemplo 2 minutos, e uma variação soma um limite de jogadas, por exemplo 2 minutos e 3 jogadas. Este é o único modo com limite de tempo. Perde-se ao estourar o tempo ou as jogadas; ao vencer, o tempo gasto vira o resultado.
Tiro ao Alvo: uma bila é escolhida aleatoriamente como alvo e aparece em uma posição sorteada dentro do espaço do cenário, destacada visualmente. A posição sorteada não pode colidir com pedras ou outras peças do cenário e precisa respeitar uma distância mínima da bila do jogador (valor a ajustar nos testes). O jogador tem uma única tacada para acertá-la, e a bila do jogador volta à posição inicial, que é fixa na V1, a cada tacada. A cada acerto, uma nova bila-alvo é sorteada em outra posição e a contagem de acertos sobe. Errar encerra a partida, e a tela de resultado mostra a sequência de acertos. Este modo não tem limite de tempo.
Quando o objetivo é concluído ou falha, a partida termina e aparece a tela de resultado, que mostra a pontuação, o tempo ou a contagem final de bilas, conforme o modo, com os botões Reiniciar e Voltar ao menu.
Mecânica futura (fora da V1): coleção de skins de bilas diferentes, desbloqueadas ao conquistar bilas. A tela de Conquistas é o ponto de partida dessa coleção. Na V1, as skins ficam todas liberadas desde o início.
Listas de elementos
Arte e interface
• Tela inicial de menu: botões Jogar, Multiplayer Local (bloqueado, com cadeado), Conquistas e Configurações, animação de fundo
• Tela de Conquistas: total de bilas, melhor tempo no Velocidade e maior sequência no Tiro ao Alvo (desejável na V1)
• Tela de Configurações (volume; demais itens a definir)
• Tela de modos de jogo: fundo animado com texturas, 3 modos ativos, 3 bloqueados (cadeado)
• Tela de seleção de skin da bila
• Tela de seleção de cenário (1 opção na V1)
• Tela de aposta de bilas (seletor de 1 a 6)
• Skins de bila (quantidade a definir; mínimo 3 para a V1, todas liberadas)
• Bilas alvo (sprites)
• Cenário 1: terreno de areia 2D visto de cima, pedras, pés com chinelo ao redor
• Triângulo riscado no chão e linha de lançamento
• Destaque visual da bila-alvo (Tiro ao Alvo)
• Interface: linha guia de mira e indicador de força (arrastar e soltar), visíveis só na vez do jogador
• HUD de coleta: bila atual, vez do jogador (jogador ou IA), bilas coletadas de cada lado
• HUD de velocidade: bila atual, cronômetro, jogadas restantes
• HUD do Tiro ao Alvo: bila atual, sequência de acertos (sem cronômetro)
• HUD de pontuação (modo futuro)
• Efeitos: poeira ao lançar e ao colidir (opcional)
• Tela de resultado: contagem final de bilas (Clássico), tempo gasto (Velocidade) ou sequência de acertos (Tiro ao Alvo)
• Botões Reiniciar e Voltar ao menu
• Tela de pausa e tela de comandos; botão Voltar nas telas de seleção
• Futuro: tela de coleção de skins de bilas
Música e sons
• Trilha do menu e da seleção de modos (mesma, contínua)
• Trilha da partida
• Som: trocar de opção
• Som: confirmar opção
• Som: lançamento da bila
• Som: bila × bila
• Som: bila × pedra/obstáculo
• Som ambiente: falatório de pessoas
• Som: bila sai do triângulo / é conquistada (sugestão)
• Sons de vitória e derrota na tela de resultado (sugestão)
Programação
• Máquina de estados de telas: menu → modos → skin → cenário → (aposta) → partida → resultado
• Navegação por mouse com som de troca e de confirmação
• Bloqueio de modos e do Multiplayer Local
• Guardar as escolhas de modo, skin, cenário e aposta
• Guardar entre sessões o total de bilas, o melhor tempo no Velocidade e a maior sequência no Tiro ao Alvo, e exibi-los em Conquistas (desejável)
• Câmera 2D fixa, vista de cima
• Controle por mouse estilo sinuca: arrastar para trás define direção e força, soltar lança
• Exibir controles só na vez do jogador
• Física: movimento, atrito, colisão bila × bila e bila × cenário; a bila fica onde parou (Clássico e Velocidade)
• Detectar bila totalmente fora do triângulo
• Gerenciar turnos entre jogador e IA
• Disputa de ordem por proximidade da linha, reaproveitada do modo Distância; quem ultrapassa joga por último
• Regras do Clássico Triângulo: aposta de 1 a 6, posicionar bilas apostadas, conquistar bila, repetir a vez, passar a vez, bila parada dentro do triângulo não conquistável, fim da partida, vence quem coletou mais
• IA do adversário: sortear aposta (repete a do jogador ou outro número de 1 a 6); escolher bila, calcular direção e força com erro controlado (1 nível na V1)
• Modo Velocidade: gerar campo pré-definido, ticar por toque, cronômetro, tempo máximo e limite de jogadas
• Modo Tiro ao Alvo: sorteio da bila-alvo em posição aleatória do cenário, sem colidir com peças do cenário e respeitando distância mínima da bila do jogador, uma tacada, bila do jogador volta à posição inicial fixa a cada tacada, novo alvo a cada acerto, fim no primeiro erro
• Contagem de bilas coletadas, acertos e tempo (tempo só no Velocidade)
• Condições de vitória e derrota por modo
• HUD dinâmico por família de modo
• Tela de resultado com Reiniciar e Voltar ao menu; pausa
• Áudio: trilhas, efeitos e ambiente com mixagem simples
• Backlog pós-V1: Multiplayer Local, coleção de skins desbloqueáveis, modos x1 de Dano, Pontuação e Distância, segundo cenário, mais níveis de IA

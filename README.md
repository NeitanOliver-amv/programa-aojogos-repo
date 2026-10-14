# Programaçao de JOGOS — Bila sniper (bola de gude) 2D

-----------------
Bila sniper — jogo de bilas 2D em vista de cima, jogado só com o mouse: mire, dosе a força e tique as bilas adversárias em modos variados.

Equipe
------
| Nome | GitHub |
|---|---|
| Neitan Oliver | @NeitanOliver-amv |



O jogo (visão geral)
-------------------
O jogador escolhe um modo, uma skin de bila e um cenário, e lança sua bila para ticar as outras como na brincadeira do triângulo. Cada modo muda o objetivo (acertar um alvo, ser rápido, coletar bilas, pontuar), mas a habilidade central é sempre mirar, dosar a força e prever colisões. A navegação é por mouse; menus e telas têm trilha e efeitos sonoros.

Mecânicas essenciais (obrigatórias para a V1)
---------------------------------------------
1. Mira e lançamento por mouse: arrastar para trás define a direção e a força; soltar lança. (_controle por mouse estilo sinuca; exibir linha guia e indicador de força apenas na vez do jogador_)  
2. Física básica de bilas: movimento com atrito, colisões bila×bila e bila×cenário, e detecção de bila totalmente fora do triângulo. (_simulação de movimento/atrito/colisão; a bila fica onde parou_)  
3. Mecânica de conquista / turnos (Clássico Triângulo): apostas de 1–6 bilas, disputa de ordem por proximidade da linha e regras de vez/conquista (quem empurra para fora conquista e joga de novo). (_gestão de turnos, detecção de conquista, regras de fim de partida_)

Modos incluídos na V1
---------------------
- Clássico Triângulo (principal): jogador vs IA; aposta de bilas; conquista/remoção do triângulo; vence quem coletou mais.  
- Velocidade: ticar todas as bilas antes do tempo ou antes de estourar o limite de jogadas; resultado = tempo gasto.  
- Tiro ao Alvo: uma bila é sorteada como alvo por tacada; uma tacada por alvo; sequências de acertos contadas até o primeiro erro.


Como executar 
--------------------------



Extras planejados 
----------------------------------------------------------
- Multiplayer Local .  
- Modos futuros: Dano, Pontuação, Distância (x1).  
- Coleção de skins desbloqueáveis (desbloqueio ao conquistar bilas).  
- Segundo cenário e mais níveis de IA.  
- Mais polimento em áudio e efeitos visuais.

  
Documentação 
----------------------------------------------------------
- O SGDD do jogo explicando mais detalhadamente suas mecanicas se encontra dentro da Pasta Docs



Créditos e assets de terceiros
------------------------------


Licença
-------




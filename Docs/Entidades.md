# Entidades do jogo — Bila Sniper (título provisório)

**Integrantes:** [Natanael Bizarria]

Checkpoint 2 · Programação para Jogos I

**Motor:** Godot 4.7.2 (GDScript). **Estado atual:** uma mesa 2D vista de cima, com bilas que se lançam por arrasto do mouse, colidem entre si e com as paredes, e um triângulo que detecta e conquista as bilas que saem. O gerenciador de partida (turnos), a IA e a linha de lançamento são **planejados**.
O texto e o código foi feito com auxilio de inteligência artificial, seguindo as regras do sgdd, e verificação humana
---

## 1. Entidades

- **Bila:** a mesma entidade serve para a bila de lançamento do jogador e para as bilas alvo (`RigidBody2D`).
- **Triângulo:** o desenho no chão que delimita as bilas apostadas e detecta quando elas saem (`Area2D`).
- **Parede:** os limites da mesa; as pedras do cenário entram depois (`StaticBody2D`).


## 2. Propriedades

| Entidade | Propriedades |
| --- | --- |
| Bila | posição, velocidade, raio, cor (futuramente skin), atrito (`linear_damp`), limite de parada, `em_movimento`, `conquistada` |
| Triângulo | posição, lado, pontos do polígono, lista de bilas dentro |
| Parede | posição e forma de colisão |

## 3. Comportamentos

| Entidade | Comportamentos |
| --- | --- |
| Bila | a física move e quica; o atrito a desacelera; abaixo do limite de velocidade ela para de vez; atualiza `em_movimento` e emite o sinal `parou`; recebe um impulso ao ser lançada; se desenha; some com fade quando conquistada e parada |
| Triângulo | detecta quando uma bila entra e quando sai por completo e emite `bila_saiu`; calcula as posições das bilas apostadas; se desenha |
| Parede | nenhum (é estática); só bloqueia e faz as bilas quicarem |

## 4. Colisões

| Quem | Com quem | O que acontece |
| --- | --- | --- |
| Bila | Bila | colisão elástica; empurra a outra |
| Bila | Parede | quica |
| Bila | Triângulo | não colide; o triângulo só detecta a sobreposição e avisa quando a bila sai por completo |

**A reação é a mesma para todos os pares?** A física é igual para todas as bilas. O que muda é a **regra**, que fica fora da colisão: uma bila alvo que sai do triângulo é conquistada, enquanto a bila de lançamento do jogador pode sair sem ser conquistada.

## 5. Comunicação

Por enquanto, quem faz a ligação entre as entidades é a **mesa** (a cena principal, que cria tudo e guarda a contagem). As entidades avisam o que aconteceu por **sinais** do Godot e não se chamam entre si.

- Mesa → Bila: **direto** (a mesa chama `lancar()` na bila do jogador).
- Bila → Mesa: **por sinal** (`parou`); a mesa também lê `em_movimento` de todas as bilas para saber se a jogada acabou.
- Triângulo → Mesa: **por sinal** (`bila_saiu`); a mesa marca a bila como conquistada e soma na contagem.
- Bila ↔ Bila e Bila ↔ Parede: não se comunicam; só a física do motor atua.



## 6. Falsas entidades

- Contagem de bilas coletadas (variável da mesa, ainda sem entidade própria).
- A mira (linha desenhada enquanto o jogador arrasta).
- O fundo de areia e o contador na tela (desenhados pela mesa).
- 
- 
## 7. Repetições

- **Bila de lançamento e bila alvo** são a mesma classe (`Bila`); só mudam a cor e quem a lança.
- **As quatro paredes** são o mesmo tipo de corpo estático, mudando só a posição e o tamanho.

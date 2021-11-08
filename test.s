.text
main:
  lui   a0, %hi(.destination)
  addi  a0, a0, %lo(.destination)
  lui   a1, %hi(.source)
  addi  a1, a1, %lo(.source)
  # sua solucao
  # endereco base de destination esta em a0
  # endereco base de source esta em a1
        
  add t0, a0, zero  # inicializacao ponteiro auxiliar t0 que vamos incrementar para percorrer a string de destination
  add t1, a1, zero  # inicializacao ponteiro auxiliar t1 que vamos incrementar para percorrer a string de source

  L1:
    lbu  t2, 0(t1)          # carrega em t2 o caracter atual que vamos verificar para sair do loop
     sb  t2, 0(t0)          # joga o caracter para o destination em memoria
    beq  t2, zero, L1_exit  # if t2 == '\0' vai para exit
    addi t1, t1, 1          # caso t2 nao seja '\0', incremento meu ponteiro em source para a proxima posicao
    addi t0, t0, 1          # caso t2 nao seja '\0', incremento meu ponteiro em destination para a proxima posicao
    j L1
  L1_exit:
    addi t0, t0, 1
    sb   zero, 0(t0)
    
    # addi t0, zero, 3      # Utilizei apenas para verificar a string de saida esperada: MC732 is life
    # ecall

.data
.destination:
  .word 0xFFFFFFFF
  .word 0xFFFFFFFF
  .word 0xFFFFFFFF
  .word 0xFFFFFFFF
.source:
  .word 0x3337434d
  .word 0x73692032
  .word 0x66696c20
  .word 0x00002e65
.data

#num1: .word 0x1001
#num2: .word 0x1002
#num3: .word 0x1003
#num2: .byte 0x1002
#num3: .half 0x1003
nota1: .byte 0x10
nota2: .byte 0x20
#media: .byte 0x00
end_media: .word 0x10010010

.text
#la $t0,num1    #carrega o endereço base
#lw $t1,0($t0)  #carrega o conteudo do end. base
#lw $t2,4($t0)  #carrega o conteudo do end. base deslocado de 4 posições
#lw $t3,8($t0)  #carrega o conteudo do end. base deslocado de 8 posições

#lw $t1,num1
#lb $t2,num2
#lh $t3,num3

lb $t1,nota1
lb $t2,nota2
add $t3,$t1,$t2
div $t4,$t3,2
la $t5,end_media

#sb $t4,end_media
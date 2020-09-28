       IDENTIFICATION DIVISION.
       PROGRAM-ID.  CLIENTES.
      ******************************************************************
      * OBJETIVO:  SISTEMA DE GESTAO DE CLIENTES
      * AUTHOR  :  EDWIN PEREIRA OLIVEIRA LIMA
      ******************************************************************
      ******************************************************************
       ENVIRONMENT DIVISION.
      ******************************************************************
      ******************************************************************
       DATA DIVISION.
      ******************************************************************
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
      *-----------------------------------------------------------------
       77 WRK-OPCAO  PIC X(1).
       77 WRK-TITULO PIC X(29) VALUE 'SISTEMA DE GESTAO DE CLIENTES'.
       77 WRK-MODULO PIC X(25).
       77 WRK-TECLA PIC X(1).

      *-----------------------------------------------------------------
       SCREEN SECTION.
      *-----------------------------------------------------------------
       01 TELA.
            05 LIMPA-TELA.
                10 BLANK SCREEN.
      * COMANDO PARA LIMPAR ATE O FINAL DA LINA (END 0F LINE) EOL
      * PIC X(20) ESTA DEFININDO A TAMNAHO DA TEXTO DA BARRA 20 POSICOES
                10 LINE 01 COLUMN 01 PIC X(29) ERASE EOL
      * PROPRIEDADE PARA COR DE FUNDO DA BARRA
                   BACKGROUND-COLOR 3.
      * PROPRIEDADE PARA COR DE FUNDO DO TEXTO TITULO FORCANDO TER MESMA COR DA BARRA
                10 LINE 01 COLUMN 45 PIC X(29)
                   BACKGROUND-COLOR 3  FOREGROUND-COLOR 0
                              FROM WRK-TITULO.

      * PROPRIEDADES DA BARRA DE MODULOS
                10 LINE 02 COLUMN 01 PIC X(25) ERASE EOL
                   BACKGROUND-COLOR 1 FROM WRK-MODULO.


      * OPCOES DE MENU
       01 MENU.
            05 LINE 07 COLUMN 15 VALUE '1 - INCLUIR'.
            05 LINE 08 COLUMN 15 VALUE '2 - CONSULTAR'.
            05 LINE 09 COLUMN 15 VALUE '3 - ALTERAR'.
            05 LINE 10 COLUMN 15 VALUE '4 - EXCLUIR'.
            05 LINE 11 COLUMN 15 VALUE '5 - RELATORIO'.
            05 LINE 12 COLUMN 15 VALUE 'X - SAIR'.
            05 LINE 13 COLUMN 15 VALUE 'OPCAO......: ' .
            05 LINE 13 COLUMN 28 USING WRK-OPCAO.
      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************
       0001-PRINCIPAL SECTION.
            PERFORM 1000-INICIAR.
            PERFORM 2000-PROCESSAR.
            PERFORM 3000-FINALIZAR.
            STOP RUN.

       1000-INICIAR.
            DISPLAY TELA.
            ACCEPT MENU.
       2000-PROCESSAR.
      * SWITCH DO COBOL VERIFICA QUAL OPCAO FOI ESCOLHIDA PELO USUARIO.
            EVALUATE WRK-OPCAO
              WHEN 1
               PERFORM 5000-INCLUIR
              WHEN 2
                CONTINUE
              WHEN 3
                CONTINUE
              WHEN 4
                CONTINUE
              WHEN 5
                CONTINUE
              WHEN OTHER
                IF WRK-OPCAO NOT EQUAL 'X'
                    DISPLAY 'ENTRE COM OPCAO CORRETA'
                END-IF
            END-EVALUATE.


       3000-FINALIZAR.
             CONTINUE.

       5000-INCLUIR.
             MOVE 'MODULO - INCLUSAO ' TO WRK-MODULO.
             DISPLAY TELA.
             ACCEPT WRK-TECLA AT 1620.

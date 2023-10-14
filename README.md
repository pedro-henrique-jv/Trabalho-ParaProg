# Solucionador de Sudoku em Haskell

Neste código, há a implementação de um solucionador de Sudoku em Haskell, que lê um tabuleiro de um arquivo, resolve o quebra-cabeça e exibe a solução, se existir. O código utiliza funções para manipular o tabuleiro, verifica as regras do Sudoku e emprega recursão para encontrar a solução.

## Screencast

https://drive.google.com/file/d/1VREfhPQL5bA_EJFvVvCmlzVlEmAB3M-Y/view?usp=drive_link

## Executando o código

1. Prepare um arquivo de texto com o tabuleiro de Sudoku, onde os números são separados por espaços. Certifique-se de que o arquivo esteja formatado corretamente.
2. Carregue o código no Repl.it ou no ambiente de desenvolvimento Haskell de sua escolha.
3. Certifique-se de que o arquivo com o tabuleiro esteja disponível para leitura no mesmo diretório em que o código está sendo executado.
4. Pressione o botão "Run" no Repl.it ou execute o código na sua IDE Haskell.
5. O resultado, que pode ser a solução do Sudoku ou uma mensagem informando que não há solução, será exibido no console.

## Processo de Desenvolvimento

- O primeiro passo foi definir a estrutura de dados que representaria o tabuleiro. Optou-se por uma lista de tuplas, onde cada tupla contém um valor e a posição correspondente (linha, coluna). Isso facilita o manuseio do tabuleiro.

- As funções de escrita no tabuleiro, inserção de números e validação das regras foram desenvolvidas. 

- O desenvolvimento das funções para resolver o tabuleiro foi a parte mais desafiadora. Diferentes abordagens foram testadas, e, eventualmente, ferramentas de geração de código foram usadas para criar essa parte específica. 

## Referências

Aqui estão algumas das fontes utilizadas como referência durante o desenvolvimento do código:

- [Input and Output in Haskell](http://haskell.tailorfontela.com.br/input-and-output)
- [Leitura e Escrita de Dados em Haskell](https://kuniga.wordpress.com/2012/06/17/leitura-e-escrita-de-dados-em-haskell/)
- [Ler arquivo txt em Haskell](https://www.portugal-a-programar.pt/forums/topic/39476-ler-arquivo-txt/)
- [Função `unwords` em Haskell](https://zvon.org/other/haskell/Outputprelude/unwords_f.html)
- [Função `unlines` em Haskell](https://zvon.org/other/haskell/Outputprelude/unlines_f.html)
- [Expressões `case` em Haskell](https://zvon.org/other/haskell/Outputsyntax/caseQexpressions_reference.html)
- [Função `any` em Haskell](https://zvon.org/other/haskell/Outputprelude/any_f.html)
- [Recursividade em Haskell](https://pt.wikibooks.org/wiki/Haskell/Recursividade)
- [Backtracking em Algoritmos](https://pt.stackoverflow.com/questions/103184/o-que-%C3%A9-um-algoritmo-backtracking)
- [Backtracking - Wikipedia](https://pt.wikipedia.org/wiki/Backtracking)
- [Documentação da biblioteca Maybe em Haskell](https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Maybe.html)
- [Maybe - Haskell](https://wiki.haskell.org/Maybe)

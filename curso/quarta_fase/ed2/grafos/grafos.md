# Grafos

## Introdução

- A Teoria dos Grafos proporciona uma ferramenta poderosa para construção de modelos e resolução de problemas. Estes problemas abrangem análise do caminho crítico, logística, fluxo de redes, química, 
análise combinatória, linguística, etc. 
- Do ponto de vista da matemática os grafos estão relacionados a teoria dos conjuntos, matrizes, análise combinatória, probabilidade, entre outros.
- A Teoria dos Grafos possui uma variedade de aplicações e baseia-se na ideia de pontos ligados por linhas.
- A Teoria dos Grafos surgiu de forma independente em diversas áreas do conhecimento, mas pode ser considerada uma área da matemática aplicada. A menção mais antiga ao assunto ocorreu em 1736, em 
um trabalho realizado por Euler. O problema baseava-se em um desenho cujas linhas devem ser percorridas sem que se tire o lápis do papel e sem passar duas vezes sobre a mesma linha.     
- No século XIX Kirchhoff estudou a relação da teoria dos grafos com as redes elétricas, e Cayley a relação com a química orgânica.   
   
## O que são grafos?

> Definição Matemática

- Seja `G(V,E)` um grafo, onde `V` é um conjunto finito e não vazio e `E` um conjunto de pares ordenados `(E1,E2)`, aonde `E1` e `E2` pertencem ao conjunto `V`. 
  -*

- Os **elementos** do conjunto `V` de um grafo são denominados *vértices*, *pontos* ou *nós*. Os pares ordenados do conjunto `E` são demominados *arestas*, *linhas* ou *arcos* do grafo. A **ordem** de um grafo é determinada pela quantidade de nós que o formam. 74444444444444444444444444444444444444444444444444 

- Duas arestas que incidem sobre o mesmo vértice são ditas *adjacentes*. Se existem duas arestas ligando os mesmos vértices, elas são chamadas paralelas. Se o grafo possui laços e/ou arestas paralelas, ele é chamado multigrafo, caso contrário é um grafo simples. 
  

- Um grafo simples `G` é dito complementar de outro grafo qualquer, se possuir o mesmo conjunto de vértices, de tal forma que se dois vértices são adjacentes em `G` não podem ser em `H`. 

- Um grafo que possui orientação de suas arestas é chamado `grafo dirigido` ou `dígrafo`. Caso contrário, o grafo é `não dirigido`. Em um grafo não dirigido, existe uma representação binária simétrica do grafo, ou seja, em um grafo não dirigido uma aresta que liga os vértices `A` e `B` pode ser representada pelo par ordenado `(A,B)` ou `(B,A)`. O mesmo não acontece com os dígrafos.

>Simplex: tráfego em um único sentido.
Half-duplex: nos dois sentidos, mas um de cada vez.
Full-duplex: nos dois sentidos simultaneamente.

- Dois grafos são isomorfos se for possível coincidir seus vértices, preservando as adjacências das arestas. 
 - Considerar o grau dos vértices e os conjuntos `V` e `E  `.

- Um grafo `G` é um **subgrafo** de um grafo `H` se o conjunto de vértices e o conjunto de arestas do grafo `G` forem subconjuntos do grafo `H`. 

- Define-se o grau de um vértice pelo número de arestas incidentes a ele. Um vértice que não possui arestas incidentes (grau 0) é chamado **isolado**. Um vértice que possui uma única aresta incidente (grau 1) é chamado **pendente**. 

- Um grafo é chamado `rotulado` se os seus vértices e/ou arestas possuírem rótulos. Caso contrário são chamados `não rotulados`.  
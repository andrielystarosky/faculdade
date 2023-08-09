# Representação de um grafo

## Matriz de Adjacência

- Preenchimento *grafo simples*
  - 1: se houver adjacência entre os vértices.
  - 0: se não houver adjcência entre os vértices
- Preenchimento *Multigrafo*
  - N: onde houver *N* representa a quantidade de arestas paralelas
  - 1: na diagonal principal, se houver laços

> Se o gráfico possui 5 vértices, sua matriz será `matriz quadrada de ordem 5`.

> Grafo não dirigio: o que marcar em  `(A,B)`, também deve marcar em `(B,A)`

> A soma da linha demonstra o grau do vértice.

> A soma da triangular superior ou inferior demontra a quantidade de arestas (em multigrafo, soma-se a diagonal principal também)

> Soma da linha = 0 -> vértice isolado

> Soma da linha = 1 -> vértice pendente

> Custo = aresta
> Distância = soma das arestas
> Caminho: rota de arestas percorridas

## Matriz de Incidência

## Matriz de Custos

> Determina custo de um ponto ao outro 

## Lista de Arestas

## Estrutura de Adjacência
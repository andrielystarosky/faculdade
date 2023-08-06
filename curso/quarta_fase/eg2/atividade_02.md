# Atividade 2

## Workshop Métodos Ágeis

> Testes de aceitação
- Também conhecidos como testes de aceitação do usuário (UAT - User Acceptance Testing), são um tipo de teste realizado para verificar se um sistema ou software atende aos requisitos e expectativas dos usuários antes de ser liberado para produção ou implantação. É uma fase crucial no processo de desenvolvimento de software, onde os stakeholders, incluindo os usuários finais, têm a oportunidade de avaliar o produto final e fornecer feedback sobre sua adequação ao uso pretendido.
- Eles podem ser conduzidos de várias maneiras, incluindo testes manuais ou automatizados, simulações de cenários reais ou interações com a interface do usuário. O objetivo dos testes de aceitação é garantir que o software funcione conforme esperado, permitindo que o cliente ou usuário final valide se o produto atende às suas necessidades e expectativas antes de ser colocado em produção.

- Os testes de aceitação geralmente ocorrem após os testes de sistema terem sido concluídos, garantindo que o software tenha passado por verificações internas e correções de bugs. A finalidade dos testes de aceitação é garantir que o produto atenda aos seguintes critérios:

1. Atender aos requisitos do usuário: onde é verificado se o software realiza todas as tarefas e funções esperadas, conforme descrito nas especificações e requisitos fornecidos.

2. Usabilidade: onde é avaliada a facilidade de uso, a interface do usuário e a experiência geral do usuário ao interagir com o software.

3. Integração: onde é verificada a integração adequada do software com outros sistemas ou componentes, caso seja aplicável.

4. Desempenho: onde é assegurado que o software funcione dentro dos limites aceitáveis de velocidade e desempenho, mesmo sob carga ou condições estressantes.

5. Conformidade: onde é verificado se o software está em conformidade com as políticas, regulamentos e padrões estabelecidos pela organização ou setor.

> Como funcionam os testes de aceitação automatizados?

1. Definição de Requisitos e Critérios de Aceitação: Antes de iniciar os testes de aceitação, é importante ter uma compreensão clara dos requisitos do sistema e dos critérios de aceitação. Esses critérios descrevem como o software deve se comportar para ser considerado aprovado.
2. Criação de Casos de Teste: Com base nos requisitos e critérios de aceitação, são elaborados casos de teste. Cada caso de teste é um cenário que descreve uma ação do usuário e uma expectativa de resultado. Esses casos de teste formam uma suíte de testes que será executada automaticamente.
3. Automação dos Testes: Os testes de aceitação são controlados por meio de ferramentas de automação de teste. Essas ferramentas permitem a criação de scripts ou cenários que simulem a interação do usuário com o software. As ações do usuário, como clicar nos botões, preencher formulários ou navegar pelas telas, são programadas nos scripts.
4. Execução dos Testes: A suíte de testes controlados é executada em um ambiente controlado, muitas vezes em uma máquina dedicada ou em um ambiente de integração contínua. Os scripts são executados como ações do usuário conforme definido nos casos de teste e verificam se os resultados correspondem às expectativas.
5. Verificação dos Resultados: Durante a execução dos testes, as ferramentas de automação comparam os resultados reais com os resultados esperados, conforme definidos nos casos de teste. Se houver discrepâncias, um relatório de falhas é gerado, indicando quais testes falharam e quais partes do software estão com problemas.
6. Relatórios e Feedback: Após a execução dos testes, são gerados relatórios que detalham os resultados dos testes. Esses relatórios são usados ​​pela equipe de desenvolvimento para identificar e corrigir os problemas encontrados. Se todos os casos de teste passarem com sucesso, o software será mais próximo de ser considerado apto para lançamento.
7. Iteração e Ajustes: À medida que os problemas são verificados, os testes de controlados são executados novamente para garantir que as correções não apresentem novos problemas. Esse processo de iterar e ajustar continua até que o software atenda aos critérios de aceitação.

> Automação

- A automação de testes de aceitação refere-se ao uso de ferramentas e scripts automatizados para realizar tais testes de um software. Ao invés de realizar os testes manualmente, a automação utiliza programas de software para executar casos de teste, comparar resultados esperados com resultados reais e reportar os resultados automaticamente.

- O processo de automação dos testes de aceitação oferece várias vantagens, como maior eficiência, cobertura mais abrangente dos casos de testes, reutilizaçao dos testes, antecipar a identificação de problemas e maior qualidade final do software.

> Postman

- Para automatizar testes de aceitação, são utilizadas ferramentas de automação de testes que podem interagir com a interface do usuário do software, simular ações do usuário e verificar se o software se comporta conforme o esperado. 

O Postman é uma ferramenta popular que permite testar, documentar e automatizar solicitações HTTP, incluindo testes de API. Ao usar o Postman para automação de testes de API, você pode criar coleções de testes que contêm várias solicitações HTTP, juntamente com as asserções (assertions) que validam as respostas das APIs.
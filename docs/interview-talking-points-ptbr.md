# SportsForYou — pontos de conversa para entrevista

Este roteiro transforma decisões documentadas em exemplos de entrevista. O showcase é uma visão pública e sanitizada; não contém o código-fonte completo nem dados operacionais privados.

## Resumo em 30 segundos

> O SportsForYou é uma plataforma modular que conecta atletas, eventos, comunidades, organizadores, parceiros e marcas. Sou responsável pelo desenho, pela arquitetura e pela construção do produto. Um exemplo concreto da arquitetura é separar o processamento assíncrono da aplicação web: o `JobCenter` roda como um serviço .NET Worker próprio, com container, health check e ciclo operacional documentados.

## Case: processamento assíncrono em serviço separado

### Cenário e papel

- A aplicação reúne módulos web e também executa tarefas assíncronas.
- Sou responsável pelo desenho, pela arquitetura e pela construção do produto.

### Desafio e decisão

- **Questão arquitetural:** como representar e operar tarefas em segundo plano sem confundi-las com o ciclo da aplicação web?
- **Decisão documentada:** manter os módulos de negócio na aplicação web e executar os jobs no `Sport.Worker.JobCenter`, um serviço .NET Worker separado.
- O Worker possui container, health check e ciclo operacional próprios no Docker Compose.

### Funcionamento e consequência técnica

O deploy documentado publica a Sport.UI e o JobCenter como serviços distintos. O Worker pode ser observado por seu próprio health check e tem um ciclo de operação separado. Isso torna explícita a fronteira entre requisições web e processamento assíncrono.

**Princípio arquitetural:** componentes com responsabilidades e ciclos de execução diferentes podem ter fronteiras operacionais explícitas. Essa separação também acrescenta um serviço que precisa ser configurado e acompanhado; não implica, por si só, aumento medido de escala ou disponibilidade.

**Aprendizado técnico que o case evidencia:** separar processos exige também desenhar como cada serviço é publicado, observado e recuperado. Uma fronteira arquitetural útil precisa ser operável, não apenas visível no diagrama.

### Resposta curta sugerida

> Na plataforma, mantive os módulos de negócio na aplicação web e separei o processamento assíncrono no JobCenter, implementado como um .NET Worker. A decisão deixa o ciclo operacional do Worker explícito: ele tem container e health check próprios. O trade-off é operar mais um serviço, então a separação precisa vir acompanhada de observabilidade e publicação coordenada. O showcase documenta essa fronteira, mas não atribui a ela ganhos quantitativos de disponibilidade ou desempenho.

## Amplitude de engenharia demonstrada

- **Arquitetura e backend:** aplicação modular em C#/.NET 10, ASP.NET Core MVC/Razor e projetos de domínio.
- **Dados:** SQL Server como provider de produção; MySQL aparece somente nos cenários de compatibilidade documentados.
- **Qualidade:** xUnit, Playwright, axe-core e quality gates descritos no showcase.
- **Produto web:** acessibilidade, SEO, áreas públicas e fluxos autenticados, conforme o escopo documentado.
- **Operação:** Docker Compose, Ubuntu Server, Azure Pipelines e health checks.
- **IA aplicada à engenharia:** fluxos assistidos para documentação, análise de logs e planejamento arquitetural, conforme documentado no showcase.

## Perguntas que podem aprofundar o case

1. Quais responsabilidades ficam na aplicação web e quais pertencem ao Worker?
2. Como o Worker é publicado e como seu estado de saúde é observado?
3. Que dados, limites ou contratos precisam atravessar a fronteira entre os serviços?
4. O que seria necessário medir antes de afirmar impacto de escala ou disponibilidade?

Responda às perguntas sobre contratos e resultados somente com fatos que possam ser compartilhados e demonstrados.

## Como apresentar o repositório

Este repositório não é o código-fonte completo do produto. Ele apresenta arquitetura, decisões e exemplos sanitizados, sem credenciais, dados de usuários, regras privadas, endpoints internos ou configuração sensível.

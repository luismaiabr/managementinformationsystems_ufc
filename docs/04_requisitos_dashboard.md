# Requisitos para Dashboard (BI)

Este documento define os requisitos de forma concisa e objetiva para a implementação dos painéis gerenciais (dashboards) do sistema, orientando o desenvolvedor na construção das visualizações (ex: Power BI, Tableau).

## 1. Processo de Suporte às Universidades

### Requisitos Funcionais (RF)
* **[RF-01] Visão de Tempo Médio de Resolução:** O painel deve exibir o tempo médio de resolução de chamados, visualmente segmentado por "Falha de Usuário" e "Bug".
* **[RF-02] Visão de Cumprimento de Prazo (SLA):** O painel deve apresentar a porcentagem (taxa de sucesso) de chamados que foram resolvidos dentro do prazo estipulado.
* **[RF-03] Visão de Volume de Chamados:** O painel deve apresentar o volume histórico de chamados, permitindo analisar a tendência de aberturas e resoluções ao longo dos meses.

### Regras de Negócio (RN)
* **[RN-01] Prazo - Falha de Usuário:** Considera-se no prazo a resolução de falhas de usuário ocorrida em até 48 horas.
* **[RN-02] Prazo - Bug:** Considera-se no prazo a correção de bugs ocorrida em até 3 dias úteis.
* **[RN-03] Meta de SLA de Suporte:** A meta de sucesso a ser destacada visualmente para chamados no prazo é de **80%**.

## 2. Processo de Ciclo de Vida do Contrato

### Requisitos Funcionais (RF)
* **[RF-04] Visão de SLA de Assinaturas:** O painel deve calcular e exibir a porcentagem de contratos que tiveram o ciclo de assinatura totalmente concluído no prazo.
* **[RF-05] Visão de Tempo Médio de Efetivação:** O painel deve exibir o tempo médio transcorrido (em dias) entre a criação do contrato no sistema e a assinatura final de todas as partes.
* **[RF-06] Monitoramento de Contratos Ativos:** O painel deve listar o quantitativo atual de contratos ativos, agrupados por Universidade (IES).

### Regras de Negócio (RN)
* **[RN-04] Prazo de Assinatura de Contratos:** O ciclo ideal exige que o contrato seja assinado por todas as partes em até 7 dias após sua criação.
* **[RN-05] Meta de SLA de Contratos:** A meta de sucesso a ser destacada visualmente para assinaturas concluídas no prazo é de **85%**.

## 3. Requisitos Globais e Interatividade

### Requisitos Funcionais (RF)
* **[RF-07] Filtros Globais (Dimensões):** A dashboard deve permitir o cruzamento e filtro de dados por, no mínimo, **Período (Mês/Ano)** e **Universidade**.
* **[RF-08] Cruzamento de Fontes:** As métricas devem utilizar a referência do mapeamento de dados (documento 03) para extrair os indicadores a partir de colunas estruturadas e atributos no JSONB.

### Requisitos Não Funcionais (RNF)
* **[RNF-01] Hierarquia de Informação Visual:** Indicadores chave (KPIs de tempo e porcentagem) devem ser exibidos em formato de cartão no topo da tela para rápida leitura executiva.
* **[RNF-02] Compatibilidade:** A modelagem dos dados consumidos deve ser homologada para plataformas padrão de BI de mercado (Power BI, Tableau, Metabase).
* **[RNF-03] Desempenho:** A consulta aos campos não estruturados (JSONB) via banco relacional deve ser otimizada para não comprometer o tempo de carregamento do painel.

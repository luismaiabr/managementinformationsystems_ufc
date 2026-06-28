# 3. Detalhamento dos Gráficos

Com base nas métricas e processos mapeados (Suporte e Contratos), a escolha visual para os dados deve ser clara e acionável.

## 3.1 Gráficos da Visão Geral
* **Gráfico de Linha (Evolução Temporal):** 
  * *Dado:* Evolução mensal de contratos ativos.
  * *Por que:* Ideal para mostrar tendências ao longo do tempo.
* **Gráfico de Rosca / Donut:** 
  * *Dado:* Status geral dos contratos (Pendente, Ativo, Encerrado, Cancelado).
  * *Por que:* Facilita a visualização da proporção de cada status na base atual.

## 3.2 Gráficos de Suporte (Chamados)
* **Gráfico de Barras Empilhadas:**
  * *Dado:* Volume de chamados por Universidade, dividido por tipo (Bug vs Falha de Usuário).
  * *Por que:* Permite comparar o volume total de chamados entre IES e a composição de problemas.
* **Gráfico de Velocímetro ou Gauge (Opcional) / KPI Target:**
  * *Dado:* % de chamados resolvidos no prazo (Meta: 80%).
  * *Por que:* Mostra claramente quão perto estamos da meta estipulada.

## 3.3 Gráficos de Contratos de Estágio
* **Gráfico de Funil:**
  * *Dado:* Cadeia de assinaturas (Criado -> Assinatura Aluno -> Supervisor -> Empresa -> Efetivado).
  * *Por que:* Identifica facilmente em qual etapa os contratos estão "presos" (gargalo de 7 dias).
* **Gráfico de Barras Horizontais:**
  * *Dado:* Top 10 Empresas com mais contratos ativos.
  * *Por que:* Ranking visual simples e rápido de ler.
* **Gráfico de Dispersão (Scatter Plot):**
  * *Dado:* Relação entre o tempo de assinatura (dias) e o volume de aditivos/relatórios.
  * *Por que:* Útil para análises avançadas de comportamento.

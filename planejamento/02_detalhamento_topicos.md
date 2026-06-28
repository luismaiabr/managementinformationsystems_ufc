# 2. Detalhamento de Cada Tópico

## 2.1 Visão Geral (Overview)
A página de Visão Geral servirá como ponto de entrada da diretoria e coordenadores. 
- **Big Numbers Integrados:** Resumo rápido dos KPIs de Suporte e Contratos.
- **Alertas Críticos:** Contratos com SLA de assinatura estourado ou Bugs não resolvidos em 3 dias.

## 2.2 Aba de Suporte (Chamados)
Focada em garantir a continuidade da plataforma para as Universidades.
- **Métricas:** 
  - Chamados abertos vs resolvidos.
  - SLA (48h para falhas, 3 dias para bugs).
- **Visões:**
  - Detalhamento de volume por universidade.
  - Tabela com chamados críticos em aberto.

## 2.3 Aba de Contratos de Estágio
Focada no core business: gerir o ciclo de vida dos contratos.
- **Métricas:**
  - Volume de registros inseridos na tabela `contracts`.
  - Controle de SLAs da cadeia de assinaturas (7 dias).
- **Visões:**
  - Monitoramento de prazos de assinatura.
  - Volume de aditivos solicitados (baseados na tabela `reports`).
  - Rescisões e cancelamentos (`status` = cancelado/encerrado, logs em `contract_activity_logs`).

## 2.4 Aba de Convênios (Agreements)
Focada na visão macro institucional (Tabela `agreements`).
- **Métricas:**
  - Convênios ativos vs inativos.
- **Visões:**
  - Relação Universidade-Empresa.

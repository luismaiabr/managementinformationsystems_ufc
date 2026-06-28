# Processo 2: Ciclo de Vida do Contrato de Estágio

## 1. Visão Geral
Este documento descreve o processo **Ciclo de Vida do Contrato de Estágio**. A descrição foi reconciliada e ajustada de acordo com as entidades e estruturas reais do banco de dados relacional e campos JSONB.

### 1.1 Propósito
Gerenciar o ciclo completo do contrato de estágio (da criação ao encerramento) controlando a cadeia de assinaturas, prazos, aditivos (reports/logs) e rescisões/cancelamentos.

### 1.2 Indicadores e Metas
* **Porcentagem de contratos com assinatura concluída no prazo:** meta de 85%.
* **Tempo médio entre criação e contrato assinado:** meta de até 7 dias.
* **Número de contratos ativos por universidade:** Métrica de acompanhamento baseada nas tabelas `contracts` e associações com `ies`.

---

## 2. Matriz SIPOC Ajustada (Reconciliação com Banco de Dados)

| Fornecedores (Suppliers) | Entradas (Inputs) | Processo (Process) | Saídas (Outputs) | Clientes (Customers) |
| :--- | :--- | :--- | :--- | :--- |
| Universidade | Dados do aluno, empresa e supervisor (Estruturados como JSONB na tabela `contracts`) | Criação do estágio na plataforma (Registro em `contracts`) | Contrato gerado (Status inicializado) | Aluno estagiário |
| Aluno estagiário | Datas de início e fim | Aprovação do estágio | Contrato aprovado (Status atualizado) | Universidade |
| Empresa contratante | Ordem de assinatura definida (Logada em sistema/`envelopes`) | Cadeia de assinaturas (aluno -> Supervisor -> empresa) | Contrato assinado por todas as partes (Status 'ativo') | Empresa contratante |
| Supervisor da IES | Solicitação de aditivo ou cancelamento | Monitoramento de prazos de assinatura | Relatório de contratos ativos (Acesso via `reports` e base) | Supervisor |
| Equipe startup | Link de assinatura reenviado | Gestão de aditivos e rescisões (Tabelas e Logs) | Histórico de alterações (Atualização de JSONB e status) | Universidade |
| - | - | Cancelamento ou encerramento (Update na tabela `contracts`) | Contrato encerrado ou aditado (Status final) | Aluno / Empresa |

---

## 3. Descrição do Fluxo (Ajustado)

1. **Início do Processo:** O Coordenador de estágios recebe a solicitação de estágio.
2. **Geração do Contrato:** O sistema insere um registro na tabela `contracts`, salvando os dados vitais (`company_legal_info`, `intern`, `internship`) em formato JSONB, o que proporciona flexibilidade. O status inicial é definido (ex: *pending*).
3. **Assinatura (7 dias):**
    * Os links são enviados às partes.
    * O sistema verifica as assinaturas (envelope de assinaturas eletrônicas).
    * Se houver assinaturas pendentes, reenvia-se o link.
4. **Efetivação:** Concluídas as assinaturas, o contrato é registrado como *Ativo* no banco (campo `status` atualizado em `contracts`).
5. **Alterações e Aditivos:** Durante o ciclo, podem ser requeridos aditivos ou relatórios. Esses eventos são rastreados pela tabela `reports` associada via `contract_id` e pelos logs de atividade de contrato.
6. **Encerramento / Rescisão:** O contrato pode ser encerrado ao fim do período, ou cancelado prematuramente, gerando um update de `status` e, se pertinente, registro de deleção lógica (`deleted_at`).

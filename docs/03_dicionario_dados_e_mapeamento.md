# Dicionário de Dados e Mapeamento

## 1. Visão Geral do Mapeamento

Este documento estabelece o mapeamento (de-para) entre as necessidades de negócio levantadas no PDF "Levantamento de Processos" (SIG.pdf) e a modelagem física do banco de dados (presente no diretório `database/models`).

O levantamento original trazia simplificações conceituais, tratando os dados do estágio de forma unificada. No entanto, a modelagem definitiva implementa uma abordagem híbrida robusta (utilizando colunas relacionais com campos `JSONB` para armazenamento não-estruturado) garantindo maior flexibilidade.

---

## 2. De-Para Lógico (Processos vs. Modelagem)

| Elemento PDF (Processo) | Entidade de Banco de Dados (`tabela`) | Justificativa e Adaptação Lógica |
| :--- | :--- | :--- |
| Dados do Estágio (Aluno, Empresa, Supervisor, Datas) | `contracts` (colunas `intern`, `company_legal_info`, `internship` tipo JSONB) | Em vez de tabelas relacionais rigorosas para cada entidade do contrato, optou-se por utilizar campos JSONB na tabela de contratos. Isso permite absorver as variações nas informações exigidas pelos contratos sem necessitar de contínuas alterações no schema do banco. |
| Status do Contrato (Ativo, Pendente, etc) | `contracts` (coluna `status` tipo `text`) | Fundamental para controlar as etapas do BPMN (Assinatura Pendente -> Concluída -> Encerrado/Cancelado). O banco possui índice neste campo (`contracts_status_idx`) garantindo buscas rápidas. |
| Relatórios / Aditivos | `reports` (associado via `contract_id`) | Os aditivos e acompanhamentos (student_report, company_report) também utilizam JSONB, referenciando `contracts.id`. Trata as entregas processuais (relatórios de estágio) mapeadas no ciclo de vida. |
| Relação Universidade/Empresa | `agreements` (Convênios) | Representa o convênio formal entre a Instituição de Ensino Superior (`ies_id`) e a Empresa (`company_id`). O PDF foca no contrato de estágio em si, mas a base de dados sustenta que um contrato obedece ao convênio gerido aqui. |

---

## 3. Dicionário de Dados (Principais Entidades)

### Tabela: `contracts`
Armazena a entidade central do "Ciclo de Vida do Contrato".
* `id` (uuid, PK): Identificador único do contrato.
* `status` (text): Controle do fluxo do processo (Ex: pendente, ativo, encerrado, cancelado).
* `company_legal_info` (jsonb): Detalhes jurídicos da empresa concedente do estágio no momento da assinatura.
* `intern` (jsonb): Informações do aluno/estagiário.
* `internship` (jsonb): Detalhes específicos do plano de estágio, carga horária e datas.
* `created_at` / `updated_at` / `deleted_at`: Metadados de rastreabilidade temporal.

### Tabela: `reports`
Armazena os relatórios e possíveis reflexos de aditivos de estágio atrelados a um contrato.
* `id` (uuid, PK): Identificador único do relatório.
* `contract_id` (uuid, FK): Referência obrigatória à tabela `contracts`.
* `report_number` (integer): Número sequencial do relatório/aditivo.
* `start_date` / `end_date` (date): Período abrangido pelo relatório.
* `student_report` / `company_report` (jsonb): Avaliações e informações submetidas pelas partes.
* `overall_status` (text): Status de aprovação do documento.

### Tabela: `agreements`
Gerencia os convênios institucionais, que formam o alicerce para a aceitação dos contratos.
* `id` (uuid, PK): Identificador único do convênio.
* `status` (text): Situação do convênio entre IES e Empresa.
* `ies` / `company` (jsonb): Snapshot de dados das partes.
* `ies_id` / `company_id` (uuid, FKs): Chaves estrangeiras para as tabelas dominó (`ies`, `company_legal_infos`).

---

## 4. Considerações de Rastreabilidade

* O uso intensivo de **JSONB** foi a principal adaptação frente ao levantamento clássico do PDF. Enquanto o PDF sugere um "cadastro" relacional padronizado, o sistema real utiliza *document stores* dentro do PostgreSQL, o que permite o versionamento instantâneo do contrato ("snapshot" no ato da criação) e torna o processo de negócio mais resiliente a mudanças nos formulários de cadastro.
* Os **logs de atividade** (`contract_activity_logs`, `agreement_activity_logs` mapeados via diretório SQL) garantem a rastreabilidade histórica exigida pelo "Problema Gerencial" (monitoramento de rescisões e assinaturas) citado no Processo 2, sem necessidade de poluir as tabelas principais.

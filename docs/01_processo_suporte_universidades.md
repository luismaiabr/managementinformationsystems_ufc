# Processo 1: Suporte às Universidades

## 1. Visão Geral
Este documento descreve o processo de **Suporte às Universidades** mapeado para o sistema SIG.

### 1.1 Propósito
Registrar, classificar e resolver chamados de suporte das universidades clientes, identificando se são falhas de usuário ou bugs, e garantindo a continuidade da plataforma.

### 1.2 Indicadores e Metas
* **Tempo médio de resolução:** até 48h (falha de usuário) e até 3 dias úteis (bug).
* **Porcentagem de chamados resolvidos no prazo:** meta de 80%.
* **Volume de chamados por universidade por mês:** Métrica de acompanhamento.

### 1.3 Stakeholders
* Equipe de suporte
* Time de tecnologia
* Coordenadores das universidades
* Alunos estagiários
* Supervisores
* Empresas contratantes

---

## 2. Matriz SIPOC

| Fornecedores (Suppliers) | Entradas (Inputs) | Processo (Process) | Saídas (Outputs) | Clientes (Customers) |
| :--- | :--- | :--- | :--- | :--- |
| Universidade cliente | Formulário de suporte preenchido | Abertura do chamado no sistema | Chamado registrado e classificado | Equipe de suporte |
| Equipe de suporte | Descrição do problema | Análise e classificação (falha ou bug) | Orientação ao usuário ou correção | Universidade cliente |
| Time de tecnologia | Histórico de chamados anteriores | Resolução pela equipe de suporte | Chamado encerrado | Time de tecnologia |
| - | - | Encaminhamento para tech (se bug) | Relatório de chamados por universidade | - |
| - | - | Resolução por alguém do time de tech e devolução ao suporte | Notificação de resolução enviada | - |
| - | - | Comunicação da resolução à universidade | - | - |

---

## 3. Descrição do Fluxo (BPMN)

1. **Início do Processo:** O fluxo começa quando a Universidade preenche o formulário de suporte (via ClickUp ou integração).
2. **Registro e Classificação:** O Analista de Suporte registra e classifica o chamado.
3. **Verificação de Falhas:** Verifica-se se há falhas.
    * Se **não tem falhas:** Notifica a Universidade.
    * Se **tem falhas:** Verifica-se o tipo de falha.
4. **Tratamento da Falha:**
    * **Falha do Usuário:** O Analista de Suporte resolve a falha e verifica a resolução.
    * **Bug:** O chamado é encaminhado à Equipe de T.I para correção do bug, respeitando o prazo de 3 dias úteis. Em seguida, a resolução é verificada pelo Suporte (prazo de 48h).
5. **Encerramento:** A Universidade é notificada, geram-se os relatórios de chamados e o processo é finalizado.

*Nota:* O fluxo de chamados ocorre de forma paralela aos dados do banco, conectando-se aos processos administrativos, mas sendo gerido em plataformas auxiliares de atendimento.

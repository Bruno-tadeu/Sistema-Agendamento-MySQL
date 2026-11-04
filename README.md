# Sistema-Agendamento-MySQL

Projeto da disciplina de **Modelagem de Banco de Dados**. Consiste em um banco de dados relacional para controlar os agendamentos e pagamentos de uma barbearia, criado em MySQL a partir de um dicionário de dados.

# Sobre o projeto

O sistema registra quem são os clientes e os barbeiros, quais serviços a barbearia oferece, quando cada atendimento acontece e como ele foi pago. O repositório contém:

- os scripts de criação do banco e das tabelas;
- dados fictícios de exemplo;
- 10 scripts de consulta e manipulação de dados (JOIN, agregação, filtros, e DML);
- 7 scripts para visualizar o conteúdo de cada tabela.

> Todos os dados inseridos (nomes, CPFs, telefones e e-mails) são **fictícios**, criados apenas para teste.

## Tecnologias
 
- MySQL 8
- MySQL Workbench
- brModelo (modelo conceitual)
## Modelo de dados
 
O banco `sistema_agendamentos` tem 7 tabelas:
 
| Tabela | Para que serve |
|---|---|
| `clientes` | Pessoas atendidas na barbearia |
| `colaboradores` | Barbeiros que realizam os atendimentos |
| `categorias_servico` | Grupos de serviço (Cabelo, Barba, Combos) |
| `servicos` | Serviços oferecidos, com duração e preço |
| `formas_pagamento` | Formas aceitas (Dinheiro, Pix, cartões) |
| `agendamentos` | Horário marcado de um cliente com um barbeiro para um serviço |
| `pagamentos` | Pagamentos de cada agendamento (pode haver mais de um) |
 
### Relacionamentos
 
- Uma **categoria** tem vários **serviços**.
- Um **cliente** pode ter vários **agendamentos**.
- Um **colaborador** pode atender vários **agendamentos**.
- Um **serviço** pode aparecer em vários **agendamentos**.
- Um **agendamento** pode ter vários **pagamentos** (por exemplo, pagamento parcelado).
- Uma **forma de pagamento** pode ser usada em vários **pagamentos**.
<!-- Se quiser, adicione aqui a imagem do modelo conceitual (MER) feito no brModelo: -->
<!-- ![Modelo conceitual](imagens/modelo_conceitual.png) -->
 
## Estrutura do repositório
 
```
scripts_sql/
├── 01_criacao_tabelas.sql
├── 02_inserir_dados.sql
├── 03_script_01_join_2_tabelas.sql
├── 03_script_02_join_3_tabelas.sql
├── 03_script_03_left_join.sql
├── 03_script_04_count_group_by.sql
├── 03_script_05_sum_avg_having.sql
├── 03_script_06_where_like_order.sql
├── 03_script_07_between.sql
├── 03_script_08_update.sql
├── 03_script_09_desativacao_logica.sql
├── 03_script_10_delete.sql
└── 04_visualizar_01_clientes.sql  (até 04_visualizar_07_pagamentos.sql)
```
 
## Como executar
 
1. Abra o **MySQL Workbench** e conecte ao seu servidor MySQL.
2. Abra e execute o `01_criacao_tabelas.sql` (cria o banco e as tabelas).
3. Abra e execute o `02_inserir_dados.sql` (insere os dados de exemplo). Execute **uma única vez**.
4. Execute os scripts `04_visualizar_...` para ver o conteúdo de cada tabela.
5. Execute os scripts `03_script_01` a `03_script_10`, nessa ordem. Os scripts 8, 9 e 10 alteram os dados.
Para recomeçar do zero, rode `DROP DATABASE sistema_agendamentos;` e repita os passos 2 e 3.
 
## Scripts de consulta e manipulação
 
| Script | O que faz | Conceito |
|---|---|---|
| 01 | Lista cada serviço com sua categoria | JOIN de 2 tabelas |
| 02 | Mostra cada agendamento com cliente e serviço | JOIN de 3 tabelas |
| 03 | Mostra agendamentos sem pagamento | LEFT JOIN |
| 04 | Conta agendamentos por status | COUNT e GROUP BY |
| 05 | Total e média de pagamentos por forma de pagamento | SUM, AVG, GROUP BY e HAVING |
| 06 | Busca clientes pelo início do nome | WHERE, LIKE e ORDER BY |
| 07 | Lista os agendamentos de setembro de 2026 | BETWEEN e ORDER BY |
| 08 | Altera o preço de um serviço | UPDATE |
| 09 | Marca um serviço como inativo sem apagá-lo | Desativação lógica |
| 10 | Remove um pagamento pendente | DELETE |
 
## O que aprendi
 
- Transformar um dicionário de dados em tabelas com chaves primárias e estrangeiras.
- Ligar tabelas com `JOIN` e `LEFT JOIN`.
- Resumir dados com funções de agregação e filtrar grupos com `HAVING`.
- Alterar dados com segurança usando `WHERE` e preservar o histórico com a desativação lógica.
## Autores 
 
**Bruno Tadeu Marquews Martins Filho**
**Felipe Avelino da Silva**
**Victor dos Santos Costa**
**Vinicius Conceição Alves Maria**
Curso: Analise e Desenvolvimento de Sistemas | Disciplina: Modelagem de Banco de Dados

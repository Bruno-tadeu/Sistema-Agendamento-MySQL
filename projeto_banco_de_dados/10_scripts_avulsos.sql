-- Script 1: JOIN de 2 tabelas
-- Lista cada serviço com o nome da sua categoria.

USE sistema_agendamentos;

SELECT servicos.nome, categorias_servico.nome AS categoria, servicos.preco
FROM servicos
JOIN categorias_servico ON servicos.id_categoria = categorias_servico.id_categoria;

-- Script 2: JOIN de 3 tabelas
-- Mostra cada agendamento com o nome do cliente e do serviço.

SELECT agendamentos.id_agendamento,
       clientes.nome AS cliente,
       servicos.nome AS servico,
       agendamentos.data_agendamento
FROM agendamentos
JOIN clientes ON agendamentos.id_cliente = clientes.id_cliente
JOIN servicos ON agendamentos.id_servico = servicos.id_servico;

-- Script 3: LEFT JOIN
-- Mostra os agendamentos que ainda não têm nenhum pagamento.

SELECT agendamentos.id_agendamento, agendamentos.data_agendamento, agendamentos.status
FROM agendamentos
LEFT JOIN pagamentos ON agendamentos.id_agendamento = pagamentos.id_agendamento
WHERE pagamentos.id_pagamento IS NULL;

-- Script 4: COUNT e GROUP BY
-- Conta quantos agendamentos existem em cada status.

SELECT status, COUNT(*) AS quantidade
FROM agendamentos
GROUP BY status;

-- Script 5: SUM, AVG, GROUP BY e HAVING
-- Total e média de pagamentos pagos por forma de pagamento,
-- mostrando só as formas com total maior que 100.

SELECT formas_pagamento.descricao,
       SUM(pagamentos.valor) AS total,
       AVG(pagamentos.valor) AS media
FROM pagamentos
JOIN formas_pagamento ON pagamentos.id_forma_pagamento = formas_pagamento.id_forma_pagamento
WHERE pagamentos.status = 'pago'
GROUP BY formas_pagamento.descricao
HAVING SUM(pagamentos.valor) > 100;

-- Script 6: WHERE, LIKE e ORDER BY
-- Clientes cujo nome começa com "Mar", em ordem alfabética.

SELECT nome, email
FROM clientes
WHERE nome LIKE 'Mar%'
ORDER BY nome;

-- Script 7: BETWEEN e ORDER BY
-- Agendamentos de setembro de 2026, do mais antigo para o mais novo.

SELECT id_agendamento, data_agendamento, horario_inicio, status
FROM agendamentos
WHERE data_agendamento BETWEEN '2026-09-01' AND '2026-09-30'
ORDER BY data_agendamento;

-- Script 8: UPDATE
-- Muda o preço do serviço 1 (Corte masculino) para 55.

SELECT id_servico, nome, preco FROM servicos WHERE id_servico = 1;

UPDATE servicos
SET preco = 55.00
WHERE id_servico = 1;

SELECT id_servico, nome, preco FROM servicos WHERE id_servico = 1;

-- Script 9: Desativação lógica
-- Em vez de apagar o serviço 7 (Platinado), muda o status para "inativo".

SELECT id_servico, nome, preco FROM servicos WHERE id_servico = 7;

UPDATE servicos
SET status = 'inativo'
WHERE id_servico = 7;

SELECT id_servico, nome, status FROM servicos;

-- Script 10: DELETE
-- Apaga o pagamento 8, que está pendente.

SELECT * FROM pagamentos WHERE id_pagamento = 8;

DELETE FROM pagamentos
WHERE id_pagamento = 8;

SELECT * FROM pagamentos;
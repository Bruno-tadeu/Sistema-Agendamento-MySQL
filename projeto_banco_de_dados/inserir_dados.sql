-- Dados de exemplo (fictícios) de uma barbearia masculina.


USE sistema_agendamentos;

INSERT INTO clientes (cpf, nome, telefone, email, data_nascimento, data_cadastro) VALUES
('111.222.333-44', 'Carlos Oliveira',  '(11) 91111-1111', 'carlos.oliveira@gmail.com', '1990-03-15', '2026-01-10'),
('222.333.444-55', 'João Pereira',     '(11) 92222-2222', 'joao.pereira@outlook.com',  '1985-07-22', '2026-02-05'),
('333.444.555-66', 'Marcos Souza',     '(11) 93333-3333', 'marcos.souza@gmail.com',    '1998-11-02', '2026-03-12'),
('444.555.666-77', 'Lucas Fernandes',  '(11) 94444-4444', 'lucas.fernandes@yahoo.com', '1979-01-30', '2026-04-20'),
('555.666.777-88', 'Pedro Santos',     '(11) 95555-5555', 'pedro.santos@gmail.com',    '2001-09-09', '2026-05-18'),
('666.777.888-99', 'Gabriel Costa',    '(11) 96666-6666', 'gabriel.costa@hotmail.com', '1993-05-27', '2026-06-01'),
('777.888.999-00', 'Marcelo Dias',     '(11) 97777-7777', 'marcelo.dias@gmail.com',    '1988-12-12', '2026-06-20');

INSERT INTO colaboradores (cpf, nome, telefone, email, cargo, data_admissao) VALUES
('888.999.000-11', 'Rafael Lima',   '(11) 98888-8888', 'rafael@barbearia.com', 'barbeiro chefe', '2020-02-01'),
('999.000.111-22', 'Diego Martins', '(11) 99999-9999', 'diego@barbearia.com',  'barbeiro',       '2022-05-15'),
('000.111.222-33', 'Thiago Rocha',  '(11) 90000-0000', 'thiago@barbearia.com', 'barbeiro',       '2023-08-10'),
('123.456.789-00', 'Bruno Alves',   '(11) 90123-4567', 'bruno@barbearia.com',  'barbeiro',       '2024-01-08');

INSERT INTO categorias_servico (nome, descricao) VALUES
('Cabelo', 'Cortes e tratamentos para o cabelo'),
('Barba',  'Barba, pigmentação e acabamentos'),
('Combos', 'Pacotes com mais de um serviço');

INSERT INTO servicos (id_categoria, nome, descricao, duracao_minutos, preco, status) VALUES
(1, 'Corte masculino',          'Corte tradicional na tesoura ou máquina', 40,  50.00, 'ativo'),
(1, 'Corte degradê',            'Degradê com acabamento na navalha',       45,  60.00, 'ativo'),
(2, 'Barba completa',           'Barba modelada com navalha',              30,  40.00, 'ativo'),
(2, 'Barba com toalha quente',  'Barba com toalha quente e hidratação',    40,  55.00, 'ativo'),
(3, 'Corte + barba',            'Combo de corte e barba completa',         70,  85.00, 'ativo'),
(2, 'Pigmentação de barba',     'Pigmentação para preencher falhas',       45,  70.00, 'ativo'),
(1, 'Platinado',                'Descoloração e tonalização do cabelo',   120, 150.00, 'ativo'),
(1, 'Relaxamento capilar',      'Relaxamento para cabelos crespos',        90,  80.00, 'inativo');

INSERT INTO formas_pagamento (descricao, status) VALUES
('Dinheiro',          'ativa'),
('Pix',               'ativa'),
('Cartão de crédito', 'ativa'),
('Cartão de débito',  'ativa'),
('Cheque',            'inativa');

INSERT INTO agendamentos (id_cliente, id_colaborador, id_servico, data_agendamento, horario_inicio, horario_fim, status, observacao) VALUES
(1, 1, 5, '2026-09-01', '09:00:00', '10:10:00', 'concluido', NULL),
(2, 2, 1, '2026-09-01', '10:00:00', '10:40:00', 'concluido', 'Corte na máquina 2'),
(3, 3, 3, '2026-09-02', '14:00:00', '14:30:00', 'concluido', NULL),
(4, 2, 2, '2026-09-02', '15:00:00', '15:45:00', 'concluido', NULL),
(5, 1, 6, '2026-09-03', '11:00:00', '11:45:00', 'concluido', 'Falhas na barba'),
(6, 3, 7, '2026-09-05', '13:00:00', '15:00:00', 'concluido', NULL),
(2, 4, 4, '2026-09-10', '16:00:00', '16:40:00', 'cancelado', 'Cliente desmarcou'),
(3, 2, 1, '2026-10-08', '09:00:00', '09:40:00', 'concluido', NULL),
(1, 1, 5, '2026-10-15', '10:00:00', '11:10:00', 'concluido', NULL),
(4, 4, 3, '2026-10-20', '15:00:00', '15:30:00', 'confirmado', NULL),
(5, 3, 1, '2026-11-05', '09:00:00', '09:40:00', 'agendado', NULL),
(6, 2, 5, '2026-11-06', '14:00:00', '15:10:00', 'agendado', 'Primeira visita');

INSERT INTO pagamentos (id_agendamento, id_forma_pagamento, valor, data_pagamento, status) VALUES
(1, 2, 85.00, '2026-09-01 10:15:00', 'pago'),
(2, 1, 50.00, '2026-09-01 10:45:00', 'pago'),
(3, 2, 40.00, '2026-09-02 14:35:00', 'pago'),
(4, 4, 60.00, '2026-09-02 15:50:00', 'pago'),
(5, 3, 35.00, '2026-09-03 11:50:00', 'pago'),
(5, 3, 35.00, '2026-10-03 12:00:00', 'pago'),
(6, 3, 75.00, '2026-09-05 15:05:00', 'pago'),
(6, 3, 75.00, '2026-10-05 15:00:00', 'pendente'),
(8, 2, 50.00, '2026-10-08 09:45:00', 'pago'),
(9, 1, 85.00, '2026-10-15 11:15:00', 'pago'),
(7, 2, 55.00, '2026-09-10 15:00:00', 'estornado');
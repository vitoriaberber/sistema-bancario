CREATE DATABASE sistema_bancario;

CREATE TABLE contas (
	id_conta SERIAL PRIMARY KEY,
	titular VARCHAR(255) NOT NULL,
	saldo NUMERIC(10,2)
);

INSERT INTO contas (titular, saldo) VALUES
('Vitória Berber', 1000.00),
('Lucas Andrade', 1500.00),
('Fernanda Souza', 500.00);

CREATE TABLE transacoes (
    id_transacao SERIAL PRIMARY KEY,
    id_origem INTEGER NOT NULL REFERENCES contas(id_conta),
    id_destino INTEGER NOT NULL REFERENCES contas(id_conta),
    valor NUMERIC(10,2) NOT NULL CHECK (valor > 0),
    data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT
);

INSERT INTO transacoes (id_origem, id_destino, valor, descricao) VALUES
(1, 2, 200.00, 'Transferência para Lucas'),
(2, 3, 300.00, 'Pagamento para Fernanda'),
(3, 1, 100.00, 'Reembolso para Vitória'),
(1, 3, 50.00, 'Ajuda para Fernanda'),
(2, 1, 150.00, 'Reembolso recebido de Lucas');
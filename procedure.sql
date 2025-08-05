CREATE OR REPLACE PROCEDURE 
	transferir(valor NUMERIC(10,2), origem INTEGER,
	destino INTEGER, descricao TEXT)
LANGUAGE plpgsql
AS $$
	DECLARE
  		saldo_origem NUMERIC;
  
	BEGIN
		SELECT saldo INTO saldo_origem FROM contas 
			WHERE id_conta = origem;
		IF valor > saldo_origem THEN
			RAISE EXCEPTION 'Saldo insuficiente para a transferência';
		END IF;

		UPDATE contas 
			SET saldo = saldo - valor
			WHERE id_conta = origem;
			
		UPDATE contas 
			SET saldo = saldo + valor
			WHERE id_conta = destino;

		INSERT INTO transacoes(id_origem, id_destino, valor, descricao) 
			VALUES (origem, destino, valor, descricao);
	END;
$$;

BEGIN;

CALL transferir(200.00, 1, 2, 'Pagamento de serviço');

COMMIT;

SELECT * FROM contas;
SELECT * FROM transacoes;
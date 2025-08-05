# 💰 Sistema Bancário Simples - Projeto PostgreSQL

Este projeto simula operações básicas de um sistema bancário, com **contas**, **transferências** e **controle de saldo**, utilizando recursos avançados do PostgreSQL como **procedures** e **transações (BEGIN, COMMIT, ROLLBACK)** para garantir segurança e consistência.

---

## 🧱 Estrutura do Banco de Dados

### 📌 Tabelas criadas:

#### `contas`
- `id_conta` (PK)
- `titular`
- `saldo` (NUMERIC)

#### `transacoes`
- `id_transacao` (PK)
- `id_origem` (FK para contas)
- `id_destino` (FK para contas)
- `valor` (NUMERIC CHECK > 0)
- `data_transacao` (TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
- `descricao` (TEXT)

---

## 💸 Procedure de Transferência Segura

Uma procedure com controle de saldo, validação de valores e inserção automática da transação.

### ✅ Regras implementadas:
- A transferência só ocorre se o **saldo da conta de origem for suficiente**.
- Toda operação ocorre dentro de uma **transação explícita**, garantindo segurança com `BEGIN`, `COMMIT` e `ROLLBACK`.

## ✅ Funcionalidades
- Cadastro de contas com saldo inicial
- Transferências entre contas com verificação de saldo
- Registro automático das transações realizadas
- Segurança com uso de transações SQL e tratamento de erros

## 🛠️ Tecnologias
- PostgreSQL
- SQL (DDL, DML, Procedure, Transaction Control)
- Testado via pgAdmin

---

👩‍💻 Desenvolvido por
Vitória Berber

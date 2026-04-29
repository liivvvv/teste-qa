-- Schema utilizado
-- beneficiario (id, nome, cpf, telefone, endereco, status)
-- procedimento (id, codigo, nome)
-- autorizacao (id, id_beneficiario, id_procedimento, data, tem_cobertura)
-- prestador (id, nome, cnpj, telefone, endereco)

-- 1. Lista todos os beneficiários ativos
SELECT id, nome, cpf, telefone, status
FROM beneficiarios
WHERE status = 'ativo';

-- 2. Beneficiários sem cobertura para EXAME_HEMOGRAMA
SELECT nome
FROM beneficiario
LEFT JOIN autorizacao ON beneficiario.id = autorizacao.id_beneficiario
LEFT JOIN procedimento ON procedimento.id = autorizacao.id_procedimento
WHERE procedimento.nome = 'EXAME_HEMOGRAMA'
AND (tem_cobertura = 'nao' OR tem_cobertura IS NULL);

-- 3. Total de autorizações por tipo de exame em um período
SELECT procedimento.nome, COUNT(autorizacao.id)
FROM autorizacao
LEFT JOIN procedimento ON autorizacao.id_procedimento = procedimento.id
WHERE data BETWEEN '2026-01-01' AND '2026-04-21'
GROUP BY procedimento.nome;

# Casos de teste — Fluxo de autorização de exame

## CT01 — Autorização aprovada

**Pré-condições:**
- Beneficiário com carteirinha 012345678900123 cadastrado e ativo no sistema
- Plano do beneficiário possui cobertura para EXAME_HEMOGRAMA
- Usuário está autenticado no sistema

**Passos:**
1. Acessar a tela de solicitação de autorização
2. Informar carteirinha: 012345678900123
3. Selecionar tipo de exame: EXAME_HEMOGRAMA
4. Informar data desejada: 30/04/2026
5. Confirmar a solicitação

**Dados de teste:** carteirinha 012345678900123, EXAME_HEMOGRAMA, 30/04/2026

**Resultado esperado:** Sistema valida as informações e aprova a autorização

**Critérios de aceite:** Usuário redirecionado para tela de autorização aprovada e confirmada

---

## CT02 — Autorização negada por status inativo

**Pré-condições:**
- Beneficiário com carteirinha 012345678900124 cadastrado e inativo no sistema
- Plano do beneficiário possui cobertura para EXAME_HEMOGRAMA
- Usuário está autenticado no sistema

**Passos:**
1. Acessar a tela de solicitação de autorização
2. Informar carteirinha: 012345678900124
3. Selecionar tipo de exame: EXAME_HEMOGRAMA
4. Informar data desejada: 30/04/2026
5. Confirmar a solicitação

**Dados de teste:** carteirinha 012345678900124, EXAME_HEMOGRAMA, 30/04/2026

**Resultado esperado:** Sistema não aprova a autorização e exibe mensagem informando que o beneficiário consta como inativo

**Critérios de aceite:** Mensagem de erro exibida

---

## CT03 — Autorização negada por falta de cobertura

**Pré-condições:**
- Beneficiário com carteirinha 011345678900132 cadastrado e ativo no sistema
- Plano do beneficiário não possui cobertura para EXAME_HEMOGRAMA
- Usuário está autenticado no sistema

**Passos:**
1. Acessar a tela de solicitação de autorização
2. Informar carteirinha: 011345678900132
3. Selecionar tipo de exame: EXAME_HEMOGRAMA
4. Informar data desejada: 04/05/2026
5. Confirmar a solicitação

**Dados de teste:** carteirinha 011345678900132, EXAME_HEMOGRAMA, 04/05/2026

**Resultado esperado:** Sistema não aprova a autorização e exibe mensagem informando que o plano não possui cobertura para o exame

**Critérios de aceite:** Mensagem de erro exibida

---

## CT04 — Beneficiário deveria estar ativo mas consta inativo

**Pré-condições:**
- Beneficiário com carteirinha 012345678900128 com contrato vigente e pagamento em dia (deveria constar como ativo)
- Sistema exibe o beneficiário como inativo incorretamente
- Plano do beneficiário possui cobertura para EXAME_HEMOGRAMA
- Usuário está autenticado no sistema

**Passos:**
1. Acessar a tela de solicitação de autorização
2. Informar carteirinha: 012345678900128
3. Selecionar tipo de exame: EXAME_HEMOGRAMA
4. Informar data desejada: 30/04/2026
5. Confirmar a solicitação

**Dados de teste:** carteirinha 012345678900128, EXAME_HEMOGRAMA, 30/04/2026

**Resultado esperado:** Sistema valida as informações e aprova a autorização

**Resultado atual:** Sistema não aprova a autorização e exibe mensagem informando que o beneficiário consta como inativo

**Critérios de aceite:** Autorização aprovada com sucesso

---

## CT05 — Carteirinha não encontrada

**Pré-condições:**
- Carteirinha 003456789001234 não cadastrada no sistema
- Usuário está autenticado no sistema

**Passos:**
1. Acessar a tela de solicitação de autorização
2. Informar carteirinha: 003456789001234
3. Selecionar tipo de exame: EXAME_HEMOGRAMA
4. Informar data desejada: 29/04/2026
5. Confirmar a solicitação

**Dados de teste:** carteirinha 003456789001234, EXAME_HEMOGRAMA, 29/04/2026

**Resultado esperado:** Sistema não avança e exibe mensagem informando que a carteirinha não foi localizada

**Critérios de aceite:** Mensagem de erro exibida

---

## CT06 — Campo obrigatório não preenchido

**Pré-condições:**
- Beneficiário com carteirinha 012345678900133 cadastrado e ativo no sistema
- Plano do beneficiário possui cobertura para EXAME_HEMOGRAMA
- Usuário está autenticado no sistema

**Passos:**
1. Acessar a tela de solicitação de autorização
2. Informar carteirinha: 012345678900133
3. Não selecionar tipo de exame
4. Informar data desejada: 06/05/2026
5. Tentar confirmar a solicitação

**Dados de teste:** carteirinha 012345678900133, 06/05/2026

**Resultado esperado:** Sistema não avança e exibe mensagem informando que o tipo de exame é obrigatório

**Critérios de aceite:** Mensagem de erro exibida

---

## CT07 — Data no passado

**Pré-condições:**
- Beneficiário com carteirinha 012345678900134 cadastrado e ativo no sistema
- Plano do beneficiário possui cobertura para EXAME_HEMOGRAMA
- Usuário está autenticado no sistema

**Passos:**
1. Acessar a tela de solicitação de autorização
2. Informar carteirinha: 012345678900134
3. Selecionar tipo de exame: EXAME_HEMOGRAMA
4. Informar data desejada: 30/04/2025
5. Confirmar a solicitação

**Dados de teste:** carteirinha 012345678900134, EXAME_HEMOGRAMA, 30/04/2025

**Resultado esperado:** Sistema não avança e exibe mensagem informando que a data informada é inválida

**Critérios de aceite:** Mensagem de erro exibida

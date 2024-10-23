# SPRINT3-DB
# Projeto de Banco de Dados Oracle

## Descrição

Este projeto foi desenvolvido como parte da avaliação do curso, com o objetivo de implementar **dois procedimentos**, **duas funções** e **um gatilho** utilizando o banco de dados relacional **Oracle**. O projeto foi avaliado com a nota **100/100**.

## Funcionalidades

1. **Procedimentos**:
    - **Procedimento 1**: Executa um `JOIN` entre duas ou mais tabelas relacionais e transforma os dados do formato relacional para **JSON** utilizando uma função personalizada (ver Função 1). Cada tabela contém pelo menos cinco registros.
    - **Procedimento 2**: Lê os dados de uma tabela e exibe, na mesma linha, o valor de uma coluna da linha anterior, atual e próxima. Caso a linha anterior ou a próxima não existam, o valor exibido será "Vazio". 

2. **Funções**:
    - **Função 1**: Converte os dados de formato relacional para **JSON**, sem usar funções built-in do Oracle.
    - **Função 2**: Implementa uma lógica de processamento personalizada, como verificação de complexidade de senha ou cálculos matemáticos, substituindo uma função existente no projeto.

3. **Gatilho**:
    - Monitora operações de `INSERT`, `UPDATE` e `DELETE` em uma tabela e registra essas ações em uma tabela de auditoria, armazenando os dados antigos e novos, o nome do usuário e a data da operação.

## Estrutura do Projeto

O projeto inclui:
- Arquivos SQL com os **procedimentos**, **funções** e **gatilho**.
- Capturas de tela mostrando as execuções e tratamento de exceções.
- Documentação detalhada em PDF.

## Execução

Para executar este projeto, siga as instruções abaixo:
1. Importe os arquivos SQL para o ambiente Oracle.
2. Execute os scripts de criação das tabelas, procedimentos, funções e gatilho.
3. Visualize os logs de auditoria e a saída dos procedimentos para validar os resultados.

## Créditos

- [Gabriel Baltazar]



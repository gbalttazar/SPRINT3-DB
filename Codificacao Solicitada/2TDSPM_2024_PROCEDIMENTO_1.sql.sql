CREATE OR REPLACE FUNCTION converter_para_json(
    p_id_anuncio    IN t_anuncio.id_anuncio%TYPE,
    p_ds_anuncio    IN t_anuncio.ds_anuncio%TYPE,
    p_categ_anuncio IN t_anuncio.categ_anuncio%TYPE,
    p_dt_inicio     IN t_anuncio.dt_inicio%TYPE,
    p_dt_fim        IN t_anuncio.dt_fim%TYPE,
    p_id_campanha   IN t_campanha.id_campanha%TYPE,
    p_st_campanha   IN t_campanha.st_campanha%TYPE,
    p_ds_campanha   IN t_campanha.ds_campanha%TYPE
) RETURN CLOB IS
    v_json CLOB;
BEGIN
    v_json := json_object(
                   'id_anuncio' VALUE p_id_anuncio,
                   'ds_anuncio' VALUE p_ds_anuncio,
                   'categ_anuncio' VALUE p_categ_anuncio,
                   'dt_inicio' VALUE TO_CHAR(p_dt_inicio, 'YYYY-MM-DD'),
                   'dt_fim' VALUE TO_CHAR(p_dt_fim, 'YYYY-MM-DD'),
                   'id_campanha' VALUE p_id_campanha,
                   'st_campanha' VALUE p_st_campanha,
                   'ds_campanha' VALUE p_ds_campanha
               );
    RETURN v_json;
END;
/
CREATE OR REPLACE PROCEDURE obter_anuncios_em_json IS
    TYPE json_table_type IS TABLE OF CLOB;
    v_json_output json_table_type;
BEGIN
    BEGIN
        -- Executa a consulta com JOIN entre t_anuncio e t_campanha
        SELECT converter_para_json(
                   a.id_anuncio, 
                   a.ds_anuncio, 
                   a.categ_anuncio, 
                   a.dt_inicio, 
                   a.dt_fim, 
                   c.id_campanha, 
                   c.st_campanha, 
                   c.ds_campanha
               ) 
        BULK COLLECT INTO v_json_output
        FROM t_anuncio a
        JOIN t_campanha c ON a.id_campanha = c.id_campanha;

        -- Exibe cada resultado JSON
        FOR i IN 1..v_json_output.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(v_json_output(i));
        END LOOP;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado para a consulta.');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('A consulta retornou muitas linhas.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Ocorreu um erro ao executar a consulta: ' || SQLERRM);
    END;
END;
/
CREATE OR REPLACE PROCEDURE inserir_anuncio(
    p_id_anuncio    IN t_anuncio.id_anuncio%TYPE,
    p_ds_anuncio    IN t_anuncio.ds_anuncio%TYPE,
    p_categ_anuncio IN t_anuncio.categ_anuncio%TYPE,
    p_dt_inicio     IN t_anuncio.dt_inicio%TYPE,
    p_dt_fim        IN t_anuncio.dt_fim%TYPE,
    p_id_campanha   IN t_anuncio.id_campanha%TYPE
) IS
    v_count NUMBER;
BEGIN
    -- Verifica se o id_campanha existe na tabela t_campanha
    SELECT COUNT(*)
    INTO v_count
    FROM t_campanha
    WHERE id_campanha = p_id_campanha;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Erro: id_campanha não encontrado na tabela t_campanha.');
        RETURN;
    END IF;

    BEGIN
        -- Insere um novo anúncio
        INSERT INTO t_anuncio (id_anuncio, ds_anuncio, categ_anuncio, dt_inicio, dt_fim, id_campanha)
        VALUES (p_id_anuncio, p_ds_anuncio, p_categ_anuncio, p_dt_inicio, p_dt_fim, p_id_campanha);

        DBMS_OUTPUT.PUT_LINE('Anúncio inserido com sucesso.');

    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Erro: Violação de chave primária.');
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Erro: Valor inválido para um dos campos.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Ocorreu um erro ao inserir o anúncio: ' || SQLERRM);
    END;
END;
/
-- Testando o procedimento obter_anuncios_em_json
BEGIN
    obter_anuncios_em_json;
END;
/

-- Testando o procedimento inserir_anuncio
BEGIN
    inserir_anuncio(1, 'Novo Anúncio', 'Categoria A', SYSDATE, SYSDATE + 10, 1);
END;
/

CREATE OR REPLACE FUNCTION fn_transformar_para_json(
    p_anterior IN VARCHAR2,
    p_atual IN VARCHAR2,
    p_proximo IN VARCHAR2
) RETURN VARCHAR2 
IS
    v_json VARCHAR2(4000);
BEGIN
    -- Converte os parâmetros para um formato JSON simples
    v_json := '{"anterior": "' || p_anterior || '", "atual": "' || p_atual || '", "proximo": "' || p_proximo || '"}';
    RETURN v_json;
EXCEPTION
    WHEN VALUE_ERROR THEN
        RETURN '{"erro": "Erro de valor nos dados."}';
    WHEN OTHERS THEN
        RETURN '{"erro": "Erro desconhecido."}';
END fn_transformar_para_json;
/

CREATE OR REPLACE PROCEDURE pr_relatorio_anuncios AS
    v_anterior t_anuncio.ds_anuncio%TYPE;
    v_atual t_anuncio.ds_anuncio%TYPE;
    v_proximo t_anuncio.ds_anuncio%TYPE;
    v_json VARCHAR2(4000);
    CURSOR c_anuncios IS
        SELECT ds_anuncio
        FROM t_anuncio
        ORDER BY id_anuncio;
BEGIN
    OPEN c_anuncios;

    -- Buscar a primeira linha
    FETCH c_anuncios INTO v_atual;
    IF c_anuncios%NOTFOUND THEN
        v_atual := 'Vazio';
    END IF;

    LOOP
        v_anterior := v_atual;
        FETCH c_anuncios INTO v_atual;
        IF c_anuncios%NOTFOUND THEN
            v_atual := 'Vazio';
            v_proximo := 'Vazio';
        ELSE
            FETCH c_anuncios INTO v_proximo;
            IF c_anuncios%NOTFOUND THEN
                v_proximo := 'Vazio';
            END IF;
        END IF;

        -- Chamar a função JSON com os valores corretos
        v_json := fn_transformar_para_json(v_anterior, v_atual, v_proximo);

        -- Exibir os valores
        DBMS_OUTPUT.PUT_LINE('Anterior: ' || v_anterior || ', Atual: ' || v_atual || ', Próximo: ' || v_proximo);
        DBMS_OUTPUT.PUT_LINE('JSON: ' || v_json);

        EXIT WHEN c_anuncios%NOTFOUND;
    END LOOP;

    CLOSE c_anuncios;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END pr_relatorio_anuncios;
/


BEGIN
   pr_relatorio_anuncios;
END;
/


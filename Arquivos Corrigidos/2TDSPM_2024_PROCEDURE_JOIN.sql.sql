CREATE OR REPLACE PROCEDURE select_empresas_ias
IS

    TYPE empresa_ia_cursor_type IS REF CURSOR;
    
    empresas_ias_cur empresa_ia_cursor_type;
    
    v_nm_empresa t_empresa.nm_empresa%TYPE;
    v_ds_ia t_ia.ds_ia%TYPE;

BEGIN
    OPEN empresas_ias_cur FOR
        SELECT e.nm_empresa, i.ds_ia
        FROM t_empresa e
        INNER JOIN t_ia i ON e.id_empresa = i.id_empresa;

    LOOP
        FETCH empresas_ias_cur INTO v_nm_empresa, v_ds_ia;
        EXIT WHEN empresas_ias_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Empresa: ' || v_nm_empresa || ', IA: ' || v_ds_ia);
    END LOOP;
    
    CLOSE empresas_ias_cur;
    
END select_empresas_ias;
/

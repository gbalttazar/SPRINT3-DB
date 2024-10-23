CREATE OR REPLACE PROCEDURE relatorio_previsoes_por_ia
IS

    TYPE ia_previsoes_type IS RECORD (
        ds_ia t_ia.ds_ia%TYPE,
        total_previsoes NUMBER
    );

    TYPE ia_previsoes_cur_type IS REF CURSOR RETURN ia_previsoes_type;


    ias_previsoes_cur ia_previsoes_cur_type;

  
    v_ds_ia t_ia.ds_ia%TYPE;
    v_total_previsoes NUMBER := 0;

BEGIN
    
    OPEN ias_previsoes_cur FOR
        SELECT i.ds_ia, COUNT(*) AS total_previsoes
        FROM t_ia i
        INNER JOIN t_previsao_tendencia p ON i.id_ia = p.id_ia
        GROUP BY i.ds_ia
        ORDER BY total_previsoes DESC;

   
    LOOP
       
        FETCH ias_previsoes_cur INTO v_ds_ia, v_total_previsoes;
        
      
        EXIT WHEN ias_previsoes_cur%NOTFOUND;

        
        DBMS_OUTPUT.PUT_LINE('IA: ' || v_ds_ia || ', Total de Previsões: ' || v_total_previsoes);
    END LOOP;

   
    CLOSE ias_previsoes_cur;

END relatorio_previsoes_por_ia;
/
SET SERVEROUTPUT ON;
BEGIN
    relatorio_previsoes_por_ia;
END;
/


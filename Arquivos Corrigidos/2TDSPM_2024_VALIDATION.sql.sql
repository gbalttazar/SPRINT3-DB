
--função 1 validar cnpj
CREATE OR REPLACE FUNCTION validar_cnpj(p_cnpj IN VARCHAR2)
RETURN BOOLEAN
IS
    v_cnpj_str VARCHAR2(14);
    v_soma     NUMBER := 0;
    v_resto    NUMBER;
    v_digito   NUMBER;
BEGIN
    v_cnpj_str := REGEXP_REPLACE(p_cnpj, '[^[:digit:]]', ''); -- Remover caracteres não numéricos

    IF LENGTH(v_cnpj_str) <> 14 THEN
        RETURN FALSE;
    END IF;

    FOR i IN 1..12 LOOP
        v_soma := v_soma + TO_NUMBER(SUBSTR(v_cnpj_str, i, 1)) * 
                                  CASE WHEN i <= 4 THEN 6 - i ELSE 14 - i END;
    END LOOP;

    v_resto := MOD(v_soma, 11);
    IF v_resto < 2 THEN
        v_digito := 0;
    ELSE
        v_digito := 11 - v_resto;
    END IF;

    IF v_digito = TO_NUMBER(SUBSTR(v_cnpj_str, 13, 1)) THEN
        v_soma := 0;
        FOR i IN 1..13 LOOP
            v_soma := v_soma + TO_NUMBER(SUBSTR(v_cnpj_str, i, 1)) *
                                      CASE WHEN i <= 5 THEN 7 - i ELSE 14 - i END;
        END LOOP;

        v_resto := MOD(v_soma, 11);
        IF v_resto < 2 THEN
            v_digito := 0;
        ELSE
            v_digito := 11 - v_resto;
        END IF;

        IF v_digito = TO_NUMBER(SUBSTR(v_cnpj_str, 14, 1)) THEN
            RETURN TRUE;
        END IF;
    END IF;

    RETURN FALSE;
END validar_cnpj;
/

--função 2 validar email

CREATE OR REPLACE FUNCTION validar_email(p_email IN VARCHAR2)
RETURN BOOLEAN
IS
BEGIN
    IF REGEXP_LIKE(p_email, '[[:alnum:]_.+-]+@[[:alnum:]_.-]+\.[[:alpha:]]{2,}') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END validar_email;
/

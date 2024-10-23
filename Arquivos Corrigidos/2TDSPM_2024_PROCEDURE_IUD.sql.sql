---producere da tabela t_empresa
CREATE OR REPLACE PROCEDURE inserir_empresa(
    p_id_empresa IN t_empresa.id_empresa%TYPE,
    p_cnpj IN t_empresa.cnpj%TYPE,
    p_ds_email IN t_empresa.ds_email%TYPE,
    p_nm_empresa IN t_empresa.nm_empresa%TYPE,
    p_st_empresa IN t_empresa.st_empresa%TYPE,
    p_id_cliente IN t_empresa.id_cliente%TYPE
)
IS
BEGIN
    INSERT INTO t_empresa(id_empresa, cnpj, ds_email, nm_empresa, st_empresa, id_cliente)
    VALUES (p_id_empresa, p_cnpj, p_ds_email, p_nm_empresa, p_st_empresa, p_id_cliente);
    COMMIT;
END inserir_empresa;
/
CREATE OR REPLACE PROCEDURE atualizar_empresa(
    p_id_empresa IN t_empresa.id_empresa%TYPE,
    p_cnpj IN t_empresa.cnpj%TYPE,
    p_ds_email IN t_empresa.ds_email%TYPE,
    p_nm_empresa IN t_empresa.nm_empresa%TYPE,
    p_st_empresa IN t_empresa.st_empresa%TYPE,
    p_id_cliente IN t_empresa.id_cliente%TYPE
)
IS
BEGIN
    UPDATE t_empresa
    SET cnpj = p_cnpj,
        ds_email = p_ds_email,
        nm_empresa = p_nm_empresa,
        st_empresa = p_st_empresa,
        id_cliente = p_id_cliente
    WHERE id_empresa = p_id_empresa;
    COMMIT;
END atualizar_empresa;
/
CREATE OR REPLACE PROCEDURE deletar_empresa(
    p_id_empresa IN t_empresa.id_empresa%TYPE,
    p_id_cliente IN t_empresa.id_cliente%TYPE
)
IS
BEGIN
    DELETE FROM t_empresa
    WHERE id_empresa = p_id_empresa
    AND id_cliente = p_id_cliente;
    COMMIT;
END deletar_empresa;
/

---producere da tabela t_cliente
CREATE OR REPLACE PROCEDURE inserir_cliente(
    p_id_cliente IN t_cliente.id_cliente%TYPE,
    p_nm_cliente IN t_cliente.nm_cliente%TYPE
)
IS
BEGIN
    INSERT INTO t_cliente(id_cliente, nm_cliente)
    VALUES (p_id_cliente, p_nm_cliente);
    COMMIT;
END inserir_cliente;
/
CREATE OR REPLACE PROCEDURE atualizar_cliente(
    p_id_cliente IN t_cliente.id_cliente%TYPE,
    p_nm_cliente IN t_cliente.nm_cliente%TYPE
)
IS
BEGIN
    UPDATE t_cliente
    SET nm_cliente = p_nm_cliente
    WHERE id_cliente = p_id_cliente;
    COMMIT;
END atualizar_cliente;
/
CREATE OR REPLACE PROCEDURE deletar_cliente(
    p_id_cliente IN t_cliente.id_cliente%TYPE
)
IS
BEGIN
    DELETE FROM t_cliente
    WHERE id_cliente = p_id_cliente;
    COMMIT;
END deletar_cliente;
/

---producere da tabela t_ia
CREATE OR REPLACE PROCEDURE inserir_ia(
    p_id_ia IN t_ia.id_ia%TYPE,
    p_tp_ia IN t_ia.tp_ia%TYPE,
    p_ds_ia IN t_ia.ds_ia%TYPE,
    p_acuracia IN t_ia.acuracia%TYPE,
    p_st_ia IN t_ia.st_ia%TYPE,
    p_id_empresa IN t_ia.id_empresa%TYPE
)
IS
BEGIN
    INSERT INTO t_ia(id_ia, tp_ia, ds_ia, acuracia, st_ia, id_empresa)
    VALUES (p_id_ia, p_tp_ia, p_ds_ia, p_acuracia, p_st_ia, p_id_empresa);
    COMMIT;
END inserir_ia;
/
CREATE OR REPLACE PROCEDURE atualizar_ia(
    p_id_ia IN t_ia.id_ia%TYPE,
    p_tp_ia IN t_ia.tp_ia%TYPE,
    p_ds_ia IN t_ia.ds_ia%TYPE,
    p_acuracia IN t_ia.acuracia%TYPE,
    p_st_ia IN t_ia.st_ia%TYPE,
    p_id_empresa IN t_ia.id_empresa%TYPE
)
IS
BEGIN
    UPDATE t_ia
    SET tp_ia = p_tp_ia,
        ds_ia = p_ds_ia,
        acuracia = p_acuracia,
        st_ia = p_st_ia,
        id_empresa = p_id_empresa
    WHERE id_ia = p_id_ia;
    COMMIT;
END atualizar_ia;
/
CREATE OR REPLACE PROCEDURE deletar_ia(
    p_id_ia IN t_ia.id_ia%TYPE,
    p_id_empresa IN t_ia.id_empresa%TYPE
)
IS
BEGIN
    DELETE FROM t_ia
    WHERE id_ia = p_id_ia
    AND id_empresa = p_id_empresa;
    COMMIT;
END deletar_ia;
/

---producere da tabela t_email
CREATE OR REPLACE PROCEDURE inserir_email(
    p_id_email IN t_email.id_email%TYPE,
    p_ds_email IN t_email.ds_email%TYPE,
    p_st_email IN t_email.st_email%TYPE,
    p_tp_email IN t_email.tp_email%TYPE,
    p_id_empresa IN t_email.id_empresa%TYPE
)
IS
BEGIN
    INSERT INTO t_email(id_email, ds_email, st_email, tp_email, id_empresa)
    VALUES (p_id_email, p_ds_email, p_st_email, p_tp_email, p_id_empresa);
    COMMIT;
END inserir_email;
/
CREATE OR REPLACE PROCEDURE atualizar_email(
    p_id_email IN t_email.id_email%TYPE,
    p_ds_email IN t_email.ds_email%TYPE,
    p_st_email IN t_email.st_email%TYPE,
    p_tp_email IN t_email.tp_email%TYPE,
    p_id_empresa IN t_email.id_empresa%TYPE
)
IS
BEGIN
    UPDATE t_email
    SET ds_email = p_ds_email,
        st_email = p_st_email,
        tp_email = p_tp_email
    WHERE id_email = p_id_email
    AND id_empresa = p_id_empresa;
    COMMIT;
END atualizar_email;
/
CREATE OR REPLACE PROCEDURE deletar_email(
    p_id_email IN t_email.id_email%TYPE,
    p_id_empresa IN t_email.id_empresa%TYPE
)
IS
BEGIN
    DELETE FROM t_email
    WHERE id_email = p_id_email
    AND id_empresa = p_id_empresa;
    COMMIT;
END deletar_email;
/

---producere da tabela t_campanha
CREATE OR REPLACE PROCEDURE inserir_campanha(
    p_id_campanha IN t_campanha.id_campanha%TYPE,
    p_st_campanha IN t_campanha.st_campanha%TYPE,
    p_dt_inicio IN t_campanha.dt_inicio%TYPE,
    p_dt_fim IN t_campanha.dt_fim%TYPE,
    p_ds_campanha IN t_campanha.ds_campanha%TYPE
)
IS
BEGIN
    INSERT INTO t_campanha(id_campanha, st_campanha, dt_inicio, dt_fim, ds_campanha)
    VALUES (p_id_campanha, p_st_campanha, p_dt_inicio, p_dt_fim, p_ds_campanha);
    COMMIT;
END inserir_campanha;
/
CREATE OR REPLACE PROCEDURE atualizar_campanha(
    p_id_campanha IN t_campanha.id_campanha%TYPE,
    p_st_campanha IN t_campanha.st_campanha%TYPE,
    p_dt_inicio IN t_campanha.dt_inicio%TYPE,
    p_dt_fim IN t_campanha.dt_fim%TYPE,
    p_ds_campanha IN t_campanha.ds_campanha%TYPE
)
IS
BEGIN
    UPDATE t_campanha
    SET st_campanha = p_st_campanha,
        dt_inicio = p_dt_inicio,
        dt_fim = p_dt_fim,
        ds_campanha = p_ds_campanha
    WHERE id_campanha = p_id_campanha;
    COMMIT;
END atualizar_campanha;
/
CREATE OR REPLACE PROCEDURE deletar_campanha(
    p_id_campanha IN t_campanha.id_campanha%TYPE
)
IS
BEGIN
    DELETE FROM t_campanha
    WHERE id_campanha = p_id_campanha;
    COMMIT;
END deletar_campanha;
/

---producere da tabela t_anuncio
CREATE OR REPLACE PROCEDURE inserir_anuncio(
    p_id_anuncio IN t_anuncio.id_anuncio%TYPE,
    p_ds_anuncio IN t_anuncio.ds_anuncio%TYPE,
    p_categ_anuncio IN t_anuncio.categ_anuncio%TYPE,
    p_dt_inicio IN t_anuncio.dt_inicio%TYPE,
    p_dt_fim IN t_anuncio.dt_fim%TYPE,
    p_id_campanha IN t_anuncio.id_campanha%TYPE
)
IS
BEGIN
    INSERT INTO t_anuncio(id_anuncio, ds_anuncio, categ_anuncio, dt_inicio, dt_fim, id_campanha)
    VALUES (p_id_anuncio, p_ds_anuncio, p_categ_anuncio, p_dt_inicio, p_dt_fim, p_id_campanha);
    COMMIT;
END inserir_anuncio;
/
CREATE OR REPLACE PROCEDURE atualizar_anuncio(
    p_id_anuncio IN t_anuncio.id_anuncio%TYPE,
    p_ds_anuncio IN t_anuncio.ds_anuncio%TYPE,
    p_categ_anuncio IN t_anuncio.categ_anuncio%TYPE,
    p_dt_inicio IN t_anuncio.dt_inicio%TYPE,
    p_dt_fim IN t_anuncio.dt_fim%TYPE,
    p_id_campanha IN t_anuncio.id_campanha%TYPE
)
IS
BEGIN
    UPDATE t_anuncio
    SET ds_anuncio = p_ds_anuncio,
        categ_anuncio = p_categ_anuncio,
        dt_inicio = p_dt_inicio,
        dt_fim = p_dt_fim,
        id_campanha = p_id_campanha
    WHERE id_anuncio = p_id_anuncio;
    COMMIT;
END atualizar_anuncio;
/
CREATE OR REPLACE PROCEDURE deletar_anuncio(
    p_id_anuncio IN t_anuncio.id_anuncio%TYPE,
    p_id_campanha IN t_anuncio.id_campanha%TYPE
)
IS
BEGIN
    DELETE FROM t_anuncio
    WHERE id_anuncio = p_id_anuncio
    AND id_campanha = p_id_campanha;
    COMMIT;
END deletar_anuncio;
/


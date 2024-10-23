BEGIN
    -- Consulta 1: Junção entre t_cliente, t_empresa e t_cidade, agrupando por cidade e ordenando por nome do cliente
    FOR rec IN (
        SELECT cli.nm_cliente, emp.nm_empresa, cid.ds_cidade
        FROM t_cliente cli
        JOIN t_empresa emp ON cli.id_cliente = emp.id_cliente
        JOIN t_cidade cid ON emp.id_empresa = cid.id_empresa
        GROUP BY cli.nm_cliente, emp.nm_empresa, cid.ds_cidade
        ORDER BY cli.nm_cliente
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || rec.nm_cliente || ', Empresa: ' || rec.nm_empresa || ', Cidade: ' || rec.ds_cidade);
    END LOOP;

    -- Consulta 2: Junção entre t_campanha, t_anuncio e t_associacao, agrupando por campanha e ordenando por data de início
    FOR rec IN (
        SELECT cam.ds_campanha, cam.dt_inicio, anu.ds_anuncio, cli.nm_cliente
        FROM t_campanha cam
        JOIN t_anuncio anu ON cam.id_campanha = anu.id_campanha
        JOIN t_associacao ass ON cam.id_campanha = ass.id_campanha
        JOIN t_cliente cli ON ass.id_cliente = cli.id_cliente
        GROUP BY cam.ds_campanha, cam.dt_inicio, anu.ds_anuncio, cli.nm_cliente
        ORDER BY cam.dt_inicio
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Campanha: ' || rec.ds_campanha || ', Data Início: ' || rec.dt_inicio || ', Anúncio: ' || rec.ds_anuncio || ', Cliente: ' || rec.nm_cliente);
    END LOOP;

    -- Consulta 3: Junção entre t_email, t_empresa e t_associacao2, agrupando por tipo de email e ordenando por status de email
    FOR rec IN (
        SELECT eml.tp_email, eml.st_email, eml.ds_email, emp.nm_empresa
        FROM t_email eml
        JOIN t_empresa emp ON eml.id_empresa = emp.id_empresa
        JOIN t_associacao2 ass2 ON eml.id_email = ass2.id_email
        GROUP BY eml.tp_email, eml.st_email, eml.ds_email, emp.nm_empresa
        ORDER BY eml.st_email
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Tipo Email: ' || rec.tp_email || ', Status: ' || rec.st_email || ', Email: ' || rec.ds_email || ', Empresa: ' || rec.nm_empresa);
    END LOOP;
END;
/

SELECT 
    id_anuncio,
    ds_anuncio AS "Atual",
    LAG(ds_anuncio, 1, 'Vazio') OVER (ORDER BY id_anuncio) AS "Anterior",
    LEAD(ds_anuncio, 1, 'Vazio') OVER (ORDER BY id_anuncio) AS "Pr�ximo"
FROM 
    (SELECT id_anuncio, ds_anuncio 
     FROM t_anuncio 
     WHERE ROWNUM <= 5 -- Certifica-se de que haja pelo menos 5 linhas para o relat�rio
     ORDER BY id_anuncio);

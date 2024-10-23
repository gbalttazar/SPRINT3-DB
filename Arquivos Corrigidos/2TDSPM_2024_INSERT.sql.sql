
INSERT INTO t_cliente (id_cliente, nm_cliente) VALUES (101, 'Gabriel Baltazar');
INSERT INTO t_cliente (id_cliente, nm_cliente) VALUES (102, 'Pedro Gomes');
INSERT INTO t_cliente (id_cliente, nm_cliente) VALUES (103, 'Leonardo Scott');
INSERT INTO t_cliente (id_cliente, nm_cliente) VALUES (104, 'Vinicius Camargo');
INSERT INTO t_cliente (id_cliente, nm_cliente) VALUES (105, 'Enzo Ross');

INSERT INTO t_empresa (id_empresa, cnpj, ds_email, nm_empresa, st_empresa, id_cliente) VALUES (10, 12345678901234, 'info@megaenterprise.com', 'Mega Enterprise', 'A', 101);
INSERT INTO t_empresa (id_empresa, cnpj, ds_email, nm_empresa, st_empresa, id_cliente) VALUES (20, 23456789012345, 'contact@giantcorp.com', 'Giant Corp', 'A', 102);
INSERT INTO t_empresa (id_empresa, cnpj, ds_email, nm_empresa, st_empresa, id_cliente) VALUES (30, 34567890123456, 'support@bigtech.com', 'Big Tech', 'I', 103);
INSERT INTO t_empresa (id_empresa, cnpj, ds_email, nm_empresa, st_empresa, id_cliente) VALUES (40, 45678901234567, 'sales@retailgiant.com', 'Retail Giant', 'A', 104);
INSERT INTO t_empresa (id_empresa, cnpj, ds_email, nm_empresa, st_empresa, id_cliente) VALUES (50, 56789012345678, 'admin@biz.com', 'Biz Inc', 'I', 105);

INSERT INTO t_email (id_email, ds_email, st_email, tp_email, id_empresa) VALUES (1, 'info@example.com', 'A', 'Work', 10);
INSERT INTO t_email (id_email, ds_email, st_email, tp_email, id_empresa) VALUES (2, 'contact@sample.com', 'A', 'Marketing', 20);
INSERT INTO t_email (id_email, ds_email, st_email, tp_email, id_empresa) VALUES (3, 'support@demo.com', 'I', 'Support', 30);
INSERT INTO t_email (id_email, ds_email, st_email, tp_email, id_empresa) VALUES (4, 'sales@retail.com', 'A', 'Sales', 40);
INSERT INTO t_email (id_email, ds_email, st_email, tp_email, id_empresa) VALUES (5, 'admin@website.com', 'I', 'Admin', 50);

INSERT INTO t_pais (id_pais, ds_pais, id_empresa) VALUES (1, 'Estados Unidos', 10);
INSERT INTO t_pais (id_pais, ds_pais, id_empresa) VALUES (2, 'França', 20);
INSERT INTO t_pais (id_pais, ds_pais, id_empresa) VALUES (3, 'Japão', 30);
INSERT INTO t_pais (id_pais, ds_pais, id_empresa) VALUES (4, 'Brasil', 40);
INSERT INTO t_pais (id_pais, ds_pais, id_empresa) VALUES (5, 'Nigéria', 50);

INSERT INTO t_regiao (id_regiao, ds_regiao, id_empresa, id_pais) VALUES (1, 'América do Norte', 10, 20);
INSERT INTO t_regiao (id_regiao, ds_regiao, id_empresa, id_pais) VALUES (2, 'Europa', 20, 30);
INSERT INTO t_regiao (id_regiao, ds_regiao, id_empresa, id_pais) VALUES (3, 'Ásia', 30, 40);
INSERT INTO t_regiao (id_regiao, ds_regiao, id_empresa, id_pais) VALUES (4, 'América do Sul', 40, 50);
INSERT INTO t_regiao (id_regiao, ds_regiao, id_empresa, id_pais) VALUES (5, 'África', 50, 70);

INSERT INTO t_cidade (id_cidade, ds_cidade, id_empresa, id_regiao, id_pais) VALUES (1, 'New York', 10, 1, 20);
INSERT INTO t_cidade (id_cidade, ds_cidade, id_empresa, id_regiao, id_pais) VALUES (2, 'Los Angeles', 10, 1, 20);
INSERT INTO t_cidade (id_cidade, ds_cidade, id_empresa, id_regiao, id_pais) VALUES (3, 'Chicago', 10, 1, 20);
INSERT INTO t_cidade (id_cidade, ds_cidade, id_empresa, id_regiao, id_pais) VALUES (4, 'Houston', 10, 1, 20);
INSERT INTO t_cidade (id_cidade, ds_cidade, id_empresa, id_regiao, id_pais) VALUES (5, 'Phoenix', 10, 1, 20);

INSERT INTO t_campanha (id_campanha, st_campanha, dt_inicio, dt_fim, ds_campanha) VALUES (1, 'A', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), 'Spring Sale');
INSERT INTO t_campanha (id_campanha, st_campanha, dt_inicio, dt_fim, ds_campanha) VALUES (2, 'I', TO_DATE('2023-05-01', 'YYYY-MM-DD'), NULL, 'Summer Introduction');
INSERT INTO t_campanha (id_campanha, st_campanha, dt_inicio, dt_fim, ds_campanha) VALUES (3, 'A', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'Mid Year Sale');
INSERT INTO t_campanha (id_campanha, st_campanha, dt_inicio, dt_fim, ds_campanha) VALUES (4, 'A', TO_DATE('2023-09-01', 'YYYY-MM-DD'), NULL, 'Fall Collection Launch');
INSERT INTO t_campanha (id_campanha, st_campanha, dt_inicio, dt_fim, ds_campanha) VALUES (5, 'I', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'Holiday Deals');

INSERT INTO t_anuncio (id_anuncio, ds_anuncio, categ_anuncio, dt_inicio, dt_fim, id_campanha) VALUES (1, 'Anúncio 1', 'Categoria 1', TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 1);
INSERT INTO t_anuncio (id_anuncio, ds_anuncio, categ_anuncio, dt_inicio, dt_fim, id_campanha) VALUES (2, 'Anúncio 2', 'Categoria 2', TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), 2);
INSERT INTO t_anuncio (id_anuncio, ds_anuncio, categ_anuncio, dt_inicio, dt_fim, id_campanha) VALUES (3, 'Anúncio 3', 'Categoria 3', TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'), 3);
INSERT INTO t_anuncio (id_anuncio, ds_anuncio, categ_anuncio, dt_inicio, dt_fim, id_campanha) VALUES (4, 'Anúncio 4', 'Categoria 4', TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 4);
INSERT INTO t_anuncio (id_anuncio, ds_anuncio, categ_anuncio, dt_inicio, dt_fim, id_campanha) VALUES (5, 'Anúncio 5', 'Categoria 5', TO_DATE('2024-05-13', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 5);

INSERT INTO t_associacao (id_campanha, id_cliente) VALUES (1, 101);
INSERT INTO t_associacao (id_campanha, id_cliente) VALUES (2, 102);
INSERT INTO t_associacao (id_campanha, id_cliente) VALUES (3, 103);
INSERT INTO t_associacao (id_campanha, id_cliente) VALUES (4, 104);
INSERT INTO t_associacao (id_campanha, id_cliente) VALUES (5, 105);

INSERT INTO t_associacao2 (id_campanha, id_email) VALUES (1, 101);
INSERT INTO t_associacao2 (id_campanha, id_email) VALUES (2, 102);
INSERT INTO t_associacao2 (id_campanha, id_email) VALUES (3, 103);
INSERT INTO t_associacao2 (id_campanha, id_email) VALUES (4, 104);
INSERT INTO t_associacao2 (id_campanha, id_email) VALUES (5, 105);

INSERT INTO t_ia (id_ia, ds_ia, tp_ia, acuracia, st_ia, id_empresa) VALUES (1, 'Customer Insight', 'Machine Learning', '10%', 'A', 10);
INSERT INTO t_ia (id_ia, ds_ia, tp_ia, acuracia, st_ia, id_empresa) VALUES (2, 'Market Predictor', 'Deep Learning', '20%', 'A', 20);
INSERT INTO t_ia (id_ia, ds_ia, tp_ia, acuracia, st_ia, id_empresa) VALUES (3, 'Social Analyzer', 'NLP', '30%', 'I', 30);
INSERT INTO t_ia (id_ia, ds_ia, tp_ia, acuracia, st_ia, id_empresa) VALUES (4, 'Sales Optimizer', 'AI', '40%', 'A', 40);
INSERT INTO t_ia (id_ia, ds_ia, tp_ia, acuracia, st_ia, id_empresa) VALUES (5, 'Conversion Enhancer', 'Machine Learning', '50%', 'I', 50);

INSERT INTO t_fonte_dados (id_fonte_dados, nm_fonte_dados, tp_fonte_dados, ds_fonte_dados, url, id_ia) VALUES (1, 'Internal CRM', 'Database', 'Customer data from CRM', 'http://crm.example.com', 1);
INSERT INTO t_fonte_dados (id_fonte_dados, nm_fonte_dados, tp_fonte_dados, ds_fonte_dados, url, id_ia) VALUES (2, 'Market Research', 'API', 'External market data', 'http://marketapi.com', 2);
INSERT INTO t_fonte_dados (id_fonte_dados, nm_fonte_dados, tp_fonte_dados, ds_fonte_dados, url, id_ia) VALUES (3, 'Social Media', 'API', 'User data from social platforms', 'http://socialapi.com', 3);
INSERT INTO t_fonte_dados (id_fonte_dados, nm_fonte_dados, tp_fonte_dados, ds_fonte_dados, url, id_ia) VALUES (4, 'E-commerce', 'Web Scraping', 'Product data from websites', 'http://ecommerce.com', 4);
INSERT INTO t_fonte_dados (id_fonte_dados, nm_fonte_dados, tp_fonte_dados, ds_fonte_dados, url, id_ia) VALUES (5, 'Analytics Tool', 'Software', 'Data from analytics tool', 'http://analytics.com', 5);


INSERT INTO t_previsao_tendencia (id_previsao_tendencia, dt_previsao_tendencia, acuracia, id_ia) VALUES (8, TO_DATE('2023-04-01', 'YYYY-MM-DD'), '5%', 1);
INSERT INTO t_previsao_tendencia (id_previsao_tendencia, dt_previsao_tendencia, acuracia, id_ia) VALUES (9, TO_DATE('2023-04-02', 'YYYY-MM-DD'), '10%', 2);
INSERT INTO t_previsao_tendencia (id_previsao_tendencia, dt_previsao_tendencia, acuracia, id_ia) VALUES (12, TO_DATE('2023-04-03', 'YYYY-MM-DD'), '15%', 3);
INSERT INTO t_previsao_tendencia (id_previsao_tendencia, dt_previsao_tendencia, acuracia, id_ia) VALUES (20, TO_DATE('2023-04-04', 'YYYY-MM-DD'), '20%', 4);
INSERT INTO t_previsao_tendencia (id_previsao_tendencia, dt_previsao_tendencia, acuracia, id_ia) VALUES (30, TO_DATE('2023-04-05', 'YYYY-MM-DD'), '25%', 5);


INSERT INTO t_resultado (id_resultado, id_ia) VALUES (15, 1);
INSERT INTO t_resultado (id_resultado, id_ia) VAlUES (25,  2);
INSERT INTO t_resultado (id_resultado, id_ia) VALUES (35,  3);
INSERT INTO t_resultado (id_resultado, id_ia) VALUES (45,  4);
INSERT INTO t_resultado (id_resultado, id_ia) VALUES (55, 5);


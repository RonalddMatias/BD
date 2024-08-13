CREATE TABLE filiais (
	id_filial INT AUTO_INCREMENT PRIMARY KEY,
	nome_filial TEXT,
	email_contato TEXT
);

CREATE TABLE vendas (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
	id_filial INT,
	quantidade_vendida INTEGER,
	mes_venda INTEGER,
	FOREIGN KEY (id_filial) REFERENCES filiais(id_filial)
);

INSERT INTO vendas (id_filial, quantidade_vendida, mes_venda)
VALUES
	(1, 5500, 1),
	(2, 4800, 1),
	(3, 6000, 1),
	(1, 5200, 2),
	(2, 4800, 2),
	(3,  5900, 2);
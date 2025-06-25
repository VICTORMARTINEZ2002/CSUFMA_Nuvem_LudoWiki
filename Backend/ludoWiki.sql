/*========================================================*/
/*                         CREATE         				  */
/* =======================================================*/


CREATE TABLE genero (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
);

CREATE TABLE jogo (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao TEXT    NOT NULL,
	img TEXT          NOT NULL,				-- path front
	max_players INT   NOT NULL,
	duracao TIME      NOT NULL,
	ano      INT      NOT NULL CHECK (ano >= 1950 AND ano <= EXTRACT(YEAR FROM CURRENT_DATE)),
	genero   INT      NOT NULL,
	manual  TEXT          NULL,            -- link_s3

	FOREIGN KEY (genero) REFERENCES genero(id)
);

CREATE TABLE extensao (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	jogo_base INT     NOT NULL,
	descricao TEXT    NOT NULL,
	img TEXT          NOT NULL,               -- link
	manual TEXT           NULL,            -- link_s3
	ano     INT       NOT NULL CHECK (ano >= 1950 AND ano <= EXTRACT(YEAR FROM CURRENT_DATE)),
	
	FOREIGN KEY (jogo_base) REFERENCES jogo(id)
);

CREATE TABLE noticia (
	id SERIAL PRIMARY KEY,
	jogo INT           NOT NULL,
	title VARCHAR(200) NOT NULL,
	body TEXT          NOT NULL,

	FOREIGN KEY (jogo) REFERENCES jogo(id)
);



/*========================================================*/
/*                         INSERT         				  */
/* =======================================================*/
INSERT INTO genero (nome) VALUES
('Estratégia'),('Aventura'),('Família'),
('Party Game'),('RPG'),('Cooperativo'),
('Educativo'),('Cartas'),('Clássico');


INSERT INTO jogo (nome, descricao, img, max_players, duracao, manual, ano, genero) VALUES
	('Coup',
		'Um jogo de blefe e dedução social, onde jogadores lutam pelo controle político através de influência e engano.',
		'/images/coup.jpg',
		6,
		'00:15:00',
		'https://s3.aws.com/manuals/coup.pdf',
		2012,
		1),

	('WAR',
		'Clássico jogo de conquista mundial onde o objetivo é dominar territórios usando estratégia militar.',
		'/images/war.jpg',
		6,
		'02:00:00',
		'https://s3.aws.com/manuals/war.pdf',
		1972,
		1),

	('Catan',
		'Um jogo de colonização de ilhas com comércio e estratégia.',
		'/images/catan.jpg',
		4,
		'01:00:00',
		'https://s3.aws.com/manuals/catan.pdf',
		1995,
		1),

	('Jenga',
		'Remova blocos de uma torre sem deixá-la cair. Simples e tenso!',
		'/images/jenga.jpg',
		8,
		'00:20:00',
		'https://s3.aws.com/manuals/jenga.pdf',
		1983,
		3),

	('Detetive',
		'Descubra quem cometeu o crime usando lógica e eliminação.',
		'/images/detetive.jpg',
		6,
		'01:00:00',
		'https://s3.aws.com/manuals/detetive.pdf',
		1975,
		9),

	('Uno',
		'Clássico jogo de cartas onde o objetivo é se livrar de todas as cartas.',
		'/images/uno.jpg',
		10,
		'00:20:00',
		'https://s3.aws.com/manuals/uno.pdf',
		1992,
		8),

	('Zombicide',
		'Cooperativo com miniaturas onde jogadores enfrentam hordas de zumbis.',
		'/images/zombicide.jpg',
		6,
		'01:30:00',
		'https://s3.aws.com/manuals/zombicide.pdf',
		2012,
		6),

	('Ticket to Ride',
		'Construa rotas de trem conectando cidades em um mapa estratégico.',
		'/images/ticket.jpg',
		5,
		'01:00:00',
		'https://s3.aws.com/manuals/ticket.pdf',
		2004,
		1),

	('Dixit',
		'Jogo de associação de imagens e criatividade com ilustrações oníricas.',
		'/images/dixit.jpg',
		6,
		'00:30:00',
		'https://s3.aws.com/manuals/dixit.pdf',
		2008,
		2),

	('Dobble',
		'Jogo rápido de reconhecimento visual e reflexos com cartas redondas.',
		'/images/dobble.jpg',
		8,
		'00:15:00',
		'https://s3.aws.com/manuals/dobble.pdf',
		2010,
		4),

	('Carcassonne',
		'Monte mapas medievais com peças de terreno e controle regiões.',
		'/images/carcassonne.jpg',
		5,
		'00:45:00',
		'https://s3.aws.com/manuals/carcassonne.pdf',
		2000,
		9),

	('Jogo da Vida',
		'Simulação da vida adulta: carreira, casamento, filhos e aposentadoria.',
		'/images/vida.jpg',
		6,
		'01:20:00',
		'https://s3.aws.com/manuals/vida.pdf',
		1980,
		3);



INSERT INTO extensao (nome, jogo_base, descricao, img, manual, ano) VALUES
	('Coup - A Inquisição', 1,
		'Expansão tensa com perseguição política e poderes secretos da inquisição.',
		'/images/Inquisicao.jpg', NULL,
		2017),

	('Coup - Burguês & Benfeitor', 1,
		'Novos personagens focados em influência econômica e apoio político.',
		'/images/Burgues_Benfeitor.jpg', NULL,
		2018),

	('Coup - Bufão & Burocrata', 1,
		'Cartas que adicionam caos e manipulação governamental ao jogo base.',
		'/images/Bufao_Burocrata.jpg', NULL,
		2019),

	('Catan - Navegadores', 3,
		'Expansão com ilhas marítimas, navios e exploração.',
		'/images/navegadores.jpg', NULL,
		1997),

	('WAR: Império Romano',2,
		'Expansão temática baseada no período romano com novas regras e exércitos.',
		'/images/war_imperio_romano.jpg', NULL,
		1985),

	('Jenga Giant', 4,
		'Versão gigante com blocos maiores e regras para partidas em equipe.',
		'/images/jenga_giant.jpg', NULL,
		2009),

	('Zombicide: Toxic City Mall', 7,
		'Nova campanha com cenário de shopping center infestado de zumbis.',
		'/images/zombicide_toxic.jpg', NULL,
		2013);


INSERT INTO noticia (jogo, title, body) VALUES
	(1,
		'Coup ganha expansão inédita: A Inquisição',
		'Prepare-se para novas estratégias e traições com a expansão "A Inquisição" que chega este ano.'),
	(2,
		'WAR celebra 50 anos com nova edição limitada',
		'A clássica disputa por territórios volta em versão especial com miniaturas aprimoradas e regras expandidas.'),
	(3,
		'Catan volta às prateleiras com expansão Navegadores',
		'Explore o mar e novas ilhas nesta expansão que promete renovar suas partidas.'),
	(4,
		'Jenga Giant: diversão em tamanho família',
		'A nova versão gigante do Jenga chega com blocos maiores para mais emoção em grupo.'),
	(7,
		'Zombicide lança campanha Toxic City Mall',
		'Novas missões e zumbis aterrorizantes chegam na expansão ambientada em um shopping abandonado.'),
	(8,
		'Ticket to Ride: novidades no mapa da Europa',
		'Expansão adiciona túneis e estações para aumentar o desafio e a diversão.'),
	(9,
		'Dixit: criatividade sem limites com novas cartas',
		'A popular expansão "Revelations" adiciona 84 cartas para ampliar as possibilidades do jogo.'),
	(6,
		'Uno: torneio nacional com prêmios incríveis',
		'O clássico jogo de cartas terá campeonato aberto a jogadores de todo o país, com streaming ao vivo.'),
	(11,
		'Carcassonne apresenta Feira e Mercado',
		'Novas peças e regras que prometem renovar as estratégias dos fãs do jogo de construção.'),
	(12,
		'Jogo da Vida lança versão digital interativa',
		'A experiência clássica agora no seu smartphone, com recursos multiplayer e estatísticas detalhadas.');

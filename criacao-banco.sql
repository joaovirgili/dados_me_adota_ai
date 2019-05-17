-- criação do banco;
create database MeAdotaAi;
use MeAdotaAi;

-- criação das tabelas;
create table Usuario (
	cpf varchar(11) primary key,
    nome varchar(255),
    email varchar(255)
);
create table Pet (
	id int auto_increment primary key,
    porte varchar(255),
    nome varchar(255),
    raca varchar(255),
    foto varchar(255),
    pet_id int,
    usuario_cpf varchar(11),
    foreign key (pet_id) references Pet(id),
    foreign key (usuario_cpf) references Usuario(cpf)
);
create table Localizacao (
	id int auto_increment primary key,
    rua varchar(255),
    bairro varchar(255),
    numero int,
    complemento varchar(255),
    ponto_referencia varchar(255)
);
create table Anuncio (
	id int auto_increment primary key,
    data date,
    titulo varchar(255),
    descricao varchar(255),
    pet_id int,
    usuario_cpf varchar(11),
    foreign key (pet_id) references Pet(id),
    foreign key (usuario_cpf) references Usuario(cpf)
);
create table Clinica (
	cnpj varchar(14) primary key,
    nome varchar(255),
    localizacao_id int,
    foreign key (localizacao_id) references Localizacao(id)
);
create table Atendimento (
	id int auto_increment primary key,
    valor float,
    data date,
    clinica_cnpj varchar(14),
    pet_id int,
    vak_id int,
    foreign key (clinica_cnpj) references Clinica(cnpj),
    foreign key (pet_id) references Pet(id)
);
create table Vakinha (
	id int auto_increment primary key,
    data_inicio date,
    data_final date,
    meta float,
    saldo_atual float,
    cpf_usuario varchar(11),
    id_atendimento int,
    foreign key (cpf_usuario) references Usuario(cpf),
    foreign key (id_atendimento) references Atendimento(id)
);
alter table Atendimento add constraint vak_id foreign key (vak_id) references Vakinha (id);

create table CCZoonoses (
	cnpj varchar(14) primary key,
    area_atuacao varchar(255),
    id_localizacao int,
    foreign key (id_localizacao) references Localizacao(id)
);
create table ONG (
	cnpj varchar(14) primary key,
    nome varchar(255),
    sigla varchar(3),
    id_localizacao int,
    foreign key (id_localizacao) references Localizacao(id)
);
create table Feira_Adocao (
	id int auto_increment primary key,
    data date,
    hora_abre time,
    hora_fecha time,
    id_localizacao int,
    ccz_cnpj varchar(14),
    ong_cnpj varchar(14),
    foreign key (id_localizacao) references Localizacao(id),
    foreign key (ccz_cnpj) references CCZoonoses(cnpj),
    foreign key (ong_cnpj) references ONG(cnpj)
);
create table Feira_Vacina (
	id int auto_increment primary key,
    data date,
    hora_abre time,
    hora_fecha time,
    id_localizacao int,
    ccz_cnpj varchar(14),
    foreign key (id_localizacao) references Localizacao(id),
    foreign key (ccz_cnpj) references CCZoonoses(cnpj)
);

-- INSERT INTO Usuario VALUES ("93810070041", "João Castro", "joaocastro@gmail.com");
-- INSERT INTO Usuario VALUES ("43693981000", "Mario Almeida", "marioalmeida@gmail.com");

-- INSERT INTO Pet VALUES(0,"Grande", "Brigadeiro", "Vira-Lata", "fotosim");
-- INSERT INTO Pet VALUES(2,"Pequeno", "Forasteiro", "YorkShire", "fotosim");

-- INSERT INTO Anuncio VALUES(0, '2019-04-01', "AsdeMangas", "Tira da Cartola");

-- INSERT INTO Clinica VALUES("34512285000116","AmigoPet",'2019-05-15',1);
-- INSERT INTO Clinica VALUES("51669924000116","PetLove",'2019-05-15', 5);

-- INSERT INTO Atendimento VALUES(0, 215.50, '2015-05-15', "51669924000116",1,1);

-- INSERT INTO Vakinha VALUES(0, '2019-05-02', '2019-05-15', 215.50, 1.00, "93810070041", 1);

-- INSERT INTO ONG VALUES("16776017000175", "Terra Vida", "TV", 1);

-- INSERT INTO Feira_Adocao VALUES(0, '2019-05-15', "06:00", "18:00", 1, "null" ,"16776017000175");

-- INSERT INTO Localizacao VALUES (5,"Rua Graça Ribeiro", "Salvador", 144, "naopossui", "proximo ao colegio militar do pau miudo");
-- INSERT INTO Localizacao VALUES (1,"Rua Barão de Capanema", "Salvador", 528, "naopossui", "proximo a delicatessen");


-- SELECT porte, nome
-- FROM Pet;

-- SELECT*
-- FROM Vakinha
-- WHERE (saldo_atual < meta);

-- SELECT*
-- FROM ONG
-- WHERE id_localizacao >= 1;

-- SELECT*
-- FROM Localizacao
-- WHERE Localizacao.id = 1;


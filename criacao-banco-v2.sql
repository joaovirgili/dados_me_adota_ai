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
    foto varchar(255)
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
    status bool,
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
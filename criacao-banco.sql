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

INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/30','70279428286',6,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/27','75515507983',92,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/18','98506851238',53,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/8','03895619400',59,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/9','45612616562',32,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/25','45733978929',18,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/3','46241274201',58,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/8','28064459656',93,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/26','35753742793',2,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/5','51974043452',94,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/23','99544284532',4,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/5','26256205600',30,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/14','17962467436',67,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/21','19846644507',1,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/24','08767434401',54,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/20','70733431763',65,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/27','80678328978',64,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/15','22009364007',8,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/24','77227403599',45,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/1','76910300106',39,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/26','47045437145',68,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/8','62328366007',78,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/12','30572736967',79,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/15','53547307597',0,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/15','53882074639',25,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/2','10528979248',55,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/9','91066829799',97,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/25','14413770420',75,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/21','55021199803',7,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/27','52064109501',74,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/12','44826040547',73,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/3','37333909204',66,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/30','78901775425',33,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/18','99578692137',82,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/29','77652006660',98,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/14','48586115312',36,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/30','81849955980',62,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/9','56258903908',85,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/5','64639546408',47,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/24','26389895330',96,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/23','71399333917',40,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/8','66527798890',31,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/17','50618781757',43,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/11','28010077062',52,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/30','92386880281',63,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/9','98144429842',71,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/5','34627484836',57,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/27','02371593176',24,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/11','83625984504',38,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/10','92829478665',5,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/21','56126400135',72,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/14','94520403782',19,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/21','64884004280',21,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/10','80071130373',83,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/18','05944995939',51,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/24','20523737300',3,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/2','24474322320',27,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/12','12624839640',88,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/13','27225797743',35,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/19','54656337609',11,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/30','27117082682',90,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/13','71340961571',37,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/29','05643190311',42,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/13','36218875393',9,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/3/26','32056274230',80,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/8','52175390543',17,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/8','55069034561',60,true);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/1/3','39858139578',41,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/2/25','66862176978',77,false);
INSERT INTO Anuncio (data, usuario_cpf, pet_id, status) values ('2019/4/20','22552807011',26,false);
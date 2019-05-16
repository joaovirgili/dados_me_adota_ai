const chance = require('chance')();
const createCsvWriter = require('csv-writer').createObjectCsvWriter;

const dominios = ['@gmail.com', '@yahoo.com', '@outlook.com.br', '@hotmail.com', '@bol.com.br', '@live.com', '@live.com']
const racas = ['Vira-lata', 'Shih-Tzu', 'Yorkshire', 'Poodle', 'Lhasa Apso', 'Buldogue Francês', 'Maltês', 'Golden Retriever', 'Labrador', 'Pug', 'Pastor Alemão',
    'Dachshund', 'Pinscher', 'Schnauzer', 'Spitz Alemão', 'Beagle', 'Border Collie', 'Buldogue Inglês', 'Cocker Spaniel', 'Chow Chow', 'Pitbull', 'Rotweiller', 'Boxer',
    'Dobermann', 'Bull Terrier', 'Basset Hound'];
const pets_nomes = ['Bob', 'Mike', 'Costelinha', 'Jeremias', 'Plínio', 'Touben', 'Teca', 'Mel', 'Luna', 'Marvin', 'Chicho', 'Kiko'];

const lista_cpf = [];
const lista_petId = [];
const lista_anuncio = [];
const usuario_com_pet = [];

const usuarios = [];
const pets = [];

const NUM_PETS = 100;
const NUM_USUARIOS = 150;
const NUM_ANUNCIOS = 70;
const NUM_VAKINHAS = 30;
const NUM_CLINICAS = 15;


/**
 * Gera pet com os dados aleatórios.
 */
function geraPet(i) {
    let raca = racas[Math.floor((Math.random() * racas.length) + 1) - 1];
    return { raca: raca, porte: '', foto: '', nome: pets_nomes[i] ? pets_nomes[i] : '' }
}

/**
 * Gera usuário com os dados aleatórios.
 */
function geraUsuario() {
    const nome_aleatorio = chance.name({ nationality: 'en' });
    const nome = nome_aleatorio.split(' ')[0].toLowerCase();
    const sobrenome = nome_aleatorio.split(' ')[1].toLowerCase();
    const email = nome + '_' + sobrenome + dominios[Math.floor((Math.random() * 7) + 1) - 1];
    const cpf = chance.cpf().replace(/[^\d]+/g, '');

    return { nome: nome_aleatorio, email: email, cpf: cpf.toString() };
}

function geraOsDados() {

    for (let i = 0; i < NUM_USUARIOS; i++) {
        const usuario = geraUsuario();
        if (usuario.cpf.length === 11) {
            usuarios.push(usuario);
        }
    }


    for (let i = 0; i < NUM_PETS; i++) {
        const pet = geraPet(i);
        pets.push(pet);
    }
}

function escreveCsv() {

    createCsvWriter({
        path: 'csv/usuarios.csv',
        header: [
            { id: 'cpf', title: 'cpf' },
            { id: 'email', title: 'email' },
            { id: 'nome', title: 'nome' },
        ]
    }).writeRecords(usuarios).then(() => console.log('The CSV file was written successfully'));

    createCsvWriter({
        path: 'csv/pets.csv',
        header: [
            { id: 'porte', title: 'porte' },
            { id: 'nome', title: 'nome' },
            { id: 'raca', title: 'raca' },
            { id: 'foto', title: 'foto' },
        ]
    }).writeRecords(pets).then(() => console.log('The CSV file was written successfully'));

    createCsvWriter({
        path: 'csv/vakinhas.csv',
        header: [
            { id: 'data_inicio', title: 'data_inicio' },
            { id: 'data_final', title: 'data_final' },
            { id: 'meta', title: 'meta' },
            { id: 'saldo_atual', title: 'saldo_atual' },
            { id: 'cpf_usuario', title: 'cpf_usuario' },
            { id: 'id_atendimento', title: 'id_atendimento' },
        ]
    }).writeRecords(pets).then(() => console.log('The CSV file was written successfully'));
}

geraOsDados();
escreveCsv();
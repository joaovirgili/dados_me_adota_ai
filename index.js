const chance = require('chance')();
const createCsvWriter = require('csv-writer').createObjectCsvWriter;

const dominios = ['@gmail.com', '@yahoo.com', '@outlook.com.br', '@hotmail.com', '@bol.com.br', '@live.com', '@live.com']
const racas = ['Vira-lata', 'Shih-Tzu', 'Yorkshire', 'Poodle', 'Lhasa Apso', 'Buldogue Francês', 'Maltês', 'Golden Retriever', 'Labrador', 'Pug', 'Pastor Alemão',
    'Dachshund', 'Pinscher', 'Schnauzer', 'Spitz Alemão', 'Beagle', 'Border Collie', 'Buldogue Inglês', 'Cocker Spaniel', 'Chow Chow', 'Pitbull', 'Rotweiller', 'Boxer',
    'Dobermann', 'Bull Terrier', 'Basset Hound'];
const pets_nomes = ['Bob', 'Mike', 'Costelinha', 'Jeremias', 'Plínio', 'Touben', 'Teca', 'Mel', 'Luna', 'Marvin', 'Chicho', 'Kiko'];
const ano_passado_meses = [11, 10, 09, 08, 07, 06];
const ano_atual_meses = [0, 01, 02, 03];
const duracao_vakinha = [30, 40, 50, 60, 70, 80, 90, 100, 110, 120];

const lista_cpf = [];
const lista_petId = [];
const lista_anuncio = [];
const usuario_com_pet = [];

const usuarios = [];
const pets = [];
const anuncios = [];

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
    return { id: i, raca: raca, porte: '', foto: '', nome: pets_nomes[i] ? pets_nomes[i] : '' }
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

function geraAnuncio(i) {
    let data;
    if (i < 40) {
        data = chance.date({ american: true, year: 2018, month: Math.floor((Math.random() * ano_passado_meses.length) + 1) - 1 });
    } else {
        data = chance.date({ american: true, year: 2019, month: Math.floor((Math.random() * ano_atual_meses.length) + 1) - 1 });
    }

    const cpf_usuario = associaAnuncioUsuario();
    const pet_id = associaAnuncioPet();
    const status = Math.floor((Math.random() * 2) + 1) == 1;
    const anuncio = {
        data: data.getFullYear() + '/' + (data.getMonth() + 1) + '/' + data.getDate(),
        cpf_usuario: cpf_usuario,
        pet_id: pet_id,
        status: status,
        titulo: '',
        descricao: '',
    }

    return anuncio;
}

function associaAnuncioPet() {
    let idx = Math.floor((Math.random() * pets.length - 1) + 1);
    let pet = pets[idx];

    console.log(pet);

    while (pet.associado) {
        idx = Math.floor((Math.random() * pets.length - 1) + 1);
        pet = pets[idx];
    }

    pet.associado = true;

    return pet.id;
}

function associaAnuncioUsuario() {
    let idx = Math.floor((Math.random() * usuarios.length - 1) + 1);
    let usuario = usuarios[idx];

    while (usuario.associado) {
        idx = Math.floor((Math.random() * usuarios.length - 1) + 1);
        usuario = usuarios[idx];
    }

    usuario.associado = true;

    return usuario.cpf;
}

function geraOsDados() {

    for (let i = 0; i < NUM_USUARIOS; i++) {
        usuarios.push(geraUsuario());
    }

    for (let i = 0; i < NUM_PETS; i++) {
        pets.push(geraPet(i));
    }

    for (let i = 0; i < NUM_ANUNCIOS; i++) {
        anuncios.push(geraAnuncio());
    }

    console.log(anuncios);
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

    // createCsvWriter({
    //     path: 'csv/vakinhas.csv',
    //     header: [
    //         { id: 'data_inicio', title: 'data_inicio' },
    //         { id: 'data_final', title: 'data_final' },
    //         { id: 'meta', title: 'meta' },
    //         { id: 'saldo_atual', title: 'saldo_atual' },
    //         { id: 'cpf_usuario', title: 'cpf_usuario' },
    //         { id: 'id_atendimento', title: 'id_atendimento' },
    //     ]
    // }).writeRecords(pets).then(() => console.log('The CSV file was written successfully'));

    createCsvWriter({
        path: 'csv/anuncios.csv',
        header: [
            { id: 'data', title: 'data' },
            { id: 'titulo', title: 'titulo' },
            { id: 'descricao', title: 'descricao' },
            { id: 'cpf_usuario', title: 'cpf_usuario' },
            { id: 'pet_id', title: 'pet_id' },
            { id: 'status', title: 'status' },
        ]
    }).writeRecords(anuncios).then(() => console.log('The CSV file was written successfully'));
}

geraOsDados();
escreveCsv();
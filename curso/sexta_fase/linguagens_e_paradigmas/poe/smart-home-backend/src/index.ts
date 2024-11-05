/**
 * Importação das bibliotecas necessárias
 */
import express from 'express';
import http from 'http';
import { Server } from 'socket.io';
import cors from 'cors';

/**
 * Configuração do servidor Express
 */
const app = express();
app.use(cors());

/**
 * Criação do servidor HTTP e do servidor Socket.IO
 */
const server = http.createServer(app);
const io = new Server(server, {
    cors: {
        origin: "http://localhost:3000", //URL do Front-End React
        methods: ["GET", "POST"],
    }
});

//estado inicial dos dispositivos
let dispositivosSala = {
    luzOn: false,
    tvOn: false,
    tvCanal: '1',
    arOn: false,
    arTemp: 20,
}
let dispositivosCozinha = {
    luzOn: false,
    fogaoOn: false,
    fogaoPot: 20,
    geladeiraTemp: 0,
}
let dispositivosQuarto = {
    luzOn: false,
    cortinaOn: false,
    ventiladorOn: false,
    ventiladorVel: 1,
}

//escuta os eventos de conexao do socket
io.on('connection', (socket) => {
    console.log('Cliente conectado', socket.id)

    //enviando o estado inicial dos dispositivos para o cliente
    socket.emit('estadoInicialSala',dispositivosSala);
    socket.emit('estadoInicialCozinha',dispositivosCozinha);

    //manipulando os eventos e mudançcas do estado dos dispositivos
    socket.on('acenderLuzSala',() => {
        dispositivosSala.luzOn = !dispositivosSala.luzOn;
        io.emit('acenderLuzSala', dispositivosSala);
    });
    socket.on('ligarTvSala', () => {
        dispositivosSala.tvOn = !dispositivosSala.tvOn;
        io.emit('ligarTvSala',dispositivosSala);
    });
    socket.on('ligarArSala',() => {
        dispositivosSala.arOn = !dispositivosSala.arOn;
        io.emit('ligarArSala',dispositivosSala);
    });

    //cozinha
    socket.on('acenderLuzCozinha', () => {
        dispositivosCozinha.luzOn = !dispositivosCozinha.luzOn;
        io.emit('acenderLuzCozinha',dispositivosCozinha);
    });
});


//Iniciar Servidor npm start
const PORT = 4000;
server.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
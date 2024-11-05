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
    socket.emit('estadoInicialSala', dispositivosSala);
    socket.emit('estadoInicialCozinha', dispositivosCozinha);
    socket.emit('estadoInicialQuarto', dispositivosQuarto);

    //manipulando os eventos e mudanças do estado dos dispositivos

    //sala
    socket.on('acenderLuzSala', () => {
        dispositivosSala.luzOn = !dispositivosSala.luzOn;
        io.emit('acenderLuzSala', dispositivosSala);
    });
    socket.on('ligarTvSala', () => {
        dispositivosSala.tvOn = !dispositivosSala.tvOn;
        io.emit('ligarTvSala', dispositivosSala);
    });
    socket.on('alterarCanalTv', (sCanal : string) => {
        dispositivosSala.tvCanal = sCanal;
        io.emit('alterarCanalTv', sCanal);
    });
    socket.on('ligarArSala', () => {
        dispositivosSala.arOn = !dispositivosSala.arOn;
        io.emit('ligarArSala', dispositivosSala);
    });
    socket.on('alterarTempAr', (iTemp : number) => {
        dispositivosSala.arTemp = iTemp;
        io.emit('alterarTempAr', iTemp);
    });

    //cozinha
    socket.on('acenderLuzCozinha', () => {
        dispositivosCozinha.luzOn = !dispositivosCozinha.luzOn;
        io.emit('acenderLuzCozinha', dispositivosCozinha);
    });
    socket.on('ligarFogaoCozinha', () => {
        dispositivosCozinha.fogaoOn = !dispositivosCozinha.fogaoOn;
        io.emit('ligarFogaoCozinha', dispositivosCozinha);
    });
    socket.on('alterarPotenciaFogao', (iPot : number) => {
        dispositivosCozinha.fogaoPot = iPot;
        io.emit('alterarPotenciaFogao', iPot);
    });
    socket.on('alterarTemperaturaGeladeira', (iTemp : number) => {
        dispositivosCozinha.geladeiraTemp = iTemp;
        io.emit('alterarTemperaturaGeladeira', iTemp);
    });

    //quarto
    socket.on('acenderLuzQuarto', () => {
        dispositivosQuarto.luzOn = !dispositivosQuarto.luzOn;
        io.emit('acenderLuzQuarto', dispositivosQuarto);
    });
    socket.on('abrirCortinaQuarto', () => {
        dispositivosQuarto.cortinaOn = !dispositivosQuarto.cortinaOn;
        io.emit('abrirCortinaQuarto', dispositivosQuarto);
    });
    socket.on('ligarVentiladorQuarto', () => {
        dispositivosQuarto.ventiladorOn = !dispositivosQuarto.ventiladorOn;
        io.emit('ligarVentiladorQuarto', dispositivosQuarto);
    });
    socket.on('alterarVelVentilador', (iVel : number) => {
        dispositivosQuarto.ventiladorVel = iVel;
        io.emit('alterarVelVentilador', iVel);
    });
});


//Iniciar Servidor npm start
const PORT = 4000;
server.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
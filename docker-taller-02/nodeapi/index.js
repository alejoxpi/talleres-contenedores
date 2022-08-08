const express = require('express');
const { MongoClient } = require('mongodb');
const dateUtils = require('./FormatDate');
const mongoConnection = require('./db');
const app = express();
const port = 3000;

app.get('/insertar', async (req, res) => {
    const resultado = await insertar();
    res.send('INSERCIONES TERMINADAS!');
})

app.get('/consultar', async (req, res) => {
    const resultado = await consultar();
    res.json(resultado);
})

app.get('/', (req, res) => {
    res.send('Esta aplicacion muestra como conectar, insertar y leer datos de MongoDB...');
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

async function insertar() {

    try {

        console.log(`${dateUtils.formatDate(new Date())} SE INICIA EL PROCESO DE CONEXION A MONGO`);

        let database = await mongoConnection.conectar();
        const haiku = database.collection("coleccionDocker02");

        const rndInt = randomIntFromInterval(1, 10)

        for (i = 1; i <= rndInt; i++) {

            const doc = {
                title: "Nombre del documento " + i,
                content: "Todo sobre ruedas usando MongoDB",
            }

            const result = await haiku.insertOne(doc);
            console.log(`DOCUMENTO INSERTADO ID: ${result.insertedId}`);
        }

        console.log(`${dateUtils.formatDate(new Date())} DOCUMENTOS EN MONGO FUE INSERTADO CON EXITO. Numero de documento: ${rndInt}`);

        return rndInt;

    } catch (err) {
        console.error(err);
    }

}

async function consultar() {

    var listadoConsulta = [];

    try {

        let database = await mongoConnection.conectar();

        console.info(`${dateUtils.formatDate(new Date())} CONECTADO A MONGO EXITOSAMENTE.`);

        const haiku = database.collection("coleccionDocker02");
        // create a document to insert

        const response = await haiku.find({});

        await response.forEach(
            x => {
                var elemento = {};
                elemento.id = x._id.toString();
                elemento.titulo = x.title;
                elemento.contenido = x.content;
                listadoConsulta.push(elemento);

            }
        );

        console.log(`NUMERO DE DOCUMENTOS ENCONTRADOS: ${listadoConsulta.length}`);

        console.log(`${dateUtils.formatDate(new Date())} DOCUMENTOS LEIDOS CON EXITO.`);

        return listadoConsulta;

    } catch (err) {
        console.error(err);
    }
}

function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min)
}
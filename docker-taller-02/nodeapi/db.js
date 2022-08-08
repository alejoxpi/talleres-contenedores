const { MongoClient } = require('mongodb');
const dateUtils = require('./FormatDate');
let _db;
let dbConection = "mongodb://mongoadmin:92a09f7ab296d2dee9cd@mongoserver:27017/dockerDBTaller2?authSource=admin";


module.exports = {

    conectar: async function()
    {
        console.log(`${dateUtils.formatDate(new Date())} SE INICIA EL PROCESO DE CONEXION A MONGO`);

        _client = new MongoClient(dbConection, {
            useUnifiedTopology: true,
            useNewUrlParser: true,
            keepAlive: true,
            socketTimeoutMS: 720000,
        });
      
        await _client.connect();
        _db = _client.db("dockerDBTaller2");

        return _db;
    }
}
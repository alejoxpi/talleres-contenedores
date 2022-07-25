const express = require('express')
const app = express()
const port = 3000

app.get('/hola/:nombre', (req, res) => {
    const resultado = {
        frase:"Hola Mundo!",
        nombre: req.params['nombre']
    }
    res.json(resultado);
})

app.listen(port, () => {
  console.log(`Aplicacion corriendo en el puerto ${port}`)
})
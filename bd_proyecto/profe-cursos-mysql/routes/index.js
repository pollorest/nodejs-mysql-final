/*const express = require('express');
const router = express.Router();

/* GET home page. */
/*router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;8*/

const express = require('express');
const app = express();

// Configurar EJS como el motor de plantillas
app.set('view engine', 'ejs');

// Definir la ruta para renderizar el archivo ver.ejs
app.get('/ver', (req, res) => {
  res.render('ver');
});

// Resto de la configuración y rutas de tu aplicación

// Iniciar el servidor
app.listen(80, () => {
  console.log('Servidor iniciado en el puerto 80');
});

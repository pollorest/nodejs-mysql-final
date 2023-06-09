const express = require('express');
const router = express.Router();

const profesorModel = require("../models/profesor");

router.get('/', function (req, res, next) {
    profesorModel
        .obtener()
        .then(profesor => {
            res.render("profesor/ver", {
                profesor: profesor,
            });
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo profesor");
        });

});

router.get('/agregar', function (req, res, next) {
    res.render("profesor/agregar");
});

router.post('/insertar', function (req, res, next) {
    const { nombre, apellido, edad } = req.body;
    if (!nombre || !apellido || !edad) {
        return res.status(500).send("Faltan datos");
    }
    profesorModel
        .insertar({ nombre, apellido, edad })
        .then(idProfesorInsertado => {
            res.redirect("/profesor");
        })
        .catch(err => {
            return res.status(500).send("Error insertando profesor");
        });
});

router.get('/eliminar/:id', function (req, res, next) {
    profesorModel
        .eliminar(req.params.id)
        .then(() => {
            res.redirect("/profesor");
        })
        .catch(err => {
            return res.status(500).send("Error eliminando profesor");
        });
});

router.get('/editar/:id', function (req, res, next) {
    profesorModel
        .obtenerPorId(req.params.id)
        .then(profesor => {
            if (profesor) {
                res.render("profesor/editar", {
                    profesor: profesor,
                });
            } else {
                return res.status(500).send("No existe profesor con ese id");
            }
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo profesor");
        });
});

router.post('/actualizar/', function (req, res, next) {
    const { id, nombre, apellido, edad } = req.body;
    if (!nombre || !apellido || !edad || !id) {
        return res.status(500).send("Faltan datos");
    }
    profesorModel
        .actualizar(id, { nombre, apellido, edad })
        .then(() => {
            res.redirect("/profesor");
        })
        .catch(err => {
            return res.status(500).send("Error actualizando profesor");
        });
});

module.exports = router;

// Path: bd_proyecto\profe-cursos-mysql\models\profesor.js
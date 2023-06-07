const express = require('express');
const router = express.Router();

const profesorModel = require("../models/profesor");

router.get('/', function (req, res, next) {
    profesorModel
        .obtener()
        .then(profesores => {
            res.render("profesor/ver", {
                profesores: profesores,
            });
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo profesores");
        });
});

router.get('/agregar', function (req, res, next) {
    res.render("profesor/agregar");
});

router.post('/insertar', function (req, res, next) {
    const { nombre, contraseña, telefono, email, area_principal, area_alternativa, id_usuario, identificador } = req.body;
    if (!nombre || !contraseña || !telefono || !email || !area_principal || !area_alternativa || !id_usuario || !identificador) {
        return res.status(500).send("Faltan datos requeridos");
    }
    profesorModel
        .insertar(nombre, contraseña, telefono, email, area_principal, area_alternativa, id_usuario, identificador)
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
    const { id, nombre, contraseña, telefono, email, area_principal, area_alternativa, id_usuario, identificador } = req.body;
    if (!id || !nombre || !contraseña || !telefono || !email || !area_principal || !area_alternativa || !id_usuario || !identificador) {
        return res.status(500).send("No hay suficientes datos");
    }
    profesorModel
        .actualizar(id, nombre, contraseña, telefono, email, area_principal, area_alternativa, id_usuario, identificador)
        .then(() => {
            res.redirect("/profesor");
        })
        .catch(err => {
            return res.status(500).send("Error actualizando profesor");
        });
});

module.exports = router;

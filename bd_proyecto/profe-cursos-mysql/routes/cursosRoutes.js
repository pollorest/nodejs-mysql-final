const express = require('express');
const router = express.Router();

const cursosModel = require("../models/cursos");

router.get('/', function (req, res, next) {
    cursosModel
        .obtener()
        .then(cursoss => {
            res.render("cursoss/ver", {
                cursoss: cursoss,
            });
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo cursoss");
        });
});

router.get('/agregar', function (req, res, next) {
    res.render("cursoss/agregar");
});

router.post('/insertar', function (req, res, next) {
    const { nombre, precio } = req.body;
    if (!nombre || !precio) {
        return res.status(500).send("No hay nombre o precio");
    }
    cursosModel
        .insertar({ nombre, precio })
        .then(idcursosInsertado => {
            res.redirect("/cursoss");
        })
        .catch(err => {
            return res.status(500).send("Error insertando cursos");
        });
});

router.get('/eliminar/:id', function (req, res, next) {
    cursosModel
        .eliminar(req.params.id)
        .then(() => {
            res.redirect("/cursoss");
        })
        .catch(err => {
            return res.status(500).send("Error eliminando cursos");
        });
});

router.get('/editar/:id', function (req, res, next) {
    cursosModel
        .obtenerPorId(req.params.id)
        .then(cursos => {
            if (cursos) {
                res.render("cursoss/editar", {
                    cursos: cursos,
                });
            } else {
                return res.status(500).send("No existe cursos con ese id");
            }
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo cursos");
        });
});

router.post('/actualizar/', function (req, res, next) {
    const { id, nombre, precio } = req.body;
    if (!nombre || !precio || !id) {
        return res.status(500).send("No hay suficientes datos");
    }
    cursosModel
        .actualizar(id, { nombre, precio })
        .then(() => {
            res.redirect("/cursoss");
        })
        .catch(err => {
            return res.status(500).send("Error actualizando cursos");
        });
});

module.exports = router;

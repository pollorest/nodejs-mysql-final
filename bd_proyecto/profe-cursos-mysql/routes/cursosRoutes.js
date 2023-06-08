const express = require('express');
const router = express.Router();

const cursoModel = require("../models/cursos");

router.get('/', function (req, res, next) {
    cursoModel
        .obtener()
        .then(cursos => {
            res.render("curso/ver", {
                cursos: cursos,
            });
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo cursos");
        });
});

router.get('/agregar', function (req, res, next) {
    res.render("cursos/agregar");
});

router.post('/insertar', function (req, res, next) {
    const { nombre, precio } = req.body;
    if (!nombre || !precio) {
        return res.status(500).send("No hay nombre o precio");
    }
    const curso = {
        nombre: nombre,
        precio: precio
    };
    cursoModel
        .insertar(curso.nombre, curso.precio)
        .then(idCursoInsertado => {
            res.redirect("/curso");
        })
        .catch(err => {
            return res.status(500).send("Error insertando curso");
        });
});

router.get('/eliminar/:id', function (req, res, next) {
    cursoModel
        .eliminar(req.params.id)
        .then(() => {
            res.redirect("/curso");
        })
        .catch(err => {
            return res.status(500).send("Error eliminando curso");
        });
});

router.get('/editar/:id', function (req, res, next) {
    cursoModel
        .obtenerPorId(req.params.id)
        .then(curso => {
            if (curso) {
                res.render("curso/editar", {
                    curso: curso,
                });
            } else {
                return res.status(500).send("No existe curso con ese id");
            }
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo curso");
        });
});

router.post('/actualizar/', function (req, res, next) {
    const { id, nombre, precio } = req.body;
    if (!nombre || !precio || !id) {
        return res.status(500).send("No hay suficientes datos");
    }
    const curso = {
        id: id,
        nombre: nombre,
        precio: precio
    };
    cursoModel
        .actualizar(curso.id, curso.nombre, curso.precio)
        .then(() => {
            res.redirect("/cursos");
        })
        .catch(err => {
            return res.status(500).send("Error actualizando curso");
        });
});

module.exports = router;


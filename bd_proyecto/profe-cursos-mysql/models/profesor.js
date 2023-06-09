const express = require('express');
const router = express.Router();

const cursosModel = require("../models/cursos");
const profesorModel = require("../models/profesor");
const estudianteModel = require("../models/estudiante");
const materialesModel = require("../models/materiales");
const tareasModel = require("../models/tareas");
const foroModel = require("../models/foro");

router.get('/detalle/:id', function (req, res, next) {
    const cursosId = req.params.id;

    // Obtener detalles del cursos
    cursosModel.obtenerPorId(cursosId)
        .then(cursos => {
            if (!cursos) {
                return res.status(404).send("No se encontró el cursos");
            }

            // Obtener profesor del cursos
            profesorModel.obtenerPorId(cursos.IdProfesor)
                .then(profesor => {
                    if (!profesor) {
                        return res.status(404).send("No se encontró el profesor del cursos");
                    }

                    // Obtener listado de estudiante del cursos
                    estudianteModel.obtenerPorcursos(cursosId)
                        .then(estudiante => {

                            // Obtener listado de materiales del cursos
                            materialesModel.obtenerPorcursos(cursosId)
                                .then(materiales => {

                                    // Obtener listado de tareas del cursos
                                    tareasModel.obtenerPorcursos(cursosId)
                                        .then(tareas => {

                                            // Obtener listado de foro del cursos
                                            foroModel.obtenerPorcursos(cursosId)
                                                .then(foro => {

                                                    // Renderizar la vista con la información obtenida
                                                    res.render("cursos/detalle", {
                                                        cursos: cursos,
                                                        profesor: profesor,
                                                        estudiante: estudiante,
                                                        materiales: materiales,
                                                        tareas: tareas,
                                                        foro: foro
                                                    });
                                                })
                                                .catch(err => {
                                                    return res.status(500).send("Error obteniendo listado de foro");
                                                });
                                        })
                                        .catch(err => {
                                            return res.status(500).send("Error obteniendo listado de tareas");
                                        });
                                })
                                .catch(err => {
                                    return res.status(500).send("Error obteniendo listado de materiales");
                                });
                        })
                        .catch(err => {
                            return res.status(500).send("Error obteniendo listado de estudiante");
                        });
                })
                .catch(err => {
                    return res.status(500).send("Error obteniendo profesor del cursos");
                });
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo detalles del cursos");
        });
});

// Ruta para agregar un nuevo profesor
router.post('/profesor/agregar', function (req, res, next) {
    const { nombre, apellido, titulo } = req.body;

    // Validar los datos recibidos
    if (!nombre || !apellido || !titulo) {
        return res.status(400).send("Faltan datos requeridos");
    }

    // Crear un nuevo objeto de profesor con los datos recibidos
    const nuevoProfesor = new profesorModel({
        nombre: nombre,
        apellido: apellido,
        titulo: titulo
    });

    // Guardar el profesor en la base de datos
    nuevoProfesor.save()
        .then(profesorGuardado => {
            // Enviar una respuesta de éxito al cliente
            res.status(200).send("Profesor agregado exitosamente");
        })
        .catch(error => {
            // Enviar una respuesta de error al cliente
            res.status(500).send("Error al agregar el profesor");
        });
});

// Ruta para actualizar un profesor existente
router.put('/profesor/actualizar/:id', function (req, res, next) {
    const profesorId = req.params.id;
    const { nombre, apellido, titulo } = req.body;

    // Validar los datos recibidos
    if (!nombre || !apellido || !titulo) {
        return res.status(400).send("Faltan datos requeridos");
    }

    // Buscar el profesor en la base de datos por su ID
    profesorModel.findById(profesorId)
        .then(profesor => {
            if (!profesor) {
                // El profesor no fue encontrado, enviar una respuesta de error al cliente
                return res.status(404).send("No se encontró el profesor");
            }

            // Actualizar los datos del profesor
            profesor.nombre = nombre;
            profesor.apellido = apellido;
            profesor.titulo = titulo;

            // Guardar los cambios en la base de datos
            profesor.save()
                .then(profesorActualizado => {
                    // Enviar una respuesta de éxito al cliente
                    res.status(200).send("Profesor actualizado exitosamente");
                })
                .catch(error => {
                    // Enviar una respuesta de error al cliente
                    res.status(500).send("Error al actualizar el profesor");
                });
        })
        .catch(error => {
            // Enviar una respuesta de error al cliente
            res.status(500).send("Error al buscar el profesor");
        });
});

// Ruta para eliminar un profesor existente
router.delete('/profesor/eliminar/:id', function (req, res, next) {
    const profesorId = req.params.id;

    // Buscar el profesor en la base de datos por su ID y eliminarlo
    profesorModel.findByIdAndDelete(profesorId)
        .then(profesorEliminado => {
            if (!profesorEliminado) {
                // El profesor no fue encontrado, enviar una respuesta de error al cliente
                return res.status(404).send("No se encontró el profesor");
            }

            // Enviar una respuesta de éxito al cliente
            res.status(200).send("Profesor eliminado exitosamente");
        })
        .catch(error => {
            // Enviar una respuesta de error al cliente
            res.status(500).send("Error al eliminar el profesor");
        });
});

module.exports = router;

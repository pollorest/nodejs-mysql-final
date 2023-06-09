const conexion = require("../conexion");

module.exports = {
    insertar(cursos) {
        return new Promise((resolve, reject) => {
            conexion.query(
                `INSERT INTO cursoss (Nombre, Precio) VALUES (?, ?)`,
                [cursos.nombre, cursos.precio],
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados.insertId);
                }
            );
        });
    },
    obtener() {
        return new Promise((resolve, reject) => {
            conexion.query(
                `SELECT Nombre, Precio FROM cursoss`,
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados);
                }
            );
        });
    },
    obtenerPorId(id) {
        return new Promise((resolve, reject) => {
            conexion.query(
                `SELECT Nombre, Precio FROM cursoss WHERE id = ?`,
                [id],
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados[0]);
                }
            );
        });
    },
    actualizar(id, cursos) {
        return new Promise((resolve, reject) => {
            conexion.query(
                `UPDATE cursoss SET Nombre = ?, Precio = ? WHERE id = ?`,
                [cursos.nombre, cursos.precio, id],
                (err) => {
                    if (err) reject(err);
                    else resolve();
                }
            );
        });
    },
    eliminar(id) {
        return new Promise((resolve, reject) => {
            conexion.query(
                `DELETE FROM cursoss WHERE id = ?`,
                [id],
                (err) => {
                    if (err) reject(err);
                    else resolve();
                }
            );
        });
    },
};

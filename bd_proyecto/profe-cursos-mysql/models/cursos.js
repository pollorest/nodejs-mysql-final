const conexion = require("../conexion");

module.exports = {
    insertar(curso) {
        return new Promise((resolve, reject) => {
            conexion.query(`INSERT INTO Cursos (Categoria, fecha_inicio, fecha_creacion, fecha_fin, Precio, Semestre, Nombre, Identificador, Id, Url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [curso.Categoria, curso.fecha_inicio, curso.fecha_creacion, curso.fecha_fin, curso.Precio, curso.Semestre, curso.Nombre, curso.Identificador, curso.Id, curso.Url],
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados.insertId);
                });
        });
    },
    obtener() {
        return new Promise((resolve, reject) => {
            conexion.query(`SELECT Nombre, Categoria, Precio FROM Cursos`,
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados);
                });
        });
    },
    obtenerPorId(id) {
        return new Promise((resolve, reject) => {
            conexion.query(`SELECT * FROM Cursos WHERE Identificador = ?`,
                [id],
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados[0]);
                });
        });
    },
    actualizar(id, curso) {
        return new Promise((resolve, reject) => {
            conexion.query(`UPDATE Cursos SET Categoria = ?, fecha_inicio = ?, fecha_creacion = ?, fecha_fin = ?, Precio = ?, Semestre = ?, Nombre = ?, Identificador = ?, Id = ?, Url = ? WHERE Identificador = ?`,
                [curso.Categoria, curso.fecha_inicio, curso.fecha_creacion, curso.fecha_fin, curso.Precio, curso.Semestre, curso.Nombre, curso.Identificador, curso.Id, curso.Url, id],
                (err) => {
                    if (err) reject(err);
                    else resolve();
                });
        });
    },
    eliminar(id) {
        return new Promise((resolve, reject) => {
            conexion.query(`DELETE FROM Cursos WHERE Identificador = ?`,
                [id],
                (err) => {
                    if (err) reject(err);
                    else resolve();
                });
        });
    },
};

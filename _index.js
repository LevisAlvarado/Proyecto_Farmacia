const express = require('express');
const sql = require('mssql');

const app = express();
const PORT = 3000;

// Configuración de conexión a la base de datos
const dbConfig = {
  user: 'admin',
  password: 'adminpassword',
  server: 'localhost',
  database: 'FARMACIA',
  options: {
    encrypt: true, // Si estás utilizando una conexión segura
    trustServerCertificate: true // change to true for local dev / self-signed certs
  }
};

// Middleware para manejar datos en formato JSON
app.use(express.json());

// Ruta de ejemplo para obtener datos de la base de datos
app.get('/clientes', async (req, res) => {
  try {
    const pool = await sql.connect(dbConfig);

    const result = await pool.request().query('SELECT * FROM CLIENTES');
    sql.close();

    res.json(result.recordset);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener los clientes' });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor iniciado en el puerto ${PORT}`);
});
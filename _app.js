const express = require('express');///importa los modulos
const tedious = require('tedious');

const app = express();

const config = {
  server: 'localhost', // Cambia esto al nombre de tu servidor
  authentication: {
    type: 'default',
    options: {
      userName: 'admin', // Cambia esto a tu nombre de usuario
      password: 'adminpassword' // Cambia esto a tu contraseña
    }
  },
  options: {
    database: 'FARMACIA', // Cambia esto a tu nombre de base de datos
    encrypt: true // Usar cifrado SSL
  }
};

app.get('/data', (req, res) => {///Este bloque de código define una ruta para manejar solicitudes GET 
  /                               ///en la ruta "/data" en el servidor Express. Aquí está lo que sucede en esta sección:
  const connection = new tedious.Connection(config);///establece la coneccion para manejar las ruttas

  connection.on('connect', err => {
    if (err) {
      console.error('Error connecting to database:', err);
      return res.status(500).json({ error: 'Database connection error' });
    }

    const request = new tedious.Request('SELECT * FROM CLIENTES', (error, rowCount, rows) => {///ejecuta para representar una consulta en la base
        console.error('Error executing query:', error);
        return res.status(500).json({ error: 'Query execution error' });///verifiva si hay un error con la conexio
      } else {
        console.log(`Rows retrieved: ${rowCount}`);
        console.log('Data:', rows);
        return res.json(rows);
      }
      connection.close();
    });

    connection.execSql(request);
  });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

const oracledb = require('oracledb');

async function Controller(req, res) {
  try {
    const connection = await oracledb.getConnection();
    const result = await connection.execute('SELECT * FROM Persona');
    connection.release();

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: 'Error al realizar la consulta' });
  }
}

module.exports = Controller;





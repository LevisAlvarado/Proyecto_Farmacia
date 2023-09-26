/** Conectar con SQL Server */
const sql = require('mssql');

var user = 'admin';//admin
let pass = 'adminpassword';//admin
var host = 'localhost';
var db = 'FARMACIA3';
var por = 1433;

const dbconfig = {
    server:'localhost',
    authentication: {
        type: "default",
        options: {
          userName: user,
          password: pass
        }
      },
      options: {
        port: por,
        database: db,
        trustServerCertificate: true
      }
};

class Database{
    constructor(){
      //this.conectar();
    }
    async getConnection(){
        try {
            /*pool es una conexion con la base de datos (SQL Server)*/
            const pool = await sql.connect(dbconfig);
            console.log('contedado a',db);
            return pool;
        } catch (error) {
            console.error(error);
        }

        /**haciendo una consulta, y guardandola en la variable result */
        //const result = await pool.request().query('select * from CLIENTES');
        
        /**mostrando el resultado de la consulta */
        //console.log(result);
        
    }
}
module.exports = new Database(); // exporta una instancia. 
//al momento de importarla en index, hace una coneccion.


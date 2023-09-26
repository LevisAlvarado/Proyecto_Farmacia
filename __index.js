const express = require('express'); 
var cors = require('cors');
var bodyParser = require('body-parser');
//var database = require('./modules/database');
const sql = require('mssql');
const Conection = require('tedious').Connection;
const Request = require('tedious').Request;

const sqlConfig = {
    server:'localhost',
    authentication: {
        type: "default",
        options: {
          userName: "admin",
          password: "adminpassword"
        }
      },
      options: {
        port: 1433,
        database: "FARMACIA",
        trustServerCertificate: true
      }

};
const connection  = new Conection(sqlConfig);
connection.connect();
connection.on('connect', (err)=>{
    if(err){
        console.log("error al conectarse a la base de datos");
        throw err;
    }
    executeStatement();//lo que se ejecuta en la conexion.
});

function executeStatement(){
    console.log('Conectado a SQLSERVER');
    const request = new Request("SELECT * from Clientes", (err, rowCont)=>{
        if(err){
            throw err;
        }
        connection.close();
    });
    request.on('row', (columms)=>{
        console.log(columms);
    })

    connection.execSql(request);
}


//import sql from "mssql";
const app = express(); // estructurar todo



//Middleware: funcionalidades que se ejecutara entre la peticion del cliente, y la respuesta del servidor.
// en este caso, para verificar que existe un archivo al que esta solicitando.
/**Utilizando middleware para redireccionar peticiones */
app.use(cors()); // permite peticiones de otros origenes.
//use para ejecutar funciones middleware
app.use(express.static('public')); //busca la direccion que recibe en la carpeta public.


/**Recibir una Peticion POST */
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true})); // con esto tenemos acceso a un nuevo JSON llamado body

//url raiz para recibir peticiones
//app.use('/usuario',usuarioRouter);//cualquier peticiones que reciba /usuario lo recibe el usuarioRouter.

/**para cada componente tipo REST API, para cada elemento crear un archivo
 * que reciba peticiones de cada elemento.
 * Usar carpeta routes.
 */

/*
operaciones de arquitectura REST API
C - created -> POST
R - read -> GET
U - update -> PUT
D - Delete -> DELETE
*/
/**Recibir Parametros:
 * get -> req.query <- formato URL Encoded
 * get -> req.params <- parametro tipo express :nombreParametro
 * POST -> req.body <- se envian en el cuerpo no visible de la peticio
 */


/**Modularizar para diferentes componentes*/
//app.use(Routes);


// Configuración de la conexión a la base de datos
const config = {
    user: "abc",
    password: "abc",//'adminpassword',
    server: "localhost", // You can use 'localhost\\instance' to connect to named instance
    database: "FATURA",
    options: {
        encrypt: true, // for azure
        trustServerCertificate: true // change to true for local dev / self-signed certs
    }
}
async function conection1() {
console.log('llamando conection1');
    const pool = await sql.connect(config);
    const result = await pool.request().query("select 1");
}

// Ruta de ejemplo para obtener datos desde la base de datos
app.get('/', async (req, res) => {
    /*try {
      const pool = await sql.connect(config);
      const result = await pool.request().query('SELECT 1');
      console.log(`***** Respuesta BD: *****\n${result}`);
      res.json(result.recordset);
    } catch (error) {
      console.error(error);
      res.status(500).send('Error en el servidor de Base de datos ');
    }*/
    conection1();
});

//servidor backend
const PORT = process.env.PORT || 8888; // puerto

app.listen(PORT, () => {/*levantar servidor del backend*/
    console.log(`Servidor Express iniciado en el puerto ${PORT}`);
});
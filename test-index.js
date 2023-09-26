//npm init -> crea package.json 

// importar modulo express, para recibir peticiones y publicar archivos estaticos del lado del cliente.
const express = require('express'); //el modulo retorna un objeto con todas las funcionas de ...
var bodyParser = require('body-parser');//acceder a parametros que envian mediante POST.
var testModule = require('./modules/test-module');//importando el modulo que cree.

/**Importando un modulo de usuarios-module.js */
var usuarioRouter = require('./routes/usuarios-route');

/**usando ese modulo creado*/
v1 = testModule.variable;





////const oracledb = require('oracledb'); // ---



var fs = require('fs'); //fileSystem, para el manejo de archivos
const { request } = require('http');

fs.readFile(
  './ruta',
  // data <- se guarda el contenido que estaba en el archivo.
  (error,data)=>{// funcion tipo flecha que se ejecuta al terminar de leer el archivo
    if(error){
      console.log(error);
    }
    else{}
  }
);// leer un archivo



const app = express(); // estructurar todo

/*
operaciones de arquitectura REST API
C - created -> POST
R - read -> GET
U - update -> PUT
D - Delete -> DELETE
*/

//Middleware: funcionalidades que se ejecutra entre la peticion del cliente, y la respuesta del servidor.
// en este caso, para verificar que existe un archivo al que esta solicitando.

app.use(//use para ejecutar funciones middleware
  express.static('public')//busca la direccion que recibe en la carpeta public.
); 

app.use(cors()); // permite peticiones de otros origenes.

/**Recibir una Peticion POST */
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true})); // con esto tenemos acceso a un nuevo JSON llamado body

//url raiz para recibir peticiones
app.use('/usuario',usuarioRouter);//cualquier peticiones que reciba /usuario lo recibe el usuarioRouter.

/**Utilizando middleware para redireccionar peticiones */

/**para cada componente tipo REST API, para cada elemento crear un archivo
 * que reciba peticiones de cada elemento.
 * Usar carpeta routes.
 */
const Routes = require('./routes/Routes'); //para el manejo de rutas
//cada archivo de la carpeta routes, va a gestionar las peticiones.
//ej: ./routes/usuarios-routes.js <- gestiona todas las peticiones de usuarios.
// 



//recibir parametros get.
app.get(
  '/',
  (req, res)=>{//request<- objeto que recibe peticion., response
    res.send(
      'Hola Mundo' //req.query.nombreParametro  <- query es un json, que recibe informacion en formato URL Encoded

    );//enviar respuesta al cliente
  }
);

app.get(
  '/pagina1', // pagina1*ab <- en el * puede ir cualquier cosa.
  //'/pagina1', // pagina1+ab <- en el + puede ir repetida el 1 muchas veces.
  (req, res)=>{//reques, response
    res.send(
      '<html><body><h1>Hola Mundo</h1></body></html>'  
    );//enviar respuesta al cliente
  }
);

//para recibir parametros se pueden recibir de un formulario o con una peticion asincrona.


app.get(
  //Recibir parametros 
  '/capitulos/:numeroCapitulo', //declara un parametro con ":"
  (req, res)=>{//request, response
    res.send(
      //acceder al parametro como json, en la url. req.params.nombreparametro 
      `<html><body><h1>Parametro Recibido:${req.params.numeroCapitulo}</h1></body></html>`
    );//enviar respuesta al cliente
  }
);

app.get("/guardar",(req,res)=>{
  /**Enviar Respuesta al cliente de una peticion */
  
  /**Enviar respuesta en formato JSON 
   * {'mensaje':'Registro Guardado', 'usuarioGuardado':usuario}
  */
  res.send();

});

/**Recibir un parametro mediante PUT. //actualizar algo
 * igual que el POST. en formato urlEncoded, en el cuerpo de la peticion.
 * se accede mediante req.body
 */
app.put(
  '/url/:param1',
  (req,res)=>{req.body//acceder a la inforacion como un formalio, etc
    req.params // acceder al id parametro enviado a traves de la url.
  }
)

/**Recibir un parametro mediante DELETE
 * igual que el POST.
 * se accede mediante req.body
 */
app.delete('/url/:param1',(req,res)=>{req.body
  usuarios.slice(req.params.id, 1);//argumento0: posicion, argumento2: cuantos borrar.
})


/**leer parametro a traves de post con bodyParser, tenemos acceso a un nuevo json llamado body en el objeto request.
 * req.body
*/
app.post(
  '/url',
  (req,res)=>{
    res.send(`informacion recibida con POST: ${req.body}`);
  }
);

/**Recibir Parametros:
 * get -> req.query <- formato URL Encoded
 * get -> req.params <- parametro tipo express :nombreParametro
 * POST -> req.body <- se envian en el cuerpo no visible de la peticio
 */

const PORT = process.env.PORT || 8888;

/**Modularizar para diferentes componentes*/
app.use(Routes);



const dbConfig = {
    user: 'BD_Farmacia',
    password: 'admin',
    connectString: 'DB_FARMACIA'
  };

  async function connectToOracle() {
    try {
      //await oracledb.createPool(dbConfig);
      console.log('Conexión exitosa a Oracle');
    } catch (error) {
      console.error('Error al conectar a Oracle:', error);
    }
  }
  async function connectToSQLServer() {
    try {
      //await oracledb.createPool(dbConfig);
      console.log('Conexión exitosa a Oracle');
    } catch (error) {
      console.error('Error al conectar a Oracle:', error);
    }
  }



  //connectToSQLServer();

  app.listen(PORT, () => {//levantar servidor
    console.log(`Servidor Express iniciado en el puerto ${PORT}`);
  });





  
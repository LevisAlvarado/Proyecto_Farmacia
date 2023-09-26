const express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');

var beneficiosRouter = require('./routes/beneficios-route');
var crudGenericoRouter = require('./routes/CRUDGenerico-route');
//var frontedRouter = require('../Frontend/');


/*importando base de datos, haciendo conexion.*/
const database = require('./modules/database');
//const route

//settings
const PORT = process.env.PORT || 8888;

const app = express();
app.set('port', PORT);


/**Middleware : funcionalidades que se ejecutara entre la peticion del cliente, y la respuesta del servidor.*/
// en este caso, para verificar que existe un archivo al que esta solicitando.

/**Utilizando middleware para redireccionar peticiones 
 * use para ejecutar funciones middleware
 * */
app.use(cors()); // permite peticiones de otros origenes.
//app.use(express.static('public')); //busca la direccion que recibe en la carpeta public.




/** Para Recibir Peticiones en formato JSON */
app.use(express.json());
/**Recibir una Peticion POST */
app.use(bodyParser.json());
/** con esto tenemos acceso a un nuevo JSON llamado body*/
app.use(bodyParser.urlencoded({extended:true})); 

//conectando conFronted

app.use(express.static('Frontend'));
app.use(express.static('Frontend/css'));
app.use(express.static('Frontend/html'));
//app.use(express.static('Frontend/img'));
app.use(express.static('Frontend/imag/fondos'));
app.use(express.static('Frontend/imag/iconos'));
app.use(express.static('Frontend/imag/logos'));
//app.use(express.static('Frontend/img/medicamentos'));
//app.use(express.static('Frontend/img/vitaminas'));
app.use(express.static('Frontend/js'));


/*
app.use(express.static('Frontend')); //busca la direccion que recibe en la carpeta public.

  
app.get('/index', (req, res) => {
    // Obtén la ruta completa al archivo index.html
    console.log(__dirname);
    const indexPath = path.join(__dirname, 'Frontend', 'index.html');
    
    // Envía el archivo HTML como respuesta
    res.sendFile(indexPath);
});
*/



/**url raiz para recibir peticiones*/
//app.use('/beneficios',beneficiosRouter);//cualquier peticiones que reciba /usuario lo recibe el usuarioRouter.

/**Probando CRUD Generico */
//app.use('/:param/:id',crudGenericoRouter);//cualquier peticiones que reciba /usuario lo recibe el usuarioRouter.
//app.use('/:param',crudGenericoRouter);//cualquier peticiones que reciba /usuario lo recibe el usuarioRouter.


app.use('/:parametro/:idParam', (req, res, next) => {
    const param = req.params.parametro; // Capturamos el valor del parámetro :param
    const id = req.params.idParam;

    //recibiendo parametros a traves de
    console.log('- - - - - - - - - - - - - - - - - - - - - - - - - - - - ');
    console.log(`url:${req.url},baseUrl:${req.baseUrl}`);
    
    console.log('parametros iniciales en use:',[param,id])
    console.log(`***  req.params :${JSON.stringify( req.params )} ***`);
    console.log(`***  req.query :${JSON.stringify( req.query )},req.body:${JSON.stringify( req.body )}***`);
    
    
    /**guardar parametros personalisados en el req para usarlos desde el CRUDGenerico*/
    req.customParam  = param; // Guardamos el valor en req.param //lo Crea
    req.customIdParam  = id; //

    console.log('termina el 1er use')
    console.log('- - - - - - - - - - - - - - - - - - - - - - - - - - - - ');
    
    next(); // Continuamos con la siguiente función de middleware o ruta

});


//app.use('/Frontend', (req,res)=>{
    //res.redirect('html/index.html');
//});


/**agregando parametros para el POST */
app.use('/:parametro', (req, res, next) => {
    const param = req.params.parametro; // Capturamos el valor del parámetro :param
    

    //recibiendo parametros a traves de
    console.log('- - - - - - - - - - - /PARAMETRO/- - - - - - - - - - - - - - - - - ');
    console.log(`url:${req.url},baseUrl:${req.baseUrl}`);
    
    console.log('parametros iniciales en SEGUNDO use:',[param])
    console.log(`***  req.params :${JSON.stringify( req.params )} ***`);
    console.log(`***  req.query :${JSON.stringify( req.query )},req.body:${JSON.stringify( req.body )}***`);
    
    
    /**guardar parametros personalisados en el req para usarlos desde el CRUDGenerico*/
    req.customParam  = param; // Guardamos el valor en req.param //lo Crea
    //req.customIdParam  = id; //

    console.log('termina el 2DO use')
    console.log('- - - - - - - - - - - - - - - - - - - - - - - - - - - - ');
    
    next(); // Continuamos con la siguiente función de middleware o ruta

});

app.use('/*', crudGenericoRouter); // Usamos el router después de procesar el parámetro
//app.post('/',crudGenericoRouter);





//app.get('/',(req,res)=>{res.send('Hola, Servidor en Linea');});
//app.get('/*',crudGenericoRouter);//cualquier peticiones que reciba /usuario lo recibe el usuarioRouter.
//app.post('/*',crudGenericoRouter);
//app.put('/*',crudGenericoRouter);
//app.delete('/*',crudGenericoRouter);

console.log('Server start on port', app.get('port'))



module.exports = app;

//cuando carga la pagina ejecua lo qu esta dentro de la pagina.
//windows.onload;// = ()=>{};
//import {render} from './render';

//instancia del render
const rs = new RenderElement;//();

//const axios = axios();

var data = {};// json vacio, para utilizarlo mas adelante para obtener parametros
    //key1: 'value1',
    //key2: 'value2'

var defaultConfig= {
    // por defecto es get
    method: 'get', // Puedes usar 'get', 'post', 'put', 'delete', etc.
    // por defecto el index.html
    url: `http://localhost:8888/`,
    data: data, // Los datos que deseas enviar en formato JSON
    headers: {
      'Content-Type': 'application/json' // Indicar que los datos son JSON
    }
};

class Peticiones{
    /**pantalla siempre en SINGULAR */
    constructor(pantalla){
        data.param = pantalla;//para enviar peticiones al backend
        

        this.config = {
            // por defecto es get
            method: 'get', // Puedes usar 'get', 'post', 'put', 'delete', etc.
            // por defecto el index.html
            url: `http://localhost:8888/`,
            data: data, // Los datos que deseas enviar en formato JSON
            headers: {
              'Content-Type': 'application/json' // Indicar que los datos son JSON
            }
        };

        if(pantalla){
            this.config.url = `${this.config.url}/${pantalla}`;
        }
        

    }
    /**Para mandar la peticion para iniciar sesion en la base de datos */
    async getUserLogin(user,password){
        
        axios(this.config)
        .then(response => {
            console.log('config:',this.config)
            console.log('Respuesta del servidor:', response.data);
            
            //let array = response.data.result;//arreglo que contiene jsons, objetos/tablas respuesta.
            let msjJson = response.data;
            let elementosRenderizados = rs.renderElements(msjJson);//pantalla

            rs.insertInToContainer(`container${pantalla}`,elementosRenderizados);

        })
        .catch(error => {
            console.error('Error al enviar la petición controllerQuery getElements():', error);

        });
    }

    async getElements(pantalla){
        axios(this.config)
        .then(response => {
            console.log('config:',this.config)
            console.log('Respuesta del servidor:', response.data);
            
            //let array = response.data.result;//arreglo que contiene jsons, objetos/tablas respuesta.
            let msjJson = response.data;
            let elementosRenderizados = rs.renderElements(msjJson);//pantalla

            rs.insertInToContainer(`container${pantalla}`,elementosRenderizados);

        })
        .catch(error => {
            console.error('Error al enviar la petición controllerQuery getElements():', error);

        });
    }

    deleteElementById(){
        this.config.method = 'delete';
        data = {};//redefinir la informacion para borrar
    }

    getElementById(){
        
    }
    createSuplemento(){
        this.config.method = 'post';
        data = {};//redefinir la informacion para crear
    }

    updateSuplemento(){
        this.config.method = 'put';
        data = {};//redefinir la informacion para actualizar
    }

}
/**utilizar jsons para definir la informacion recibida y enviada, las llaves son el campo exacto de la tabla.*/

window.onload = ()=>{
    /**SIEMPRE en SINGULAR la pantalla
     * por defecto se manda a pedir todas la filas de la pantalla(hace referencia a una tabla)
    */
    try {
        let pantalla = document.getElementsByTagName('body')[0].getAttribute('name')
        console.log('pantalla',pantalla)

        //en el caso que sea la pantalla de login
        if(pantalla.test('login')){
            console.log(`pantallaLOGIN:${pantalla}`);
        }else{
            //cuando la pagina termina de Cargar.
            //crea la instancia para las querys del lado del cliente.
            let ps = new Peticiones(pantalla);
            ps.getElements(pantalla);//esa funcion hace la peticion para obtener todos los Elementos.
        }
        
    } catch (error) {
        
    }
};

/**Funcion para recolectar data de un formulario */
function dataCollector(){

}



class Usuario{
    constructor(){
        this.user =``;
        this.password =``;
        
        //this.db = require('../modules/db');//instancia de conexion con mssql

    }

    async login(){
        try {
            
        
        /** Obteniene datos para ingresas */
        this.user = document.getElementById('user').value;
        this.password = document.getElementById('password').value;
        
        console.log('iniciandoSesion');

        /**Paramatros necesarios */        
        var base = 'FARMACIA';
        var port = 1433;
        var ip = 'localhost';

        //config
        let tempConfig = defaultConfig;
        tempConfig.url = `${tempConfig.url}`;

        console.log(`configTocenect:${JSON.stringify(tempConfig)}`);
        
        

        } catch (error) {
            console.error(error);
        }
    }

    async logout(){
        //await db.close();
    }
}
  
  
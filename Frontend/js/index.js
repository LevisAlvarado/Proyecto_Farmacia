/**guardar variables globales para intercambiar entre pantallas */
//import Axios from './js/Axxios'; 
//var Axios = require('./Axxios');

//const { connect } = require("mssql");

//import axios from './Axxios';
//axios = require('Axios');
class handlerViews{
    constructor(){}
    //importando

};
window.onload = ()=>{//cuando se cargue la pantalla
    /**SIEMPRE en SINGULAR la pantalla
     * por defecto se manda a pedir todas la filas de la pantalla(hace referencia a una tabla)
    */
    try {
        function insert(){console.warn("insert")}
        /**Creacion de una instancia de la clase de Axios */
        var ax = new Axios();//instancia de la Clase creada para manejar peticiones
        //console.log(axios);
        //axios.setAxiosInstance(axios);
        var re = new RenderElements();

        /**Instanciando el manejador de vistas */
        let hv = new HandlerView();
        let nombrePantalla =hv.getViewName();//guarda el nombre de pantalla en hv.nombrePantalla
        let url = hv.getUrl();

        /**Lo que se quiere hacer al recibir la respuesta */
        ax.onload = ()=>{
            console.log(`response:${ax.response}`);
            let htmls= re.renderElements(ax.response);
            console.log(htmls);
            let idContainer = `${nombrePantalla}Container`;
            re.insertInToContainer(idContainer,htmls);

        
            //function dele(){console.log('se CKLIECKEO')}
            //document.addEventListener(event, callbackFunction);
        
        
        
        

        };

        ax.send();
        console.log('instancia=',ax);
        
        ax.setUrl(url);
        ax.send();
        //console.log(axios.getResponse());
        
        function deleteElement(){
            console.log('PROBANDO FUNCION delete(id)');
        }
        

    } catch (error) {
        console.error(error);
        console.warn('**** ERROR AL ENVIAR PETICION ****** ');
    }
    
};


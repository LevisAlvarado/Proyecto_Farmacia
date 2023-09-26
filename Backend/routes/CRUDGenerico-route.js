/** CRUD de Beneficios. *////ejecututa las funciones que estan en el controlador ROUTER RECIBIR PETICIONES
///SEGUN EL EL TIPO DE PETICIONES EL LAS ENVIAS AL CONTROLADOR
var express = require('express');///lo
var router = express.Router(); // en lugar de app USAMOS router.
/**Importando Modelo para beneficio */
var controllerGenerico = require('../modules/controllerGenerico');//instancia de beneficios
const genericoModel = require('../models/genericoModel');


// entonces: ...

/**Crear un beneficio. Peticion POST 
 * Leer parametro a traves de post con bodyParser,
 * tenemos acceso a un nuevo json llamado body en el objeto request.
 * req.body
*/
//var nombreClase = '';
//console.log(req.ur)

router.post(
    '/',//el id no siempre se ocupa segun la tabla, ya que algunas tablas son autoIncrementales
    controllerGenerico.insertIntoTable//controllerGenerico.createControllerGenerico
);

//insertar en varias tablas
//router.post(
//    ':nombreTablaSingular',
//    controllerGenerico.insertIntoTable//controllerGenerico.createControllerGenerico
//);

console.log('Llego al CRUDGenerico-route.');
/**Obtener UNA Tabla Generica(cualquiera) por el id */
router.get('/:nombreTabla/:id',/*(req,res)=>{
    res.send(
            {'mensaje':'peticion recibida para OBTENER un Beneficio', 'beneficio':req.params.id} 
        );
    }*/
    controllerGenerico.getGenericoById_Table
);
  
/**Obtener todos los Beneficios */

router.get(
    "/",
    controllerGenerico.handlerGetPetitions
);


/**Actualizar un Beneficio (PUT) */
router.put(
    /**Recibir un parametro mediante PUT. //actualizar algo
   * igual que el POST. en formato urlEncoded, en el cuerpo de la peticion.
   * se accede mediante req.body
   */
    '/:id',
    (req,res)=>{
        res.send(
            {'mensaje':'peticion recibida para ACTUALIZAR Beneficio', 'beneficio':req.params.id,
            
            /**acceder a la inforacion como un formalio, etc*/
            'informacionActualizar':req.body}             
        );
    }
);
  
/**Eliminar un Beneficio
 * Recibir un parametro mediante DELETE
 * igual que el POST.
 * se accede mediante req.body
 */
router.delete(
    '/:nombreTabla/:id',
    controllerGenerico.deleteBeneficioById
    /*
    (req,res)=>{//req.body
    res.send(
        {'mensaje':'peticion recibida para ELIMINAR Beneficio', 'beneficio':req.params.id,
        
        /**acceder a la inforacion como un formalio, etc
        'informacionEliminar':''}             
    );
    */
    //usuarios.slice(req.params.id, 1);//argumento0: posicion, argumento2: cuantos borrar.
);
/** sino entra al anterior */
router.delete(
    '/',
    controllerGenerico.deleteBeneficioById
    /*
    (req,res)=>{//req.body
    res.send(
        {'mensaje':'peticion recibida para ELIMINAR Beneficio', 'beneficio':req.params.id,
        
        /**acceder a la inforacion como un formalio, etc
        'informacionEliminar':''}             
    );
    */
    //usuarios.slice(req.params.id, 1);//argumento0: posicion, argumento2: cuantos borrar.
);
  

//ahora esta todo encapsulado aqui.

/**y se exporta todo el objeto completo como una clase*/
module.exports = router;


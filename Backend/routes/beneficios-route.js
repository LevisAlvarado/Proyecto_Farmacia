/** CRUD de Beneficios. */
var express = require('express');
var router = express.Router(); // en lugar de app usar router.
/**Importando Modelo para beneficio */
var beneficio = require('../modules/beneficio');//instancia de beneficios


// entonces: ...

/**Crear un beneficio. Peticion POST 
 * Leer parametro a traves de post con bodyParser,
 *  tenemos acceso a un nuevo json llamado body en el objeto request.
 *  req.body
*/
router.post(
    '/',
    beneficio.createBeneficio
);

/**Obtener UN Beneficio */
router.get('/:id',/*(req,res)=>{
        res.send(
            {'mensaje':'peticion recibida para OBTENER un Beneficio', 'beneficio':req.params.id} 
        );
    }*/
    beneficio.getBeneficioById
);
  
/**Obtener todos los Beneficios */
router.get(
    "/",
    beneficio.getAllBeneficios
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
    '/:id',
    beneficio.deleteBeneficioById
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

/**y se exporta todo el objeto completo.*/
module.exports = router;


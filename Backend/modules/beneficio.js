/**Controlador de beneficio */
sqlconect = require('./database');
const { json } = require('body-parser');
//const pool = sqlconect.getConnection();

/**Para utilizar el modelo */
const beneficioModel = require('../models/beneficioModel');//ahora se carga la isntancia

class Beneficios{
    constructor(){
        /**instancia del modelo Beneficio */
        //this.beneficioModel = new BeneficioModel();
    }
    
    async getBeneficioById(req,res){
        /**obteniendo idBeneficio de los parametros */
        const beneficioId = req.params.id;
        //if(algun parametro esta vacio){
        //res.status(400).json({msg:'llenar todos los campos'});}

        try {
            /**se hace la peticion mediante el modelo */
            const resultBeneficio = await beneficioModel.getBeneficioById(beneficioId);//se llama la funcion del modelo
            console.log(resultBeneficio);
            
            /**Enviar respuesta en formato JSON 
             *{'mensaje':'Registro Guardado', 'usuarioGuardado':usuario} */
            
            //res.json(user);
            res.send(
                {'mensaje':'peticion recibida para mostrar UN Beneficios', 'beneficios':resultBeneficio} 
            );
            
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Error retrieving beneficio CONTROLADOR(modules)' });
        }
    }
    /**retornar todas los beneficios */
    async getAllBeneficios (req,res){
        /**Usando modelo */
        try {
            const beneficios = await beneficioModel.getAllBeneficios();
            /**Envia una respuesta al cliente en forma de json */
            console.log(beneficios);
            res.send(
                {'mensaje':'peticion recibida para mostrar TODOS los Beneficios', 'beneficios':beneficios} 
            );
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Error dentro de CONTROLLER beneficio o llamando algo.' });
        }
        
    }
    
    /**retornar todas los beneficios */
    async createBeneficio (req,res){
        /**Usando modelo */
        try {
            /**haciendo Validaciones */
            console.log(req.body);//falto validar los parametros

            const beneficio = await beneficioModel.createBeneficio(req.body);
            /**mostrando lo que devuevele la peticion a traves del modelo */
            //console.log({'beneficio creado':beneficio});
            
            /**Envia una respuesta al cliente en forma de json */
            res.send(
                {
                    'mensaje':'peticion recibida para CREAR fila en tabla Beneficios', 
                    'beneficioCreado':beneficio
                } 
            );
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Error dentro de CONTROLLER CREATEbeneficio o algun llamado.' });
        }
        
    }
    async deleteBeneficioById (req,res){
        /**Usando modelo */
        try {
            /**haciendo Validaciones */
            console.log('idToDelete:',req.params.id);//falto validar los parametros

            const beneficioEliminado = await beneficioModel.deleteBeneficioById(req.params.id);
            /**mostrando lo que devuevele la peticion a traves del modelo */
            //console.log({'beneficio creado':beneficio});
            
            /**Envia una respuesta al cliente en forma de json */
            res.json(
                {
                    'mensaje':'peticion recibida para BORRAR fila en tabla Beneficios',
                    'idToDelete': req.params.id,
                    'beneficioBorrado': beneficioEliminado
                } 
            );
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Error dentro de CONTROLLER deleteBeneficioByID o algun llamado.' });
        }
        
    }


}
module.exports = new Beneficios();//exportando una instancia del controlador beneficio.js
/**Controlador de beneficio */
sqlconect = require('./database');
const { json } = require('body-parser');
//const pool = sqlconect.getConnection();

/**Para utilizar el modelo */
const genericoModel = require('../models/genericoModel');//ahora se carga la isntancia

class Validator{
    constructor(){}
    validateDataToInsert(){};
    validateDataToInsertEmpleado(){};
};

class ControllerGenerico{
    constructor(){
        /**instancia del modelo Beneficio */
        //this.beneficioModel = new BeneficioModel();
        this.getGenericoById_Table = this.getGenericoById_Table.bind(this);
        this.getAllTables = this.getAllTables.bind(this);
        this.handlerGetPetitions = this.handlerGetPetitions.bind(this);
    }

    /**Gestionar Peticiones get para mostrar todas o solo una tabla */
    async handlerGetPetitions(req, res) {
        try {
            //prueba
            const nombreTabla = req.customParam;
            const id = req.customIdParam;
    
            /**Agregando lógica para iniciar sesión. */
            if (nombreTabla == 'empleado') {
                console.log(`TRANTO DE INICIAR SESION CON ${nombreTabla} {{{{ ${JSON.stringify(req.body)} }}}}}`);
                let user = req.body.user;
                let password = req.body.password;
                if (user != null && password != null) {
                    //resulta de tratar de acceder con las credenciales
                    let isLogged = await genericoModel.testCredentialsToLogin(user, password);
                    
                    if(isLogged){

                        res.send({ 'mensaje': 'tratando de Ingresar como administrador', 'logged': isLogged });
                    }else{
                        res.send({ 'mensaje': 'tratando de Ingresar como administrador', 'logged': isLogged });
                    }
                    //res.send////ESTE MANEJA LAS SOLICITUDES DE LA APP JS, SE ENFOCA EN EL INICIO DE SESION
                }
            }
    
            if (id) {
                console.log('-----tratandoTraer por ID');///verifica si la variable id tiene un valor. Si id tiene un valor 
                /**Envia una respuesta al cliente en forma de json */
                let result = await this.getGenericoById_Table(nombreTabla, id);
                res.send({ 'mensaje': 'peticion recibida para mostrar por ID UNA Tabla Generica', 'result': result });
                
            } else {
                //if(nombreTabla){
                /*
                console.log(`============================================================\n
                ${req.url}\n
                ${req.baseUrl}
                \n====================`);*/
                ///a una función llamada getAllTables de algún objeto o contexto, y espera a que la función se complete antes de continua
    
                let result = await this.getAllTables(
                    (req.baseUrl).replace("/", "")
                );
    
                //window.location.href = "html/login.html";
    
                res.send({ 'mensaje': 'peticion recibida para mostrar TODAS las filas de una tabla', 'result': result });
    
                //res.redirect('controllerFronted.js');
    
                //}
            }
    
            /*
            console.log('baseUrl:',req.baseUrl);
            console.log('url:',req.url);
            console.log('getAllTables()');
            //probando que recibe
            console.log('parametros recibidos:',req.params);
            const beneficios = await beneficioModel.getAllTables();
            console.log(beneficios);
            */
    
        } catch (error) {
            console.error(error);
            return { 'error': 'Error dentro de CONTROLLER handlerGetPetitions o llamando algo' };
            throw error;
            //res.status(500).json
        }
    }

    async getGenericoById_Table(nombreTabla,id){    
        
        try {

            //tableName
            console.warn('getGenericoById_Table()');
            const resultGenericModel = await genericoModel.getGenericoById_Table(
                /** tableName <- nombre de la tabla , id de la tabla<- orden de envio*/
                nombreTabla , id 
            );

            /**Envia una respuesta al cliente en forma de json */
            console.log(resultGenericModel);
            //res.send(
            //    {'mensaje':'peticion recibida para mostrar caulquier TABLA Generica segun el Id', 'resultGeneric':resultGenericModel} 
            //);
            return resultGenericModel;

            /**retorna el elemento */
            //return resultGenericModel[0];
        } catch (error) {
            console.error(':::: ERROR :::: En Modelo :::: Generico ==== getGenericoById_Table ====::::');
            throw error;
        }
    }
    
    

    /**retornar todas los beneficios */
    async getAllTables (nombreTabla){
        /**Usando modelo */
        try {
            
            console.log(`getAllTables(${nombreTabla})`);
            //probando que recibe
            //console.log('parametros recibidos:',req.params);
            //nombreTabla = req.param;

            /** ahora */
            //tableName
            console.log(`getGenericoById_Table(${nombreTabla})`);
            const resultGenericModelTables = await genericoModel.getAllTables(nombreTabla);//ahorita esta en singular

            /**Envia una respuesta al cliente en forma de json */
            console.log(resultGenericModelTables);
            //res.send(
            return resultGenericModelTables;
            //);

            /**retorna el elemento */
            
            /** fin ahora*/

            /**Envia una respuesta al cliente en forma de json */
            //res.send(
                //{'mensaje':'peticion recibida para mostrar TODOS los Beneficios', 'beneficios':tablas} 
            //);

            /**fin antes */
        } catch (error) {
            console.error('error en getAllTables');//error);
            throw error;
        }
        
    }
    
    /**retornar todas los beneficios */
    async insertIntoTable (req,res){///RECIBO LOS PARAMETROS
        /**Usando modelo */
        try {
            /**haciendo Validaciones */
            console.log(`===============================\nPOST\n===============================`);
            
            console.log('parametros recibidos\n=====');
            console.log('req.nombreTabla',req.params.nombreTabla,'req.idTabla',req.params.idTabla);
            
            console.log('parametros personalizados\n=====');
            console.log('req.customParam:',req.customParam,'req.customIdParam:',req.customIdParam);
            
            console.log('parametros en el cuerpo de la peticion\n=====');
            console.log('parametros Recibidos mediante post en req.body:',req.body);//falto validar los parametros
            console.log(`===============================\nPOST\n===============================`);

            let tableName = req.customParam;
            // para insertar no siempre se ocupa un id, ya que son autoincrementales algunas tablas.
            //let id = req.customIdParam
            
            let dataJSON = req.body;///GUARDAR INF

            const resultGenericModelTables = await genericoModel.insertIntoTable(
                tableName,dataJSON
            );//ahorita esta en singular
            /**mostrando lo que devuevele la peticion a traves del modelo */
            //console.log({'beneficio creado':beneficio});
            

            /**Envia una respuesta al cliente en forma de json */
           res.send(
               {
                   'mensaje':`peticion recibida para CREAR/ INSERT datos en una tabla `, 
                   'nombreTablaAInsertar':resultGenericModelTables
               } 
           );

        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Error dentro de --CONTROLLER-- INSERT o algun llamado.' });
        }
        
    }
    async deleteBeneficioById (req,res){ //BORAR POR ID
        /**Usando modelo */
        try {
            //const regex = new RegExp('/g');
            const nombreTablaRecibido = req.baseUrl;

            const nombreTabla = nombreTablaRecibido.split('/')[1];///ACCESIDNEOD A LOS PARAMETROS QUE DEFINIMOS ENEL MIDLWARE
            const id = req.customIdParam;
            //SPLIT DEVUELVE ARREGLO SEPARARADO
            /**haciendo Validaciones */
            
            console.log('tableToDelete:',nombreTabla);//
            console.log('idToDelete:',id);//falto validar los parametros

            if(id){//SI EXISTE UN ID
                const result = await genericoModel.deleteGenericoById_Table(nombreTabla, id);///QUE ME BORRE POR ID
                                                                    //EN QUE TABLA Y QUE ID
                /**Envia una respuesta al cliente en forma de json */
                res.json(
                    {
                        'mensaje':'peticion recibida para BORRAR fila en tabla Generica',
                        'idToDeleted': id,
                        'result': result
                    } 
                );
            }else{
                res.status(400 ).json({'mensaje':'No LOQUEE COMPA', 'result': '* * * * BAD REQUEST *****' });
            }
            
            /**mostrando lo que devuevele la peticion a traves del modelo */
            //console.log({'beneficio creado':beneficio});
            
            
            
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Error dentro de CONTROLLER deleteBeneficioByID o algun llamado.' });
        }
        
    }


}
module.exports = new ControllerGenerico();//exportando una instancia del controlador beneficio.js
/** Estructura para manejar los datos con DB 
 * objeto beneficio que utilizaremos para CRUD operaciones con SQL Server.
*/
//const Database = require('../modules/db');//instancia de conexion con mssql
const db = require('../modules/db');//instancia de conexion con mssql

//const Database = require('../modules/dbAdmin'); // importando la clase
//const dbAdmin = new Database(); /// instanciando la case

class Validator{
    constructor(){
        this.param = "";
        this.rules = [
            /**expresion, expresionParaPlural */
            //[/(s|x|z)$/, '$1es'],
            [/([^aeiou])y$/, '$s'],
            //[/([^aeiou]o)$/, '$1es'],
            //[/(ch|sh)$/, '$1es'],
            [/s$/, 's']
        ];
    }
    removeLastComma(cadena) {
        return cadena.replace(/,$/, ''); // Reemplaza la última coma con una cadena vacía
    }

    validateParamToCosult(param) {
        if (/^\d+(\.\d+)?$/.test(param)) {
            return parseFloat(param);
        } else if (/^[a-zA-Z0-9\-_. ]+$/.test(param)) {
            return true;
        } else {
            return false;
        }
    }
    parseParamToCosult(param) {
        if (/^\d+(\.\d+)?$/.test(param)) {
            return parseFloat(param);
        } else if (/^[a-zA-Z0-9\-_. ]+$/.test(param)) {
            return `'${param}'`;
        } else {
            return `'${param}'`;
        }
    }
    paramToPlurar(param){
        try {
            const regexFinishVocales = /[\w|\W]*[aeiouAEIOU]/;//expresion regular para palabras que terminan en vocales.
            //this.param = param;
            
            //if(param.test('vitamina')){
            //    return param.replace('vitamina','suplementos');
            //}
            if(//para palabras que terminan en aeiou
                regexFinishVocales.test(param)
            ){
                return param = `${param}s`; //agrega una s
            }
            const re = new RegExp('object'); 
            if(re.test(typeof param)){
                return '';
            }
            
        } catch (error) {
            return '';        
        }
        
    }
    paramToSingular(param){

    }
}

/**clase para gestionar las consultas a la base de datos  */
class HandlerQuerys{
    constructor(){
        this.validator = new Validator();
        this.queryToSend = ``;
        /** json con las consultas predefinidas*/
        this.querys = {
            getAllProducts: "SELECT TOP(500) * FROM [webstore].[dbo].[Products]",
            getProducById: "SELECT * FROM Products Where Id = @Id",
            addNewProduct:
              "INSERT INTO [webstore].[dbo].[Products] (name, description, quantity) VALUES (@name,@description,@quantity);",
            deleteProduct: "DELETE FROM [webstore].[dbo].[Products] WHERE Id= @Id",
            getTotalProducts: "SELECT COUNT(*) FROM webstore.dbo.Products",
            updateProductById:
              "UPDATE [webstore].[dbo].[Products] SET Name = @name, Description = @description, Quantity = @quantity WHERE Id = @id",
            //CRUD
            
            //borrador de estructura para una clase
            medicamento:{
                insert:`EXEC insertarMedicamentos 'OTRO MEDICAMENTO', '1',1,1,'MA_1';`,
                select:'',
                update:'',
                delete:''
            },
            
            //borrador de otra posible estructura
            insert:{
                medicamento:
                    /**Numero de parametros que necesita el query, el query concretamente 
                     * [query,param]
                    */
                    //query para ejectutar un procedimiento almacenado
                    [`EXEC insertarMedicamento`,9]//la consulta se le concatenan los parametros
                    //[`EXEC insertarMedicamento 'OTRO MEDICAMENTO', '1',1,1,'MA_1';`,4]
            },
            select:{

            },
            update:{

            },
            delete:{

            }
            
            //EXEC insertarMedicamento 'OTRO MEDICAMENTO', '1',1,1,'MA_1';
        };
        /**query para enviar un procedimiento almacenado a la base de datos*/
        

    }
    /**toma el nombre de la tabla y la informacion, y la setea en la consulta.
     * tambien tiene que validar que la consulta este bien 
     * siempre enviar los datos en el orden correcto para que se guarde correctamente en la consulta.
     * el data tiene que ser un json
    */
    getQueryToInsert(tableName,data){
        try {
            console.log('::::tableName::::',tableName,data)
            switch (tableName) {
                case 'medicamento':
                    //obteniendo el tamaño del json data
                    let parametersNumber = Object.keys(data).length;
                        console.warn('parametersNumber:',parametersNumber);
                    /**verificando tamaño de paramaetros que necesita ese procedimiento almacenado. */
                    if (parametersNumber == this.querys.insert.medicamento[1]){//obteniendo el tamaño del json 
                        //guardando el procedimiento almacenado
                        this.queryToSend = this.querys.insert.medicamento[0];
                        
                        console.log("PARAMETROS RECIBIDOS DATA:",data);

                        for (let parameter in data){
                            
                            if(this.validator.validateParamToCosult(parameter)){
                                let valor= data[parameter]
                                let p = this.validator.parseParamToCosult(valor);
                                this.queryToSend +=` ${p},`;
                            }
                            

                            /*if(parameter == 'nombre_Medicamento'){
                                this.queryToSend +=` '${data[parameter]}',`;//para que lo mande entre '1.png'    
                            }else{
                                if(parameter != 'img'){
                                    this.queryToSend +=` ${data[parameter]},`;//para que lo mande entre '1.png'    
                                }else{
                                    this.queryToSend +=` '${data[parameter]}'`;
                                }
                            }*/
                            
                        }
                        //eliminar la ultima coma
                        this.queryToSend = this.validator.removeLastComma(this.queryToSend);

                        return `${this.queryToSend};`;
                    }else{
                        return `::: ERRROORR :::: Cantidad parametros Invalidos para la tabla :::::`;
                    }
                    
                    break;
            
                default:
                        return `::: Error >> Tabla :::: nombre de Tabla Invalido :::::`;
                    break;
            }
            
        } catch (error) {
            console.error(error);
            return `EERRRORRR ::::: getQueryToInsert`;
            //throw error;
        }
        
    }

    getQueryToUpdate(){

    }

    otraFuncion(request){
        /**definiendo parametros para el query */
        // request.input('Nombre', sql.VarChar, 'Alice');
        // request.input('nombreCampo', 'Valorpara guarda En Base');

        // parametros necesarios
        // nombre de tabla 
        // nombre de campo // tambien el numero de campos
        // y valor del campo 

        //consulta y los parametros son llamados con @
        
        // const queryResult = await request.query('SELECT * FROM Usuarios WHERE Nombre = @Nombre');
        

        // const queryResult = await request.query( //el procedimiento almacenado solo necesita los parametros
            //EXEC insertarMedicamento 'OTRO MEDICAMENTO', '1',1,1,'MA_1';
        //);
        



    }

}



class GenericModel {
    constructor(){//dataLogin=['asd','asd']){
        /** importando para hacer conexion con base datos */
        //this.db = Database;
        this.validator = new Validator();
        
        //this.userToConect = dataLogin[0];
        //this.userPassword = dataLogin[1];


    }
    async testCredentialsToLogin(user,password){
        console.log(` + + + + + METODO testCredentialsToLogin + + + + + `);
        
        console.log(`++++user: ${user} +++++ password: ${password} ++++++`);
        //console.log(
        //    await db.setConfigToLogin(user,password)
        //);
        let result =await db.setConfigToLogin(user,password);
        if (result){
            return `{mensaje:"Logeado",result:${result}}`;
        }else{
            if (result){
                return `{mensaje:"NO SE PUEDO LOGUEAR",result:${result}}`;
            }    
        }


        //await db.connect();
        

        /*console.log(`% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % \n Antest de login... db.config:
        \n${JSON.stringify(db.config)} 
        \n\n% % % % % % % % % % % % % % % % % % % % % % % % % % %  % % % \n\n
        db.pool:${JSON.stringify(db.pool)}
        \n% % % % % % % % % % % % % % % % % % % % % % % % % % %  % % % `);*/
        /**llamando al metodo login*/
        
            
            //await db.connect();
            //await db.query(query);
            //cambiar conexion
            //await db.close();
          //  return result;

        //let resultLogin = await db.login(user,password);
        //db.connect();

        
        /*console.log(`% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % \n despuest de login... db.config:
        \n${JSON.stringify(db.config)} 
        \n\n% % % % % % % % % % % % % % % % % % % % % % % % % % %  % % % \n\n
        db.pool:${JSON.stringify(db.pool)}
        \n% % % % % % % % % % % % % % % % % % % % % % % % % % %  % % % `);

        console.log('$ $ $ $ $ $ $ $ $ $ \nresultLogin',resultLogin,`$ $ $ $ $ $ $ $ $ $ `);
        console.log(`testCredentialsToLogin(${user},${password})\n////////////`);

        console.log(`$ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $  $ $ $ $ $ $`);
        */
       

    }
    /**req.params.nombreTabla , req.params.id */
    /** nombreTabla tiene que recibirse SIEMPRE EN SINGULAR */

    async getGenericoById_Table(nombreTabla, genericId) {    
        try {
            

            /**Validar Los parametros recibidos para mandar a llamar correctamente las tablas en la base de datos */
            const tableNamePlural = this.validator.paramToPlurar(nombreTabla);

            /** Imprimir Valores que recibe el modelo */
            console.warn('Valores Recibidos en el modelo del cliente:',nombreTabla,'generic',genericId);
            
            console.log('tabla Para Traer:',tableNamePlural);
            
            /**definiendo la consulta una consulta */
            if(tableNamePlural){//si la tabla a traer es plural
                /**Conectando a base de datos */
                await db.connect();
                
                const query = `SELECT * FROM ${tableNamePlural} g WHERE g.id_${nombreTabla}= ${genericId};`;
                console.log(`consultaEnviada:${query}`);

                /**guardando resultado de la consulta. se envia el query. */
                const result = await db.query(query);
                console.log(result);

                await db.close();
                
                return result;
            }else{
                return `errorValidator:${tableNamePlural}`;
            }
            
            
            /**cierra conexion de base datos */
            

            /**retorna el elemento */
            return `PROBANDO getGenericoById_Table(nombreTabla=${nombreTabla}, genericId=${genericId})`;
            
        } catch (error) {
            console.error(':::: ERROR :::: En Modelo :::: Generic ***** getGenericoById_Table ****** ::::');
            console.error(error);
            return `ERROR getGenericoById_Table`;
        }
    }
    async getAllTables(nombreTabla) {    
        try {
           
            const tableNamePlural = this.validator.paramToPlurar(nombreTabla);
            console.warn('Valores Recibidos en el modelo:',nombreTabla);
            console.log(`======== tabla Para Traer:${tableNamePlural} ========`);

            if(tableNamePlural){
                 /**Conectando a base de datos */
                await db.connect();

                /**definiendo la consulta una consulta */
                const query = `SELECT * FROM ${tableNamePlural}`;

                console.log(`- - - consulta Enviada:${query} - - - `);
                const result = await db.query(query);

                await db.close();
                return result;
            }else{
                return 'no se recibio un nombre de tabla';
            }

            /**guardando resultado de la consulta. se envia el query. */
            //const result = await db.query(query);
            
        
            /**retorna el elemento */
            //return result;
        } catch (error) {
            console.error(':::: ERROR :::: En Modelo getAllTables');
            return `:::: ERROR :::: En Modelo getAllTables`;
            //throw error;
        }
    }
    
    /**Borrar una FILA de la tabla BENEFICIOS */
    async deleteGenericoById_Table(nombreTabla, genericId) {    
        try {
            
            /**Validar Los parametros recibidos para mandar a llamar correctamente las tablas en la base de datos */
            const tableNamePlural = this.validator.paramToPlurar(nombreTabla);

            if(tableNamePlural && genericId){
                /**Conectando a base de datos */
                await db.connect();

                /**definiendo la consulta una consulta */
                const query = `Delete from ${tableNamePlural} where ID_${nombreTabla} = ${genericId};`;

                /**guardando resultado de la consulta. se envia el query. ELIMINAR */
                const result = await db.query(query);
                //console.warn('beneficioBorrado',result);
                /**cierra conexion de base datos */
                await db.close();
                //console.log(result);
                /**retorna el elemento */
                return {result};
            }else{
                return `errorValidator:${tableNamePlural}`;
            }

            
            
        } catch (error) {
            console.error(':::: ERROR :::: En Modelo deleteGenericoById_Table');
            //throw error;
        }
    }

    /**hacer un INSERT en tabla BENEFICIOS, retorna el beneficio Creado */
    async insertIntoTable(tableName,dataJSON) {  
        /** instanciando la clase Manejador de querys*/  
        let handlerQuerys = new HandlerQuerys();

        try {
            /**Conectando a base de datos */
            await db.connect();
            console.log(
                '- - - - - - - - - - - - - - - - MODELO.insertIntoTable recibe:\n - - - - - - - - - - - - - -',
                dataJSON
            );
            /**definiendo la consulta a enviar a mssql */
            
            const query = handlerQuerys.getQueryToInsert(tableName,dataJSON);
            
            console.log('\n/////// \n**** Query Recibida de handlerQuerys:\n//////////*********',
                query
            );
            let result = null;
            /**validacion */
            if ((typeof query !=='undefined')){
                /** Para el 
             * guardando el resultado de la peticion a mssql donde se envia el query(INSERT) */
                result = await db.query(query);
            }

            /**para la otra consulta */
            
            /**obteniendo el ultimo elemento que agregamos a Beneficios */
            //query = `select * from Beneficios where Beneficios.ID_Beneficio = 
            //(select top 1 b.ID_Beneficio from Beneficios b order by b.ID_Beneficio desc)
            //`;//utilizando una subconsulta ultimo id agregado Beneficios
            //console.log(query);

            //const beneficioAgregado = await db.query(query);
            //console.log(beneficioAgregado);
            /**cierra conexion de base datos */
            await db.close();
            /**retorna otra consulta */
            
            //return {'result':result,'beneficioAgregado':beneficioAgregado[0]};
            return `{result:${result}}`;

        } catch (error) {
            console.error(error);
            console.error(':::: ERROR :::: En Modelo insertIntoTable :::::');
            return `error con la peticion o base de datos. Verifique si tiene permisos`;
            //throw error;
        }
    }

}
/**se exporta la clase */
module.exports = new GenericModel();//cambio a exportar la instancia
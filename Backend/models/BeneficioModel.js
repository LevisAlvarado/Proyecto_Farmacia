/** Estructura para manejar los datos con DB 
 * objeto beneficio que utilizaremos para CRUD operaciones con SQL Server.
*/
//const Database = require('../modules/db');//instancia de conexion con mssql
const db = require('../modules/db');//instancia de conexion con mssql

class BeneficioModel {
    constructor(){
        /** importando para hacer conexion con base datos */
        //this.db = Database;
    }

    async getBeneficioById(beneficioId) {    
        try {
            /**Conectando a base de datos */
            await db.connect();

            /**definiendo la consulta una consulta */
            const query = `SELECT * FROM BENEFICIOS b WHERE b.id_Beneficio = ${beneficioId}`;

            /**guardando resultado de la consulta. se envia el query. */
            const result = await db.query(query);
            
            /**cierra conexion de base datos */
            await db.close();

            /**retorna el elemento */
            return result[0];
        } catch (error) {
            console.error(':::: ERROR :::: En Modelo');
            throw error;
        }
    }
    async getAllBeneficios() {    
        try {
            /**Conectando a base de datos */
            await db.connect();

            /**definiendo la consulta una consulta */
            const query = `SELECT * FROM BENEFICIOS`;

            /**guardando resultado de la consulta. se envia el query. */
            const result = await db.query(query);
            
            /**cierra conexion de base datos */
            await db.close();

            /**retorna el elemento */
            return result;
        } catch (error) {
            console.error(':::: ERROR :::: En Modelo');
            throw error;
        }
    }
    /**hacer un INSERT en tabla BENEFICIOS, retorna el beneficio Creado */
    async createBeneficio(datosJSON) {    
        try {
            /**Conectando a base de datos */
            await db.connect();
            console.error('MODELO recibe:',datosJSON);
            /**definiendo la consulta a enviar a mssql */
            const query = 
            `INSERT INTO Beneficios (Descripcion, Fecha_Vigencia)
            VALUES ('${datosJSON.description}','${datosJSON.fechaVigencia}');
            `
            ;
            console.log(query);
            /** Para el 
             * guardando el resultado de la peticion a mssql donde se envia el query(INSERT) */
            const result = await db.query(query);
            

            /**para la otra consulta */
            
            /**obteniendo el ultimo elemento que agregamos a Beneficios */
            const queryUltimoBeneficio = `select * from Beneficios where Beneficios.ID_Beneficio = 
            (select top 1 b.ID_Beneficio from Beneficios b order by b.ID_Beneficio desc)
            `;//utilizando una subconsulta ultimo id agregado Beneficios
            console.log(queryUltimoBeneficio);

            const beneficioAgregado = await db.query(queryUltimoBeneficio);
            console.log(beneficioAgregado);
            /**cierra conexion de base datos */
            await db.close();
            /**retorna otra consulta */
            return {'result':result,'beneficioAgregado':beneficioAgregado[0]};

        } catch (error) {
            console.error(':::: ERROR :::: En Modelo CREATEBENEFICIO');
            throw error;
        }
    }
    /**Borrar una FILA de la tabla BENEFICIOS */
    async deleteBeneficioById(beneficioId) {    
        try {
            /**Conectando a base de datos */
            await db.connect();

            /**definiendo la consulta una consulta */
            const query = `Delete from Beneficios where ID_Beneficio = ${beneficioId}`;

            /**guardando resultado de la consulta. se envia el query. ELIMINAR */
            const result = await db.query(query);
            //console.warn('beneficioBorrado',result);
            /**cierra conexion de base datos */
            await db.close();
            //console.log(result);
            /**retorna el elemento */
            return result;
        } catch (error) {
            console.error(':::: ERROR :::: En Modelo deleteBeneficioById');
            throw error;
        }
    }

}
/**se exporta la clase */
module.exports = new BeneficioModel();//cambio a exportar la instancia
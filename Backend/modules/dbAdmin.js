/**La diferencia con db. es que se exporta como una clase, en lugar de la instancia.
 * entonces al momento de crear la instancia tienen que mandar como parametro un json config, para la conexion.
 */

/** Conectar con SQL Server */
const sql = require('mssql');
/**Valores de LOGIN para conectar con base de datos de datos */

/**Tipos de usuarios predefinidos para loguear a la base de datos */
let users = {
    admin:{user:'admin',password:'adminpassword'},
    public:{user:'asd',password:'asd'}
};

var user = 'asd';//
let pass = 'asd';//
var server = 'localhost';
var db = 'FARMACIA3';
var por = 1433;

const sqlConfig = {
    server:'localhost',
    authentication: {
        type: "default",
        options: {
          userName: user,
          password: pass
        }
      },
      options: {
        port: por,
        database: db,
        trustServerCertificate: true
      }
};
/**requiere el config con los parametros para conectar */
class Database {
    constructor(config) {
        /**atributo para guardar configuracion */
        this.config = null;
        
        /**atributo para validar la sesion como administrador */
        this.accessAdmin = false;

        /**config to SQL Server por defecto*/
        if(config== null){
            /**config to SQL Server por defecto*/
            this.config = sqlConfig;
        }else{
            //parametro recibido en el constructor por defecto
            this.config = config;
        }
        
        /**pool es una conexion con la base de datos (SQL Server)
         * Crea pool de conexiones, y la guarda la conexion como atributo de la clase.*/
        this.pool = new sql.ConnectionPool(this.config);
        
        /**para guardar el resultado del ultimo query que se haga */
        this.lastResultQuery;
        
        console.warn(
            `= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
            Database data to Conecth with server:
            \nserver:${this.config.server};\nuser:${this.config.authentication.options.userName};\noptions:${JSON.stringify(this.config.options)} 
            \n= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =`
        );
    }

    async login(options = {userName: user,password: pass}){
        this.config.options = options;
        /**Conexion tempora para testear el acceso como administrador */
        let poolTemp = new sql.ConnectionPool(this.config);
        /** si logro conectar entonces guarda esa conexion */
        if(poolTemp){
            this.pool = poolTemp;
            this.accessAdmin = true;
        }
        console.log(`
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        ::::::::::::::::::::::::::::::::::::::::::::::::
        :::💀💀☠ENTRANDO AL SISTEMA como ADMIN☠💀💀:::
            :::☠☠☠ USER == ${options.user} ☠☠☠:::
        ::::::::::::::::::::::::::::::::::::::::::::::::
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
        `);
    }

    async connect() {
        try {
            await this.pool.connect();
            console.warn('::: Connected to the database :::');
        } catch (error) {
            throw error;
        }
    }
    async connectUser() {
        try {
            return await this.pool.connect();
            console.warn('Connected to the database');
        } catch (error) {
            throw error;
        }
    }

    /**haciendo una consulta, y guardandola en la variable result para retornarl el resultado de esa consulta */
    async query(query) {
        try {

            const poolRequest = await this.pool.request();
            /**manda un query */
            this.lastResultQuery = await poolRequest.query(query);
            /**Retorna solo el resultado de la ultima query */
            return this.lastResultQuery.recordset;//mandando solo el resultado
        } catch (error) {
            throw error;
        }
    }

    async close() {
        try {
            await this.pool.close();
            console.warn('::: Disconnected from the database :::');
        } catch (error) {
            throw error;
        }
    }
}

module.exports = Database;//exportando la instancia. configurada para sqlServer
//al momento de importarla en index, hace una coneccion. // no solo la clase


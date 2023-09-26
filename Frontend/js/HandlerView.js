class HandlerView{
    constructor(){
        this.nombrePantalla;
        this.ruta = `http:///localhost:8888/`;
        this.id;
        //this.axios;
    }
    
    setView(pantalla){}
    
    /**obtiene guarda y retorna el nombre de la vista para mandar a trar */
    getViewName(){
        let nombrePantalla = document.getElementsByTagName('body')[0].getAttribute('name');
        if(nombrePantalla){
            this.nombrePantalla = nombrePantalla;
            return this.nombrePantalla;
        }
    }
    
    getData(){
        return {};
    }
    /**obtiene guarda y retorna la URL del nombre de la pantalla */
    getUrl(){
        if(this.nombrePantalla){
            this.ruta=`${this.ruta}${this.nombrePantalla}`;
            return this.ruta;
        }else{
            return this.ruta;
        }
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

    async getElementById(){
        
    }

    async deleteElement(){
        console.log(`deleteElement`);
    }
    
    
    //gestionar la ruta para enviar la solicitud
}


class RenderElements{
    constructor(){
        //this.renderElements = this.renderElements.bind(this);
        //this.renderElement = this.renderElement.bind(this);
    }
    renderElements(arrayOfElements){//msj = response.data;
        console.log('Funcion en el RENDER');
        let html = ``;
        arrayOfElements.forEach(element => {//cada elemento es un json.
            html +=`${this.renderElement(element)}`;
            //console.log(`elementsToRender:${element}`);    
            //element.ID_Medicamento

        });
        console.log(`Elementos Renderizados:${html}`);
        return html;
    }
    /**devuelve el HTML de un medicamento
     * se recibe un json {msj:'',result:[{},...]}
    */
    renderElementsJSON(msj){//msj = response.data;
        console.log(typeof msj);
        if((typeof msj) == 'array'){
            console.log('RECIBIO objeto array el RENDER');
        }
        if((typeof msj) == 'object object'){
            console.log('RECIBIO objeto JSON el RENDER');
        }


        console.log('Funcion en el RENDER');
        
        let arrayOfElements = msj.result;//accediendo al result (respuesta de objetos/tablas)

        let html = ``;
        arrayOfElements.forEach(element => {//cada elemento es un json.
            html +=`${this.renderElement(element)}`;
            //console.log(`elementsToRender:${element}`);    
            //element.ID_Medicamento

        });
        
        console.log(`Elementos Renderizados:${html}`);
        return html;
    }

    /** retorna el html para un elemento */
    //{'miniContainer':'<td></td>'}// utilizar propiedades de js para etiquetas /// --


    renderElement(jsonTabla){//en este caso element es un json //tabla
        let html= `<tr>`;
        for (let clave in jsonTabla) {
            if (jsonTabla.hasOwnProperty(clave)) {
              
                if(/^ID_/.test(clave)){
                    html +=`<td id="${jsonTabla[clave]}">${jsonTabla[clave]}</td>`;
                }else{
                    if(clave=='img'){
                        html +=`<td><img src="${jsonTabla[clave]}" width="100px"></td>`;
                    }else{
                        //<td><input type="text" id="nombreMedicamento" placeholder="Nombre"></td>
                        html +=
                        `<td>${jsonTabla[clave]}
                        </td>
                        `;
                    }
                }
            }
        }      
        html += `<td><button id="agregarMedicamento" onclick="insert()">Update</button></td>`;
        html += `<td><button id="agregarMedicamento" onclick="hv.deleteElement()">Delete</button></td>`;

        html +=`</tr>`;
        return html;
    }

    insertInToContainer(idContainer,content){
        //container${pantalla}
        //containerMedicamento
        if(document.getElementById(idContainer)){
            document.getElementById(idContainer).innerHTML=`${content}`;
        }else{
            document.getElementById(idContainer).innerHTML=`No se pudo Renderizar`;
        }
    }
}


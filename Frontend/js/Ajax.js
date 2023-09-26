/**
@author djrodriguezc@unah.hn
@version 0.1.0
@since 6/08/21
objeto que encapsula la funcionalidad de comunicacion asincrona usando el objeto XMLHttpRequest. 
forma de uso:
antes de enviar la peticion difinir la funcion action, 
y  llamar las funciones de este objeto para definir la peticion
, el metodo, la url, parametros, y luego enviar 
*/
class Ajax{
	constructor(){
		this.xhr = new XMLHttpRequest;
		
		
		this.method = "get";
		this.url = "";
		this.parameters ="";
		/**En caso de error Que siempre retorne una respuesta en formato de json */
		this.response = "";
		this.requestHeader = "";
		//this.xhr.onload=this.action;
		
	}
	/**En caso asignar el metodo POST, por defecto la informacion que se envie, se tiene que enviar en formato urlencoded(como si fuera get).  */
	setAsPost(){
		this.method = "post";
	}
	setAsGet(){
		this.method = "get";
	}
	/**Recibe los Parametros que va a enviar en la peticion asincrona. 
	Tienen que ser un str, y ESTAR DEFINIDO EN FORMATO URLENCONDED.
	ej: param=ValorParam&param2=ValorParam2
	Observacion, el & separa las variables.
	@param tag: una etiqueta
	@param str: en formato de link
	@param []: en formato de arreglo
	*/
	setParameters(param){
		//if(typeof param == "str"){}
		this. parameters = param;
	}
	
	action (){
		if (this.xhr.readyState == 4){
			if (this.xhr.status == 200){
				
				this.response = this.xhr.responseText;
				console.table("respuestaPeticion:"+this.xhr.responseText);
				//this.xhr.onload();
				//document.write(this.xhr.responseText);	
			}else{
				console.table("respuestaPeticion:",this.xhr.responseText,"Error:la consulta asincrona ha generado un codigo distinto de 200");					
			}
		}
	}
	
	onload(){
		
	}
	
	getResponse(event){
		
		let result;
		return event.target.onload=()=>{
			return event.target.responseText
		};
		
	}
	setUrl(url){
		this.url = url;
	}
	/**funcion que se ejecuta cada cambio de estado del readyState.
	Definiendola como funcion asincrona.*/
	send(){
		this.loadEventListener(this.xhr,this.action);
		this.loadEventListener(this.xhr,this.onload);
		console.log("enviando");
		if (this.method && this.url){
			this.xhr.open(this.method,this.url);
			//para enviar la informacion como json:
			//http.setRequestHeader('Content-type', 'application/json')
			if (this.method == "post"){
				this.xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			}
			this.xhr.send(this.parameters);				
		}else{
			console.error("Le falta definir correctamente la peticion");
		}
	}
	
	loadEventListener(element,action){
		element.addEventListener("load",action.bind(this));
	}
	
	requestToAPI(){
		this.loadEventListener(this.xhr,this.action);
		this.loadEventListener(this.xhr,this.onload);
		this.xhr.withCredentials = true;
		console.log("enviando");
		if (this.method && this.url){
			this.xhr.open(this.method,this.url);
			//para enviar la informacion como json:
			//http.setRequestHeader('Content-type', 'application/json')
			if (this.method == "post"){
				this.xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			}
			
			//ajax.xhr.setRequestHeader('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8');
			
			this.xhr.setRequestHeader("x-rapidapi-key", "4f31c8403cmshc53918d9107fb82p16c6b7jsn7370300c6507");
			this.xhr.setRequestHeader("x-rapidapi-host", "sridurgayadav-chart-lyrics-v1.p.rapidapi.com");
			//ajax.xhr.setRequestHeader('Access-Control-Allow-Origin', 'GET');
			this.xhr.send(this.parameters);				
		}else{
			console.error("Le falta definir correctamente la peticion");
		}
		
	}
	
	
	
	/*
	loadAction(event){
		console.warn(event.target.responseText);//.responseText
		this.xhr.onreadystatechange = this.action.bind(this);
		return event.target.responseText;
	}	
	
	loadListener(element,action){
		element.addEventListener("load",action.bind(this));
	}
	
	clickAction(event){
		console.warn(event);
		//event.target.addEventListener("click",this.send);	
	}
	
	getResponse(event){
		console.log(event);
	}
	
	clickEventListener(element,action){
		console.log(action);
		element.addEventListener("click",action.bind(this));
	}*/
}

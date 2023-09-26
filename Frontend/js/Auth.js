/**
 * 
 */

class Validator{
	constructor(){}
	//Para validar un correo
	email(mail){
		if (mail.match(/^[a-z]+\.[a-z]+@unah\.hn$/)) return true;
		return false;
	}
}
class Auth{
	constructor(){
	}
	
	
	/**Clase que Administra el evento de click a una etiqueta,
	el 2do parametro indica la accion que le queremos añadir.  
	en este caso a un button, */
	clickEventListener(who, action){
		//who es una etiqueta del DOM
		//action es una funcion
		who.addEventListener("click", action.bind(this));
	}
	
	/**Funcion que envia una peticion asincrona(al controlador) para autenticar los datos. */
	login(){
		/**Obtiene los valores de los inputs para logear usando del Dom,
		usando selectores de etiqueta y atributos:
		 document.querySelector("tag[atributo=valorAtrib]")
		*/
		let userName = document.querySelector("input[type=email]").value;
		let password = document.querySelector("input[type=password]").value;
		let validator = new Validator();
		
		/** Antes de enviar la autenticacion de credenciales valida si el correo es valido, de lo contrario no solicita la autenticacion. */
		if (validator.email(userName)){
			
			let ajax = new Ajax();
			
			ajax.onload = ()=>{
				//console.log("Funciona")
				let json = JSON.parse(this.response);
				console.table("Mandando Funcion Onload definida",ajax.response);
				if(json.status){
					location.href="index.jsp";
				}else{
					//Mostrar un mensajd de respuesta en la pantalla Login.jsp
					//"El Usuario y/o Contraseña son invalidos"
					
					//Se solicita al estudainte aplicar POO para mostrar esete mensaje en pantalla
				}
				
			};
			
			ajax.setAsPost();
			ajax.setUrl("controller/login.jsp");
			ajax.setParameters(`userName=${userName}&password=${password}`);
			
			//ajax.loadEventListener(ajax,onload);
			
			ajax.send();		
		}else{
			console.table("El Nombre de usuario no es un correo Electronico");
		}
		
		
	}
}
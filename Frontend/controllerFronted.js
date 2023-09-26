/** Controlador es para hacer peticiones al backend y recibir esa informacion para mostrarla en la vista(index). */

function mostrarClienteRecibido(clienteJSON){
	let informacionHTML = 
	`
	<h1>${clienteJSON.ID_Cliente}</h1>
	<h1>${clienteJSON.ID_Persona}</h1>
	<h1>${clienteJSON.ID_Tipo_Cliente}</h1>
	<h1>${clienteJSON.Fecha_Ingreso}</h1>
	`;
	return informacionHTML;
}

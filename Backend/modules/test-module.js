var usuario = require('module/usuario')
function mostrarMensaje(){
    return 'Hola mundo, funcion de un modulo';
}

//con esto estamos exportando 1 funcionalidad del modulo.
module.exports.mostrarMensaje = mostrarMensaje;

module.exports.variable = 5; // para poder utilizarlo desde afuera.

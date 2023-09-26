const app = require('./Backend/app');


//database.conectar();



/**Levantando Servidor */
app.listen(
    app.get('port'),
);
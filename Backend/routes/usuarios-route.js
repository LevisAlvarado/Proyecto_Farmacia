/**aqui es igual que el index casi.
 * pero no se utiliza la variable app.
 * SOLO:
*/
var express = require('express');
var router = express.Router(); // en lugar de app usar router.

// entonces: ...
router.get('/',(req,res)=>{});
router.post();
router.put();
router.delete();
//...

//ahora esta todo encapsulado aqui.

/**y se exporta todo el objeto completo.*/
module.export = router;


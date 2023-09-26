const express = require('express');
const Controller = require('../controllers/Controller');

const router = express.Router();

router.get('/consulta', Controller);

module.exports = router;

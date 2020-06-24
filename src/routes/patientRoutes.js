const patientRouter = require('express').Router();
const PatientController = require('../controllers/patient-controller');

// écrire middleware
patientRouter.get('/', PatientController.getAll);

patientRouter.get('/:id', PatientController.getOne);

patientRouter.post('/', (req, res) => {});

patientRouter.put('/:id', (req, res) => {});

patientRouter.delete('/:id', (req, res) => {});

module.exports = patientRouter;

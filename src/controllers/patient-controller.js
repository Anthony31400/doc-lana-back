const Patient = require('../models/patient-model');

class PatientController {
  static getAll(req, res) {
    try {
      Patient.getAll((error, results) => {
        if (!results.length) {
          res.status(404).json({
            status: 'error',
            errorMessage: 'Not Fround'
          });
        } else {
          res.status(200).send(results);
        }
      });
    } catch (err) {
      res.status(500).json({
        status: 'error',
        errorMessage: 'Our server encountered an error performing the request'
      });
    }
  }

  static getOne(req, res) {
    const { id } = req.params;
    try {
      Patient.getOne(id, (error, results) => {
        if (!results.length) {
          res.status(404).json({
            status: 'error',
            errorMessage: 'Not Fround'
          });
        } else {
          res.status(200).send(results[0]);
        }
      });
    } catch (err) {
      res.status(500).json({
        status: 'error',
        errorMessage: 'Our server encountered an error performing the request'
      });
    }
  }

  static postOne(req, res) {
    const { nom, prenom, email, telephone, adresse, code_postal, ville } = req.body;
    try {
        if (!nom || !prenom ||)
    } catch (err) {
      res.status(500).json({
        status: 'error',
        errorMessage: 'Our server encountered an error performing the request'
      });
    }
  }
}

module.exports = PatientController;

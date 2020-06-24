const connection = require('../../db');

class PatientModel {
  static getAll(cb) {
    connection.query('SELECT * FROM Patient', (err, results, fields) => {
      cb(err, results, fields);
    });
  }

  static getOne(id, cb) {
    connection.query('SELECT * FROM Patient WHERE id=?', id, (err, results, fields) => {
      cb(err, results, fields);
    });
  }
}

module.exports = PatientModel;

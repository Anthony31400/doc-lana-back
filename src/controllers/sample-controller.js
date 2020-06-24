const model = require('../models/sample-model');

class tableController {
    static getAll(req, res) {
        try {
            model.getAll((error, results) => {
                
            })

        } catch (err) {
            res.status(500).json({
                status: 'error',
                errorMessage: 'Our server encountered an error performing the request',
              });
        }
    }
}
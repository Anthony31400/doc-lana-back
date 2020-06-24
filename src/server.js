const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;
// import your router here
// const tableRouter = require('./routes/fileRoute.js)
app.use(express.json());
app.use(cors());
// Add your router here with app.use
// app.use('/table', tableRouter) ...

const server = app.listen(PORT, () => {
    console.log(`🌍 Server is running on port ${PORT}`);
  });
  
  module.exports = server;
  
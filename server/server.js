require("dotenv").config();
const express = require("express");
const app = express()

// get port number
const port = process.env.PORT;

// listen to client request
app.listen(port, () => {console.log(`Server is up and listening on ${port}`)});
require("dotenv").config();
const { json } = require("express");
const express = require("express");
const app = express()

// get port number
const port = process.env.PORT;

// CREATE a user
app.post("/api/v1/createUser", (req, res) => {
    res.status(201).json({
        status: "successful",
        data: 1234567890
    });
})

// CREATE a workout entry

// CREATE a personal record

// READ a user information

// READ a workout entry

// READ a personal record

// READ all personal records

// UPDATE a user

// UPDATE a workout entry

// UPDATE a personal record

// DELETE a user

// DELETE a workout entry

// DELETE a personal record

// listen to client request
app.listen(port, () => {console.log(`Server is up and listening on ${port}`)});
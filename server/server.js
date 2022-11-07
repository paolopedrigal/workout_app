require("dotenv").config();
const { json } = require("express");
const express = require("express");
const db = require("./db");
const app = express()

// NOTE: Database schema is called "workout_app"

// get port number
const port = process.env.PORT;

// CREATE a user
// app.post("/api/v1/createUser", async (req, res) => {
//     try {
//         // const results = await db.query("INSERT INTO Users (username, user_password, first_name, last_name, birthday)
//         res.status(201).json({
//             status: "successful",
//             data: 1234567890
//         });
//     } catch(error) {
//         console.log(error)
//     }

// })

// CREATE a workout entry

// CREATE a personal record

// READ all users information
app.get("/api/v1/readUsers", async (req, res) => {
    try {
        const results = await db.query("SELECT * FROM workout.Users");
        res.status(200).json({
            status:"successful",
            data: {
                results: results.rows
            }
        })
    } catch(error) {
        console.log(error);
    }
})

// READ a user information
app.get("/api/v1/readUser/:id", async (req, res) => {
    try {
        const results = await db.query("SELECT * FROM workout.Users WHERE u_id = $1", [req.params.id]);
        res.status(200).json({
            status: "successful",
            data: {
                results: results.rows[0] // indexing by 0 because only sending back one user
            }
        })
    } catch (error) {
        console.log(error)
    }
})

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
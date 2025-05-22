import express from "express";
import bodyParser from "body-parser";
import axios from "axios";
import pg from "pg";
import bcrypt from "bcrypt";
import env from "dotenv";


const app = express();
const port = 3000;
const saltRounds = 10;
env.config() 

app.use(express.static("views"));
app.use(express.static("public"));


app.use(bodyParser.urlencoded({ extended: true }));

app.set("views", "./views"); 
app.set("view engine", "ejs");

const db = new pg.Client({
    user: process.env.PG_USER,
    host: process.env.PG_HOST,
    database: process.env.PG_DATABASE,
    password: process.env.PG_PASSWORD,
    port: process.env.PG_PORT
})

app.get("/", (req, res) => {
  res.render("index.ejs");
});

app.listen(port, () => {
    console.log(`Listening on port ${port}`);
})
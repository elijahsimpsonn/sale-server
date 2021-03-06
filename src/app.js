require("dotenv").config();
const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const helmet = require("helmet");

const { NODE_ENV } = require("./config");

const AuthRoute = require("../routes/auth-router")

const morganOption = NODE_ENV === "production" ? "tiny" : "common";

const app = express();

app.use(morgan(morganOption));
app.use(helmet());
app.use(cors());

//TODO
//Set routes for App
app.use("/api/auth", AuthRoute)

app.use(function errorHandler(error, req, res) {
  let response;
  if (NODE_ENV === "production") {
    response = { error: { message: "server error" } };
  } else {
    response = { message: error.message, error };
  }
  res.status(500).json(response);
});

module.exports = app;
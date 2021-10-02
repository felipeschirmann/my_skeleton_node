'use strict';

const express = require('express');
require('dotenv').config()

// Constants
const PORT = parseInt(env.APP_PORT);
const HOST = env.APP_HOST;

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World -> ');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
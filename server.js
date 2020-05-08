var express = require('express'),
    app = express(),
    port = process.env.PORT || 3001,
    bodyParser = require('body-parser'),
    controller = require('./controller');
var cors = require('cors');
	

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var routes = require('./route');
routes(app);

app.listen(port);
console.log('Skripsiku su iki minggir ' + port);
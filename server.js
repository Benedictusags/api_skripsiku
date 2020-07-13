var express = require('express'),
    app = express(),
    port = process.env.PORT || 3001,
    bodyParser = require('body-parser'),
	path = require('path'),
    controller = require('./controller');
var cors = require('cors');
	

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('./public'));

var routes = require('./route');
routes(app);

app.listen(port);
console.log('Connected! ' + port);
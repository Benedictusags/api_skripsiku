'use strict';

var response = require('./res');
var connection = require('./conn');

exports.users = function(req, res) {
    connection.query('SELECT * FROM user', function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
    });
};

exports.adduser = function(req, res) {

    const email = req.body.email;
    const pass = req.body.pass;

    connection.query(`INSERT INTO 'user' ('email', 'pass') VALUES (${email}, ${pass});`, 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
    });
};

exports.index = function(req, res) {
    response.ok("Hello from the Node JS RESTful side!, BERHASIL YES!", res)
}
var express = require('express');

var app = express();

var mysql = require("mysql2");
  
var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "checkeat",
  password: "Notna54321"
});

db.connect(function(err){
   if (err) {
     return console.error("Ошибка: " + err.message);
   }
   else{
     console.log("Подключение к серверу MySQL успешно установлено");
   }
});

app.listen(777, function(){
	console.log('API app started');
})

app.get('/', function(req, res){
	res.set('Access-Control-Allow-Origin', '*');
	res.send('API started');
})

app.get('/food', function(req, res){
	db.query(
	  'SELECT * FROM product',
	  function(err, results) {
	  	res.set('Access-Control-Allow-Origin', '*');
	  	res.send(results);
	  }
	);
})


app.get('/food/:name', function(req, res){
	console.log(req.params.name)
	db.query(
	  `SELECT * FROM product WHERE name = "${req.params.name}"`,
	  function(err, results) {
	  	res.set('Access-Control-Allow-Origin', '*');
	    res.send(results);
	  }
	);
})

app.get('/category', function(req, res){
	db.query(
	  'SELECT * FROM category',
	  function(err, results) {
	  	res.set('Access-Control-Allow-Origin', '*');
	    res.send(results);
	  }
	);
})

app.get('/category/:id', function(req, res){
	db.query(
	  'SELECT * FROM category WHERE id = ' + req.params.id,
	  function(err, results) {
	  	res.set('Access-Control-Allow-Origin', '*');
	    res.send(results);
	  }
	);
})

app.get('/sales', function(req, res){
	db.query(
	  'SELECT * FROM sales',
	  function(err, results) {
	  	res.set('Access-Control-Allow-Origin', '*');
	    res.send(results);
	  }
	);
})

app.get('/sales/:month/:day', function(req, res){
	db.query(
	  `SELECT * FROM sales WHERE month = ${req.params.month} AND day = ${req.params.day}`,
	  function(err, results) {
	  	res.set('Access-Control-Allow-Origin', '*');
	    res.send(results);
	  }
	);
})

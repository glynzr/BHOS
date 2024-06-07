// Calling NODE from terminal, testing!

// function
function multiply(x, y){
    console.log(x * y);
}
multiply(50, 50)

// object
var obj = {
    authorName: 'Amin Sharif',
    language: 'Node.js'
}
console.log(`${obj.authorName} is a master of ${obj.language}`)

// MODULES:---------------------------------------------------------------------
// Core Modules ('http', 'url', 'path', 'fs', 'util')
// Local Modules ('modules written as external file and attached throug export')
// Third Party Modules ('written by third party resourses, developers...)

//Loading Core Modules----------------------------------------------------------
// Example : HTTP module
//var module = require('module_name');

var http = require('http');
var server = http.createServer(function(req, res){
  //write code here
  console.log("http server has been started!");
});
server.listen(5000);

// LOADING LOCAL MODULE
var myDataModule = require('./Data.js');
var myMessageModule = require('./Messages.js');
var myLogModule = require('./Log.js');

// LOADING 3rd party module: chalk
const chalk = require('chalk');

// // Export multi variables
var user = require('./MultiVars.js').user;
var userMessage = require('./MultiVars.js').userMessage;

// // Export multiply functions
const animalLib = require('./MultiFunctions.js');

// myLogModule.info('Node.js started');
console.log(myMessageModule);
console.log(`Hi, I am ${myDataModule.firstName}, ${myDataModule.lastName}`);
console.log(chalk.inverse.red(user.username));

userMessage('LINUX');

animalLib.animalName('Wolf');


// // Running 'NPM INIT' to initialise NPM Package into our application
// // Install third party package: 'validator'
// // https://www.npmjs.com/package/validator

var validator = require('validator');
console.log(validator.isEmail('foo@bar.com'));

// FS file system module -----------------------------------------------
let fs = require('fs');

// Reading a file: Default, asynchronous way
fs.readFile('notes.txt', function(err, data){
    if(err) throw err;
    console.log(data.toString('utf8'));
})

// // Append a data : synchronous way ---------------------------------
var data = '\nAnother row like continue...';
// fs.appendFileSync('notes.txt', data, 'utf8');

// // Append a data : Asynchronous way --------------------------------
fs.appendFile('notes.txt', data, 'utf8', function(err){
    if(err) throw err;
    console.log('data is appended successfully')
})


// Working with JSON data ---------------------------------------------
var jsonData = '{"person": [{"name":"Elmir", "city":"baku"}, {"name":"Arzu", "city":"Shaki"}]}';

var jsonObj = JSON.parse(jsonData);
console.log(jsonObj);
console.log(jsonObj.person[0].name);

var jsonCont = JSON.stringify(jsonObj);
console.log(jsonCont);

// Writing to JSON file: Asynchronous way ----------------------------
fs.writeFile("output.json", jsonCont, "utf8", function(err){
    if(err){
        console.log("error occured when writing to JSON");
        return console.log(err);
    }
    console.log("JSON file has been saved");
})

// Appending new data to existing JSON file --------------------------
// Reading JSON file: Synchronous way --------------------------------
const readData = fs.readFileSync('output.json');
//const jsonData = readData.toString()
const data = JSON.parse(readData)
console.log(data)
// Pushing new record
data.person.push({name: 'narmin', city: 'balakan'});
json = JSON.stringify(data)
fs.writeFileSync('output.json', json);

// Creating simple HTTP server --------------------------------------
var http = require('http');

// //create a server
http.createServer(function(req, res){
    // http header
    res.writeHead(200, {'Content-Type': 'text-html'});
    res.write('<h1>First simple Node server</h1>');
    res.end();
}).listen(9000);


// Working with MySQL -----------------------------------------------
var mysql = require('mysql');

// Creating a connection
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "azerbaijan"
})

// Trying to connect
con.connect(function(err){
    if(err) throw err;
    console.log("conncted to mysql");
})

// SELECT FROM table
con.connect(function(err){
    if(err) throw err;
    con.query("SELECT * FROM regions", function(err, result, fields){
        if(err) throw err;
        console.log(result);

    })
})

// Inserting multiple data into table via array
con.connect(function(err){
    if(err) throw err;
    let arr = [
        ['Buxara', 3455.33, 12435456],
        ['Pendik', 3455.33, 45667565]
    ];
    con.query("INSERT INTO regions(region_name, area, population) VALUES?", [arr], function(err, result, fields){
        if(err) throw err;
        console.log(result);
    })
})
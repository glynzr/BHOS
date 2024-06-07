// FREE API's LIST : https://apipheny.io/free-api/

let fs = require('fs');
let http = require('http');
const axios = require('axios');

let jsonData = ''; 
const allData = [];
/*
// TASK - 1 -----------------------------------------------------------------------------------------------

// step-1 : pulling data from API
axios.get('http://universities.hipolabs.com/search?country=United+States')
  .then(response => {
    const alldata = response.data;  //to console object type data
    alldata.forEach(element => {
        //console.log(element.name);
        jsonData += `<p>${element.name}</p>`;
        allData.push(element.name);  // just to define length of array later
    });
  })
  .catch(error => {
    console.log(error);
  });

// step-2 : displaying data on WEB Server
http.createServer( (req, res) => {
    // http header
    res.writeHead(200, {'Content-Type': 'text-html'});
    res.write('<h1> Pulling JSON data </h1>');
    // get length of array
    res.write(`<h3> List of Universities in USA: ${allData.length} </h3>`)
    res.write(jsonData);
    res.end();
}).listen(9000, console.log('listening to port 9000'));
*/

//   axios.get('http://universities.hipolabs.com/search?country=United+States')
//   .then(response => {
//     console.log(response.data);  //to console object type data
//     // step-2 : stringifing data and writing in json file
//     //jsonData = JSON.stringify(response.data);  //to stringify object data to json
//     //fs.writeFileSync('usa-universities.json', jsonData);  // it is already written!
//   })
//   .catch(error => {
//     console.log(error);
//   });

// TASK - 2 -----------------------------------------------------------------------------------------------
// step-1: Reading JSON file
const readData = fs.readFileSync('currencies.json');
const fileData = readData.toString();
const data = JSON.parse(fileData);
//console.log(data);

// step-2: Iterating JSON object
convertedData = '';
for (const [key, value] of Object.entries(data)) {
    convertedData += ` <h3> ${key}. ${value.name} </h3> `;
}

// step-3: Creating HTTP server and displaying JSON data from file
http.createServer(function(req, res){
    // http header
    res.writeHead(200, {'Content-Type': 'text-html'});
    res.write('<h1> World currencies </h1>');
    res.write(convertedData);
    res.end();
}).listen(9000, console.log('server is running on port: 9000'));

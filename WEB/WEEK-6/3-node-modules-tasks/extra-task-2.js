// const sample = {
//     "employees":[
//       {"firstName":"John", "lastName":"Doe"},
//       {"firstName":"Anna", "lastName":"Smith"},
//       {"firstName":"Peter", "lastName":"Jones"}
//     ]
// }

// console.log(sample.employees)

let fs = require('fs');
let http = require('http');
const axios = require('axios');

let jsonData = ''; 
const allData = [];

// step-1: Reading JSON file
const readData = fs.readFileSync('500_records.json');
const fileData = readData.toString();
const data = JSON.parse(fileData);
//console.log(data.feeds);

// forEach
// data.feeds.forEach(element => {
//   console.log(element.name, element.location)
// });

const newarr = data.feeds.map( (el)=> {
  return el.name, el.location
});

console.log(newarr);
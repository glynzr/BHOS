// TUTORIAL : https://www.twilio.com/blog/2017/08/http-requests-in-node-js.html
// HTTP – the Standard Library ----------------------------------------------------

const https = require('https');

https.get('https://jsonplaceholder.typicode.com/posts', (resp) => {
  let data = '';

  // A chunk of data has been received.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
});



// REQUEST -----------------------------------------------------------------------
// Request is a simplified HTTP client comparable to Python’s requests library
// his library is much more user friendly than the default http module and has been 
// considered a go-to for the community for several years.

const request = require('request');

request('https://jsonplaceholder.typicode.com/posts', { json: true }, (err, res, body) => {
  if (err) { return console.log(err); }
  console.log(body.url);
  console.log(body);
});



// Axios
// Axios is a Promise based HTTP client for the browser as well as node.js. 
// Using Promises is a great advantage when dealing with code that requires 
// a more complicated chain of events. 
const axios = require('axios');

axios.get('https://jsonplaceholder.typicode.com/posts')
  .then(response => {
    console.log(response.data.url);
    console.log(response.data);
  })
  .catch(error => {
    console.log(error);
  });
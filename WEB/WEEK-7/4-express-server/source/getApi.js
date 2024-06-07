const axios = require('axios');
let url = 'http://universities.hipolabs.com/search?country=United+States';

function getApiData() {
    return axios.get(url)
    .then( response => response.data );
}

module.exports = getApiData;
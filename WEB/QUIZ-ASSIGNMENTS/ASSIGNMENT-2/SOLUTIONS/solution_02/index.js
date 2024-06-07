const express = require('express');
const axios = require('axios');
const hbs = require('hbs');
const path = require('path');
const fs = require('fs');

const app = express();
const apiUrl = 'https://api.publicapis.org/entries';
let isDataReady = false;
app.listen(3000, () => console.log('Server started'));

const publicDir = path.join(__dirname, './public');
hbs.registerPartials(path.join(__dirname, './views/partials'));
app.use(express.static(publicDir));
app.set('view engine', 'hbs');

setTimeout(() => {
    axios.get(apiUrl)
        .then((response) => {
            fs.writeFile('api.json', JSON.stringify(response.data, null, 2), (err) => {
                if (err) throw err;
                console.log('JSON data is saved.');
                isDataReady = true;
            });
        }
        ).catch((err) => {
            throw(err);
        });
}, 3000);



app.get('/home', (req, res) => {
    res.render('index');
});

app.get('/api-data', (req, res) => {
    if (isDataReady) {
        fs.readFile('api.json', (err, data) => {
            if (err) throw err;
            const apiData = JSON.parse(data);
            const entries = apiData.entries.slice(0, 200);
            res.render('api-data', { entries });
        });
    } else {
        res.render('api-data', { apiData: null });
    }
});
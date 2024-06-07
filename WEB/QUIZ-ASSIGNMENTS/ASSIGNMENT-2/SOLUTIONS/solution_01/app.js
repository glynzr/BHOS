const express = require('express');
const axios = require('axios');
const fs = require('fs');

const app = express();
const port = 3000;

const fetchDataAndWriteToFile = async () => {
    try {
        const response = await axios.get('https://api.publicapis.org/entries');
        fs.writeFileSync('apiData.json', JSON.stringify(response.data));
    } catch (error) {
        console.error('Error fetching and writing data:', error);
    }
};

const readJSONAndDisplay = () => {
    try {
        const data = JSON.parse(fs.readFileSync('apiData.json', 'utf-8'));
        const processedData = data.entries.slice(0, 200);
        return processedData;
    } catch (error) {
        console.error('Error reading JSON file:', error);
        return [];
    }
};

app.set('view engine', 'hbs');

app.get('/', (req, res) => {
    const processedData = readJSONAndDisplay();
    res.render('index', { data: processedData });
});

app.listen(port, () => {
    fetchDataAndWriteToFile();
    console.log(`Server is running on http://localhost:${port}`);
});

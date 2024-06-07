// 1: Install Express, creates routes
// 2: Serving up HTML and JSON
// 3: Serving up Static Assets (public folder)
// 4: Serving up CSS, JS and images
// 5: Dynamic pages with templating (we'll use handlebars for express as plugin: 'hbs')
// 6: Customizing the VIEW directory
// 7: Advanced Templating
// 8: 404 Page 

const path = require('path');
const express = require('express');
const hbs = require('hbs') // step-6: advanced templating

const app = express();

// STEP-2 : Let us configure routes like------------------------------------------
// app.com
// app.com/about
// app.com/help
/*
app.get('', (req, res) => {
    // response to user back to url
    //res.send('welcome to express server!')

    // STEP TWO: RENDER HTML TAGS
    res.send(`<h1>Welcome to Express</h1>
              <h4>Features of Express Server</h4>
              <p>All supplementary text will go here!</p>
    `)
})

// second route: about
app.get('/about', (req, res) => {
    // response to user back to url
    res.send('About me')
})

// Task for students: to add two routes: { about, weather }
// route: help
app.get('/help', (req, res) => {
    // response to user back to url
    //res.send('Help will be provided')

    // STEP TWO: pass object data: automatically stringified to JSON
    //res.send({author: "Emiliano", age: "44"})
    res.send([{name: "Emiliano"}, {name: "Mafioza"}])
})

// last route: weather
app.get('/weather', (req, res) => {
    // response to user back to url
    //res.send('Current weather of your city')

    //STEP TWO: pass weather as JSON object
    res.send({ location: 'Baku', temperature: '28C', condition: 'sunny' })
})
*/

// STEP-3 : Define path to public folder------------------------------------------
console.log(__dirname)  //complete path to folder
console.log(__filename) //complete path to file name
// lets use global module PATH
//console.log(path);
//console.log(path.join(__dirname)) // get the same path like: source folder
console.log(path.join(__dirname, '../public')) //get target to public folder!
const publicDir = path.join(__dirname, '../public')
// Customize Express: Tell express to serve up the PUBLIC directory
app.use(express.static(publicDir))
// after setting up PUBLIC, you can reload your page and see: index.html will be active

// TASK FOR STEP-3: create 2 html pages to serve: about.html, help.html
// Remove all route handlers for root, about and help pages, since we dont need


// STEP-5 : Using template engine: 'hbs'------------------------------------
app.set('view engine', 'hbs')
// create 'VIEWS' folder on root, to store all 'hbs' files there
// removing static html files from public folder
// to tell express to work with 'hbs' templates we have to create a route
/*
app.get('', (req, res) => {
    // insetad of send we must use render!
    res.render('index')
})
*/
// Rendering multiple dynamic variables
app.get('', (req, res) => {
    // we send to parameteres like an object
    res.render('index', {
        title: 'Simple App using hbs templates',
        name: 'author by, Mahammad Sharifov'
    })
})

app.get('/about', (req, res) => {
    res.render('about', {
        title: 'About me',
        name: 'Mahammad Sharif'
    })
})

app.get('/help', (req, res) => {
    res.render('help', {
        title: 'Help Page',
        name: 'Mahammad Sharif',
        helpText: 'Help: some helpfull text'
    })
})

// rendering objects, array of objects
app.get('/objdata', (req, res) => {
    // Example-2
    const projects = { "members" : [
        {name: "Leonell Messi", team: "Argentina"},
        {name: "Zlatan Ibrahimovich", team: "Sweden"},
        {name: "Roberto Baggio", team: "Italy"} ]
    }
    // Example-1
    // let projects = {
    //     name: 'Attila',
    //     skills: ['Data Mining', 'BlockChain Dev', 'Web Development']
    // }
    res.render('objdata', {projects: projects} )
})

// rendering json files
let fs = require('fs');
app.get('/jsonfile', (req, res) => {
    const filePath = './public/json/currencies.json';
    fs.readFile(filePath, 'utf-8', (err, data)=>{
        if (err){ 
            console.log("Error in file reading..", err.message);
        }
        const currencies = JSON.parse(data);
        res.render('jsonfile', {currencies: currencies});
    })
})

// rendering API data
const getApi = require('./getApi');
app.get('/apidata', (req, res) => {
    getApi()
    .then( response => {
        res.render('apidata', { apiData: response });
    })
})

// Step-6 : Customize VIEW directory, rename directory to : templates
// before routes, after app.set view engine --------------------------
// const pathView = path.join(__dirname, '../templates')
// app.set('views', pathView)


// STEP-7 : Define Partials Path--------------------------------------
const partialsPath = path.join(__dirname, '../views/partials')
hbs.registerPartials(partialsPath)
// restart nodemon to effect, cover hbs files ass well: 
// nodemon source/app.js -e hbs,js
//--------------------------------------------------------------------


// STEP-8 : Custom 404 page ------------------------------------------
app.get('/*', (req, res) => {
    res.send('My Custom 404 Page')
})
// TASK: Create 404 page with HBS


// the last method to listen application on port
app.listen(3000, () => {
    console.log('server is running on port: 3000')
})
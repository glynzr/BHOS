// const express = require('express');
// const session = require('express-session')
// const path = require('path')
// const app = express();
// const port = 3000;

// // Express body parser
// app.use(express.urlencoded({ extended: true }));

// // Express session
// app.use(
//     session({
//         secret: 'Keep it secret', 
//         name: 'uniqueSessionID', 
//         saveUninitialized: false,
//         resave: false
//     })
// )

// app.get('/', (req,res)=>{
//     if(req.session.loggedIn)
//         res.redirect('/dashboard')
//     else
//         res.sendFile('home.html', {root: path.join(__dirname,'/')})
// })

// app.get('/dashboard', (req,res)=>{
//     if(req.session.loggedIn) {
//         res.setHeader('Content-Type', 'text/html')
//         res.write('Welcome ' + req.session.username + ' to your dashboard')
//         res.write('<a href="/logout">Logout</a>')
//         res.end()
//     }
//     else
//         res.redirect('/login')
// })

// app.get('/login', (req,res)=>{
//     res.sendFile('login.html', {root:path.join(__dirname,'public')})
// })

// app.post('/authenticate', (req,res,next)=>{
//     // Actual implementation would check values in a database
//     if(req.body.username == 'user' && req.body.password == 'user1234') {
//         res.locals.username = req.body.username
//     next()
//     }
//     else
//         res.sendStatus(401)
//     }, (req,res)=>{
//         req.session.loggedIn = true
//         req.session.username = res.locals.username
//         console.log(req.session)
//         res.redirect('/dashboard')
//     }
// )

// app.get('/logout',(req,res)=>{
//     req.session.destroy((err)=>{})
//     res.send('Thank you! Visit again')
// })

// app.listen(port, ()=>{console.log('Website is running')});






const express = require('express');
const session = require('express-session');
const path = require('path');
const app = express();
const port = 3000;

app.set('view engine', 'ejs'); // Set EJS as the view engine
app.set('views', path.join(__dirname, 'views')); // Set the views directory

app.use(express.urlencoded({ extended: true }));

app.use(
    session({
        secret: 'Keep it secret',
        name: 'uniqueSessionID',
        saveUninitialized: false,
        resave: false
    })
);

app.get('/', (req, res) => {
    if (req.session.loggedIn)
        res.redirect('/dashboard');
    else
        res.render('login'); // Render the login.ejs file
});

app.get('/dashboard', (req, res) => {
    if (req.session.loggedIn) {
        res.render('dashboard', { username: req.session.username }); // Render the dashboard.ejs file with username data
    } else {
        res.redirect('/login');
    }
});

app.get('/login', (req, res) => {
    res.render('login'); // Render the login.ejs file for the login page
});

app.post('/authenticate', (req, res, next) => {
    if (req.body.username === 'user' && req.body.password === 'user1234') {
        res.locals.username = req.body.username;
        next();
    } else {
        res.sendStatus(401);
    }
}, (req, res) => {
    req.session.loggedIn = true;
    req.session.username = res.locals.username;
    res.redirect('/dashboard');
});

app.get('/logout', (req, res) => {
    req.session.destroy((err) => {});
    res.send('Thank you! Visit again');
});

app.listen(port, () => {
    console.log('Website is running');
});

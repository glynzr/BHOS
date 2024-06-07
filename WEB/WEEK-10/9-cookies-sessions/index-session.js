const express = require("express") 
const session = require('express-session') 
const app = express() 
const dotenv = require('dotenv');
dotenv.config();
   
// Session Setup 
app.use(
    session({ 
    // It holds the secret key for session, making session management more secure 
    secret: process.env.SESSION_SECRET, 
  
    // Forces the session to be saved back to the session store (After expiration not resave!!!)
    resave: false, 
  
    // Forces a session that is "uninitialized" to be saved to the store 
    saveUninitialized: false
    })
) ;
// If during the lifetime of the request the session object isn't modified then, at the end of the request 
// and when saveUninitialized is false, the (still empty, because unmodified) session object will not be stored 
// in the session store.
   
app.get("/", function(req, res){ 
    // req.session.key = value 
    req.session.name = 'BANM USER'
    return res.send("Session Set") 
}) 
   
app.get("/session", function(req, res){ 
    var name = req.session.name 
    return res.send(name) 
    /*  To destroy session you can use this function  
     req.session.destroy(function(error){ 
        console.log("Session Destroyed") 
    }) 
    */
}) 

app.get("/destroy", function(req, res){ 
    req.session.destroy(function(error){ 
        console.log("Session Destroyed") 
        return res.send('Session destroyed!')
    }) 
}) 
    
app.listen(3000, function(error){ 
    if(error) throw error 
    console.log("Server created Successfully") 
}) 
// const express = require("express") 
// const cookieParser = require("cookie-parser")
// const session = require('express-session')
// const app = express() 

// app.use(cookieParser());

// // creating 24 hours from milliseconds
// //const oneDay = 1000 * 60 * 60 * 24;
// const oneHour = 1000 * 60 * 60 * 0.1;
// const oneMinute=1000*60;
// // Session Setup 
// app.use(session({ 
  
//     // It holds the secret key for session, making session management more secure 
//     secret: 'Your_Secret_Key', 

//     // try it
//     cookie: { maxAge: oneHour },
  
//     // Forces the session to be saved 
//     // back to the session store 
//     resave: false, 
  
//     // Forces a session that is "uninitialized" 
//     // to be saved to the store 
//     saveUninitialized: false
// })) 
   
// app.get("/", function(req, res){ 
       
//     // req.session.key = value 
//     req.session.name = 'BANM USER'
//     return res.send("Session Set") 
// }) 
   
// app.get("/session", function(req, res){ 
   
//     var name = req.session.name 
//     return res.send(name) 
   
//     /*  To destroy session you can use this function  
//      req.session.destroy(function(error){ 
//         console.log("Session Destroyed") 
//     }) 
//     */
// }) 
    
// app.listen(3000, function(error){ 
//     if(error) throw error 
//     console.log("Server created Successfully") 
// }) 




const express = require("express") 
const cookieParser = require("cookie-parser")
const session = require('express-session')
const app = express() 

app.use(cookieParser());

// creating 24 hours from milliseconds
//const oneDay = 1000 * 60 * 60 * 24;
const oneHour = 1000 * 60 * 60 * 0.1;
const oneMinute=1000*60;
// Session Setup 
app.use(session({ 
  
    // It holds the secret key for session, making session management more secure 
    secret: 'Your_Secret_Key', 

    // try it
    cookie: { maxAge: oneHour },
  
    // Forces the session to be saved 
    // back to the session store 
    resave: false, 
  
    // Forces a session that is "uninitialized" 
    // to be saved to the store 
    saveUninitialized: false
})) 
   
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
    
app.listen(3000, function(error){ 
    if(error) throw error 
    console.log("Server created Successfully") 
}) 





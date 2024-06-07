// TASK : Session set to live one hour. After some period of time (1 minute), automatically 
// destroy the session!
const express = require("express") 
const cookieParser = require("cookie-parser")
const session = require('express-session')
const app = express() 

app.use(cookieParser());

// creating 24 hours from milliseconds
//const oneDay = 1000 * 60 * 60 * 24;
const oneHour = 1000 * 60 * 60 * 1;

// Session Setup 
app.use(session({ 
    secret: 'Your_Secret_Key', 
    cookie: { maxAge: oneHour },
    resave: false, 
    saveUninitialized: false
}));

app.listen(3000, function(error){ 
    if(error) throw error 
    console.log("Server created Successfully") 
});

// METHOD 1 -----------------------------------------------------------------------------------------

// sessionActive = true;
   
// app.get("/", function(req, res){ 
//     // req.session.key = value 
//     req.session.name = 'BANM USER';
//     sessionSetTime = new Date();
//     sesSetTime = sessionSetTime.getHours() * 60 + sessionSetTime.getMinutes();
//     console.log(sesSetTime);
//     return res.send(`Hi ${req.session.name} , your session is set to expiry after 1 hour`);
// }) 
   
// app.get("/session", function(req, res){ 
//     if (sessionActive){
//         var name = req.session.name ;
//         const now = new Date();
//         nowTime = now.getHours() * 60 + now.getMinutes();
//         console.log(nowTime);
//         diffMin = nowTime - sesSetTime;
//         console.log(diffMin);
//         if (diffMin >= 2){
//             req.session.destroy();
//             sessionActive = false;
//             console.log('its time to destroy the session!');
//         }
//         return res.send(`welcome, ${name} you are logged in`) 
//     }
//     else {
//         return res.send(`Your session is not active!!!`)
//     }   
// })

// app.get("/session", (req, res)=> { 
//     if (sessionActive){
//         var name = req.session.name ;
//         const now = new Date();
//         nowTime = now.getHours() * 60 + now.getMinutes();
//         console.log(nowTime);
//         diffMin = nowTime - sesSetTime;
//         console.log(diffMin);
//         if (diffMin >= 1){
//             req.session.destroy();
//             sessionActive = false;
//             console.log('its time to destroy the session!');
//             return res.send(`Your session has been destroyed!!!`);
//         } else {
//             return res.send(`welcome, ${name} you are logged in`)
//             //res.status(200).json({ message: 'welcome, you are logged in!!!' });
//         }
//     }
//     else {
//         return res.send(`Your session is not active!!!`)
//         //res.status(200).json({ message: 'Your session is not active!!!' });
//     }   
// })

// app.get("/logout", (req, res)=> {
//     if(req.session.name ){
//         return res.send(`Hi ${req.session.name} , your session is still exists!`)
//     }else{
//         return res.send('You are logged out !!! See you soon ...');
//     }
// });


// METHOD 2 -----------------------------------------------------------------------------------------

sessionActive = true;
   
app.get("/", function(req, res){ 
    // req.session.key = value 
    req.session.name = 'BANM_USER';
    sessionSetTime = new Date();
    return res.send(`Hi ${req.session.name} , your session is set to expiry after 1 hour`);
}) 
   
app.get("/session", function(req, res){ 
    if (sessionActive){
        var name = req.session.name ;
        // destroy session after a period !
        setTimeout( () => {
            req.session.destroy();
            sessionActive = false;
            console.log('its time to destroy the session!');
        }, 5000);
        return res.send(`welcome, ${name} you are logged in`) 
    }else{
        return res.send(`Your session is not active!!!`)
    } 
})

app.get("/logout", (req, res)=> {
    if(req.session.name ){
        return res.send(`Hi ${req.session.name} , your session is still exists!`)
    }else{
        return res.send('You are logged out !!! See you soon ...');
    }
})

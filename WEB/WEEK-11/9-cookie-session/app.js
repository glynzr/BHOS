const express=require('express')
const app=express()
const cookieParser=require('cookie-parser')
const session=require('express-session')

app.use(cookieParser())
app.use(session({
    secret:'secret',
    saveUninitialized:true,
    resave:false,
    // cookie:{maxAge:60*1000}
}))

app.get('/',(req,res)=>{
    req.session.name='john'
    req.session.isAuth=true;
    res.send('session has been set')
})

app.get('/get', (req, res) => {
    if (req.session.name && req.session.isAuth) {
        res.send(req.session); // Change here to access the session's name
    } else {
        res.send('Forbidden');
    }
});

app.get('/del', (req, res) => {
    req.session.destroy((err=>{
        
            res.redirect('/get')
            // console.log(req.session.name)
        
    }))
    // delete req.session
    // res.send('session deleted')
});


app.get('/d',(req,res)=>{

})


app.listen(3000,()=>{
    console.log('Server is running...')
})

// /Users/gulaynazarova/Desktop/BHOS/WEB/WEEK-11/9-cookie-session/app.js
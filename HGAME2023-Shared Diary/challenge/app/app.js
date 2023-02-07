const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const randomize = require('randomatic');
const ejs = require('ejs');
const path = require('path');
const app = express();

function merge(target, source) {
    for (let key in source) {
        // Prevent prototype pollution
        if (key === '__proto__') {
            throw new Error("Detected Prototype Pollution")
        }
        if (key in source && key in target) {
            merge(target[key], source[key])
        } else {
            target[key] = source[key]
        }
    }
}

app
    .use(bodyParser.urlencoded({extended: true}))
    .use(bodyParser.json());
app.set('views', path.join(__dirname, "./views"));
app.set('view engine', 'ejs');
app.use(session({
    name: 'session',
    secret: randomize('aA0', 16),
    resave: false,
    saveUninitialized: false
}))

app.all("/login", (req, res) => {
    if (req.method == 'POST') {
        // save userinfo to session
        let data = {};
        try {
            merge(data, req.body)
        } catch (e) {
            return res.render("login", {message: "Don't pollution my shared diary!"})
        }
        req.session.data = data

        // check password
        let user = {};
        user.password = req.body.password;
        if (user.password=== "K6$rpDogUhh7kKv4") {
            user.role = 'admin'
        }
        if (user.role === 'admin') {
            req.session.role = 'admin'
            return res.redirect('/')
        }else {
            return res.render("login", {message: "Login as admin or don't touch my shared diary!"})
        } 
    }
    res.render('login', {message: ""});
});

app.all('/', (req, res) => {
    if (!req.session.data || !req.session.data.username || req.session.role !== 'admin') {
        return res.redirect("/login")
    }
    if (req.method == 'POST') {
        let diary = ejs.render(`<div>${req.body.diary}</div>`)
        req.session.diary = diary
        return res.render('diary', {diary: req.session.diary, username: req.session.data.username});
    }
    return res.render('diary', {diary: req.session.diary, username: req.session.data.username});
})


app.listen(8888, '0.0.0.0');
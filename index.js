const express = require('express');

const app = express();

const port = 3000;

app.get("/", (req,res)=>{
res.send(`<h1>Welcome to my first Express App</h1>
<p>This is a simple Express application that serves a welcome message on the root route.</p>
`);
});

app.listen(port, ()=>{
console.log(`Your app is running on port : ${port}`);
})

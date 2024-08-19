const expresss = require('express');
const http = require('http');
const mongoose = require('mongoose');


const app = expresss();

const port = process.env.PORT || 3000;

var server = http.createServer(app);
var io = require("socket.io")(server);

//middle ware
app.use(expresss.json());

const db = "mongodb+srv://ritikjoshi741:9456597017ritik@cluster0.xdkks.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

mongoose.connect(db).then(()=> {
    console.log('connection successfull');
}).catch((e) => {
    console.log(e);
})

server.listen(port,'0.0.0.0', () => {
    console.log(`server running on port:- ${port}`);
})
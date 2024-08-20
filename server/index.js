const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const io = require("socket.io")(server);

app.use(express.json());

const DB =
  "mongodb+srv://ritikjoshi741:9456597017ritik@cluster0.xdkks.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";


io.on("connection", (socket) => {
  console.log("connected!");
  socket.on('createRoom',async ({ nickname }) => {
    console.log(nickname);
    // room is created
    
    // player is stored in the room
    // player is taken to the next screen
  });
});

io.on("error", (err) => {
    console.error("Socket.io error:", err);
});

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection successful!");
  })
  .catch((e) => {
    console.log(e);
  });

server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running on port ${port}`);
});

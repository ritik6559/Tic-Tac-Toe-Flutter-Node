const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const io = require("socket.io")(server);
const Room = require('./models/room');

app.use(express.json());

const DB =
  "mongodb+srv://ritikjoshi741:9456597017ritik@cluster0.xdkks.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";


io.on("connection", (socket) => {
  console.log("connected!");
  socket.on('createRoom', async ({ nickname }) => {
    console.log(nickname);
    try {
      // room is created
      let room = new Room();
      let player = {
        socketID: socket.id,
        nickname,
        playerType: 'X',
      };

      // player is stored in the room
      room.players.push(player);
      room.turn = player;
      room = await room.save();

      const roomId = room._id.toString();

      socket.join(roomId);
      //tell our client that room has been created
      //go to the next page
      // io -> send data to everyone
      // socket -> sending data to yourself
      io.to(roomId).emit("createdRoomSuccess", room);//telling client room has been created.
    } catch (e){
      console.log(e);
    }
    
  });


  socket.on('joinRoom',async ({nickname, roomId}) => {
    try{
      if(!roomId.match(/^[0-9a-fA-F]{24}$/)){
        socket.emit('errorOccurred','Please enter a valid room ID');
        return;
      }
      let room = await Room.findById(roomId);
      if(room.isJoin){
        let player = {
          nickname,
          socketID: socket.id,
          playerType: 'O'
        }

        socket.join(roomId);
        room.players.push(player);
        room.isJoin = false;
        room = await room.save();
        io.to(roomId).emit("joinRoomSuccess",room);
        io.to(roomId).emit("updatePlayers",room.players);
      } else {
        socket.emit('errorOccurred','Lobby is full');
      }
    } catch (e){
      console.log(e);
    }
  })
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

const mongoose = require('mongoose');

const playerSchema = new mongoose.Schema({
    nickname: {//name of the room 
        type: String,
        trim: true,
    },
    socketID: {//every user that joins has their own unique id to swicth turns.
        type: String,
    },
    points: {// points how many rounds won.
        type: Number,
        default: 0,
    },
    playerType:{// what the user is playng with X or 0.
        required: true,
        type: String,
    },
});

module.exports = playerSchema;
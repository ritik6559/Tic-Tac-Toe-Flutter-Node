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
    playerType:{// it shows whether it will be 0 or X.
        required: true,
        type: String,
    },
});

module.exports = playerSchema;
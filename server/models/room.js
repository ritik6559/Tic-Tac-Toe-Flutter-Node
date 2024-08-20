const mongoose = require('mongoose');
const playerSchema = require('./player');

const roomSchema = new mongoose.Schema({
    occupency :{// shows  hoe many player can play at a time.
        type: Number,
        default: 2,
    },
    maxRounds: {// decides max rounds that will be played
        type: Number,
        default: 6,
    },
    currenRound:{// tells which round is currently being played out of maxrounds.
        required: true,
        type: Number,
        default: 1,
    },
    players: [playerSchema],
    isJoin:{// it shows whether playe can joi or not if 2 players are present then it will be false wlse true
        type: Boolean,
        default: true,
    },
    turn: playerSchema,
    turnIndex: {// users turn if creator turn then 0 else 1.
        type: Number,
        default: 0,
    }
});


const roomModel = mongoose.model('Room', roomSchema);


module.exports = roomModel;
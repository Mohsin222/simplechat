const mongoose = require("mongoose");

const RoomSchema = mongoose.Schema(
  {

    users: Array,

  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Room", RoomSchema);

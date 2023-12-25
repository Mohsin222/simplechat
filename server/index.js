const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const authRoutes = require("./routes/auth");
const messageRoutes = require("./routes/messages");
const app = express();
// const socket = require("socket.io");
const { Server } = require("socket.io");
const http = require('http');

require("dotenv").config();

app.use(cors());
app.use(express.json());
const server = http.createServer(app);
const io = new Server(server);
mongoose
  .connect(process.env.MONGO_URL, 
  //   {
  //   // useNewUrlParser: true,
  //   // useUnifiedTopology: true,
  // }
  )
  .then(() => {
    console.log("DB Connetion Successfull");
  })
  .catch((err) => {
    console.log(err.message);
  });

app.use("/api/auth", authRoutes);
app.use("/api/messages", messageRoutes);

 server.listen(process.env.PORT, () =>
  console.log(`Server started on ${process.env.PORT}`)
);
// const io = socket(server, {
//   // cors: {
//   //   origin: "http://localhost:3000",
//   //   credentials: true,
//   // },

// });

global.onlineUsers = new Map();
io.on("connection", (socket) => {
  console.log('CONNECTED')
  global.chatSocket = socket;


  socket.on("add-user", (userId) => {
    onlineUsers.set(userId, socket.id);

    console.log(userId +'1463')
  });

  socket.on("send-msg", (data) => {

    // console.log(data)
    
    const sendUserSocket = onlineUsers.get(data.to);

    if (sendUserSocket) {
      
    console.log(sendUserSocket +'aaaaaaaaaaaaaaaaaaaaaaaaaa')
      socket.to(sendUserSocket).emit("msg-recieve", data);
    }
  });
});
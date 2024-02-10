const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const authRoutes = require("./routes/auth");
const messageRoutes = require("./routes/messages");
const userRoute = require("./routes/userRoute");
const app = express();
// const socket = require("socket.io");
const { Server } = require("socket.io");
const http = require('http');
const { on } = require("nodemon");

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
app.use("/api/user", userRoute);








 server.listen(process.env.PORT, () =>
  console.log(`Server started on ${process.env.PORT}`)
);
// const io = socket(server, {
//   // cors: {
//   //   origin: "http://localhost:3000",
//   //   credentials: true,
//   // },

// });

// global.onlineUsers = new Map();

// var users =[]

var onlineUsers=[]


io.on("connection", (socket) => {


  socket.on('OnlineUser',(data)=>{

    console.log('ONLINE USERS ')
    onlineUsers.push({
      userId:data,
      socketId:socket.id
    })




    console.log(onlineUsers[0].socketId.toString()+'###')
    socket.emit('AllOnlineUsers',onlineUsers,);

  })

  // socket.emit('AllOnlineUsers',onlineUsers,);




  console.log('CONNECTED')
  global.chatSocket = socket;
  console.log(socket.client+'aaaaaaaaaaaaaaa')

  //for add user in room
  socket.on("add-user", (roomId) => {
    // onlineUsers.set(userId, socket.id);

    console.log('USER CONNECTED   '+roomId)
    socket.join(roomId)



    io.to(roomId).emit("userConnected", 'New User');
  });


  //for send messages
  socket.on("send-msg", (data) => {


    
    // const sendUserSocket = onlineUsers.get(data.to);

    // console.log(onlineUsers   + data  ,'            ++12aaaaaaaaaaaaaaaaaaaaaaaaaa')
    // socket.emit("msg-recieve", data);

    console.log('msg REC ',data)
    // if (sendUserSocket) {
      
    // console.log(sendUserSocket +'aaa326aaaaaaaaaaaaaaaaaaaaaaa')
    //   // socket.to(sendUserSocket).emit("msg-recieve", data);
    
    //   io.to("11").emit("msg-recieve", data);
    // }
 
    socket.to(data.roomId).emit("msg-recieve", data);
  });




  //for disconnect
  socket.on('disconnect', (d) => {

console.log('MTYYYYY   @@'  + socket.id)
// onlineUsers.filter(user => user['socketIdy'] !== socket.id)
for (let i = 0; i < onlineUsers.length; i++) {
  if (onlineUsers[i].socketId === socket.id) {
    onlineUsers.pop(i)

    
  }
}
socket.emit('AllOnlineUsers',onlineUsers,);
    console.log('DISCONNECTED' + onlineUsers.length)

    // socket.leave(rommId)
    // const user = removeUser(socket.id)

    // if (user) {
        // io.to(user.room).emit('message', generateMessage('Admin', `${user.username} has left!`))
        // io.to(user.room).emit('roomData', {
        //     room: user.room,
        //     users: getUsersInRoom(user.room)
        // })
    // }
})


//   socket.on('disconnect', () => {
//     onlineUsers.removeUser(user.id);
// io.emit('dicconnect',user)
  
// })
});

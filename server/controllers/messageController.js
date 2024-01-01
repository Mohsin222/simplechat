const Messages = require("../models/messageModel");
const roomModel = require("../models/room_model");
module.exports.getMessages = async (req, res, next) => {
  try {
    const { from, to } = req.body;

    const messages = await Messages.find({
      users: {
        $all: [from, to],
      },
    }).sort({ updatedAt: 1 });

    const projectedMessages = messages.map((msg) => {
      return {
        fromSelf: msg.sender.toString() === from,
        message: msg.message.text,
        image:msg.image.text
      };
    });
    res.json(projectedMessages);
  } catch (ex) {
    next(ex);
  }
};

module.exports.addMessage = async (req, res, next) => {
  try {
    const { from, to, message ,image} = req.body;
    const data = await Messages.create({
      message: { text: message },
      users: [from, to],
      image:{text:image},
      sender: from,
    });

    if (data) return res.json({ msg: "Message added successfully." });
    else return res.json({ msg: "Failed to add message to the database" });
  } catch (ex) {
    next(ex);
  }



};

module.exports.createRoom = async(req,res,next)=>{
try {
  const { clientModel, myModel} = req.body;


  var  find1 =await roomModel.find({
  $and:[
    {"users.email":clientModel.email},
{    "users.email":myModel.email}
  ]
    })

    if(find1.length >0){
      console.log('alreay created')
      return res.status(200).json({success:true,message:'alreay created',data:find1})
    }
    
  

  var users=[]
  users.push(clientModel)
  users.push(myModel)

  const data = await roomModel.create({
    
    users: [clientModel, myModel],

  });
  if (data) return res.json({ msg: "room  create successfully.",data:data });
  else return res.json({ msg: "Failed to create room" });
} catch (error) {
  res.status(500).json({error:error})
}
}

module.exports.getRoom = async(req,res,next)=>{
  try {

  
  // var find1 =await roomModel.find()
  

var  find1 =await roomModel.find({
$and:[
  {"users.email":"mohsin@gmail.com"},
{"users.email":"ali@gmail.com"}
]
}

)
 
    if (find1) return res.json({ msg: "rooms" ,data:find1});
    else return res.json({ msg: "Failed to create room",data:[] });
  } catch (error) {
    res.status(500).json({error:error})
  }
  }
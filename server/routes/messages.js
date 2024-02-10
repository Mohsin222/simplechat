const { addMessage, getMessages, createRoom ,getRoom,getAllMyRoom} = require("../controllers/messageController");
const router = require("express").Router();
const {checkToken} =require('../utils/jwtVerity')
router.post("/addmsg/", addMessage);
router.post("/getmsg/", getMessages);
router.post("/createRoom/", createRoom);
router.get("/getRoom/",checkToken, getRoom);


router.get("/getAllMyRoom/",checkToken, getAllMyRoom);
module.exports = router;

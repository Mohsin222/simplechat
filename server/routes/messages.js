const { addMessage, getMessages, createRoom ,getRoom} = require("../controllers/messageController");
const router = require("express").Router();

router.post("/addmsg/", addMessage);
router.post("/getmsg/", getMessages);
router.post("/createRoom/", createRoom);
router.get("/getRoom/", getRoom);
module.exports = router;

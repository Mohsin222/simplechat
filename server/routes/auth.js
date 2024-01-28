const {
  login,
  register,
  getAllUsers,
  setAvatar,
  logOut,
} = require("../controllers/authController");

const router = require("express").Router();

const {checkToken} =require('../utils/jwtVerity')




router.post("/login", login);
router.post("/register", register);
router.get("/allusers/:id",checkToken, getAllUsers);
router.post("/setavatar/:id",checkToken, setAvatar);
router.get("/logout/:id", logOut);

router.get('/protected',checkToken, (req, res) => {

  console.log(req.userId)
  res.json({ message: 'Protected route accessed successfully' });
});

module.exports = router;

const router = require("express").Router();
const {
    userDetails,
    updateUserDetails,

    findUser
  } = require("../controllers/userController");
  const {checkToken} =require('../utils/jwtVerity')

  router.get("/getUserData/", checkToken,userDetails);
  router.put("/updateUser/", checkToken,updateUserDetails);

  router.get("/searchUser/",checkToken,findUser);


  module.exports = router;

const router = require("express").Router();
const {
    userDetails,
    updateUserDetails
  } = require("../controllers/userController");
  const {checkToken} =require('../utils/jwtVerity')

  router.get("/getUserData/", checkToken,userDetails);
  router.put("/updateUser/", checkToken,updateUserDetails);

  module.exports = router;

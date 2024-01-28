

const User = require("../models/userModel");

module.exports.userDetails = async (req, res) => {
  
    try {
      
   
   
      const user = await User.findOne({ _id:req.userId });
     
      if (!user)
        return res.status(400).json({ msg: "Incorrect Username or Password", status: false });
  


      return res.status(200).json({ status: true,user:user });
    } catch (ex) {
      return res.status(500).json({ status: false, error:ex });
    
    }
  };



  module.exports.updateUserDetails = async (req, res) =>{

try {

    const {
      // password, 
      username, image}=req.body
    const userData = await User.findByIdAndUpdate(
        req.userId,
        {
          username:username,
            avatarImage:     image,
            // password:password
        },
        { new: true }
      );

      return res.status(200).json({ status: true,user:userData });
} catch (error) {
    return res.status(500).json({ status: false, error:error });

}
  }
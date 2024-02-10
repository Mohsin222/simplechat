const jwt = require('jsonwebtoken');

const checkToken = function (req,res,next)
{
    const header = req.headers['authorization'];
    if(typeof header !== 'undefined')
    {
       const bearer = header.split(' ');
       const token = bearer[1];
       req.token=token;

       var decoded = jwt.verify(token, process.env.SECRETKEY);
       req.userId = decoded.userId


       console.log(decoded.userId.toString()+'***111')
       next();


     }
     else
     {
      return  res.status(403).json({error:'Not Authorizes'});
     }
    }
module.exports ={checkToken}
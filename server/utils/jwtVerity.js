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
       next();


     }
     else
     {
        res.sendStatus(403);
     }
    }
module.exports ={checkToken}
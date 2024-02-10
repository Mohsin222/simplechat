require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const Message = require('./models/Message');

const app = express();
app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGODB_URI, { useNewUrlParser: true, useUnifiedTopology: true });

app.get('/messages', async (req, res) => {
  const { page = 1, limit = 10 } = req.query; // Pagination parameters
  try {
    const messages = await Message.find()
                                   .sort({ timestamp: -1 })
                                   .limit(limit * 1)
                                   .skip((page - 1) * limit)
                                   .exec();
    res.json(messages);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));



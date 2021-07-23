const express = require("express");
const mongoose = require("mongoose");
const app = express();
const PORT = process.env.PORT || 3000;

(async () => {
  try {
    const db = {
      USERNAME: process.env.USERNAME,
      PASSWORD: process.env.PASSWORD,
    };
    await mongoose.connect(`mongodb://${db.USERNAME}:${db.PASSWORD}@mongo:27017/`, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      useFindAndModify: false,
      useCreateIndex: true,
    });
    console.log("[database]: mongodb connected successfully 🍀");
  } catch (error) {
    console.log(`[error]: ${error}`);
  }
})();

app.get("/", (req, res) => res.json({ message: "hello from docker world ! 🐳 " }));
app.listen(PORT, () => console.log(`[server]: server listening on port ${PORT} 🚀`));

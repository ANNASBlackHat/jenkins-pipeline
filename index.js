var express = require('express'),
  app = express(),
  port = process.env.PORT || 3000;


app.get("/url", (req, res, next) => {
 res.json({
   server: 'nodejs'
 });
});

app.listen(port, () => {
 console.log("Server running on port " + port);
});

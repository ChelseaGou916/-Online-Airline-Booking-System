// Import express
let express = require('express')
// Import Body parser
let bodyParser = require('body-parser')
// Import mysql
const mysql = require("mysql"); 
// cors
let cors = require('cors')

// Initialise the app
let app = express()

app.use(cors({
  origin: '*'
}))

// Import routes
let apiRoutes = require("./routes/index")

// Configure bodyparser to handle post requests
app.use(bodyParser.urlencoded({
    extended: true
}))
app.use(bodyParser.json())

// Setup server port
var port = 3001

// Use Api routes in the App
app.use('/api', apiRoutes);

// Launch app to listen to specified port
app.listen(port, function () {
    console.log("Running Api on port " + port)
})
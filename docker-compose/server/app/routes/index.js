let express = require("express")
let router = express.Router()
let mysql = require("mysql")
const util = require('util')

console.log("打印1:"+process.env.HOSTNAMEMYSQL)
// Create a database connection pool
var pool = mysql.createPool({
  host: process.env.HOSTNAMEMYSQL,
  port: "3306",
  user: "root",
  password: "Abc_123456",
  database: "yx157",
  multipleStatements:true
})

// Create a query function
var query = function (sql, options, callback) {
  pool.getConnection(function (err, conn) {
    if (err) {
      callback(err, null, null)
    } else {
      conn.query(sql, options, function (err, results, fields) {
        callback(err, results, fields)
      })
      // Release the connection
      conn.release()
    }
  })
}

// Encapsulate query as a promise
query = util.promisify(query)

// register user
router.post("/user", async (req, res, next) => {
  // Check whether the account already exists
  const getAccountSql = 'SELECT * FROM user WHERE user.account = ?;'
  const getAccountSqlParam = [req.body.account]
  const getUser = await query(getAccountSql, getAccountSqlParam)
  if(getUser.length){
    res.json({
      code: 200,
      msg: "The account already exists",
      data: []
    })
    return
  }

  const sql = "INSERT INTO user(account,password) values (?,?);"
  const sqlParams = [req.body.account,req.body.password]
  const result = await query(sql, sqlParams)
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

// user login
router.post("/user/login", async (req, res, next) => {
  console.log("打印2:"+process.env.mysql)
  const sql = "SELECT * FROM user WHERE user.account = ?;"
  const sqlParams = [req.body.account]
  const getUser = await query(sql, sqlParams)
  if(getUser.length == 0 || getUser[0].password != req.body.password){
    res.json({
      code: 200,
      msg: "The user name or password is incorrect",
      data: []
    })
    return
  }
  res.json({
    code: 200,
    msg: "success",
    data: getUser
  })
})

// Query the flight
router.get("/flight", async (req, res, next) => {
  const sql = `SELECT * FROM flight WHERE start_point = "${req.query.start_point}" AND destination = "${req.query.destination}" AND departure_time like "%${req.query.departure_time}%";` // sql
  let result = await query(sql)
  if (!result.length){
    res.json({
      code: 200,
      msg: "No matching flight was found",
      data: result
    })
    return
  }
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

// Query the flight by id
router.get("/flightById", async (req, res, next) => {
  const sql = "SELECT * FROM flight WHERE id = ?;" // sql
  const sqlParams = [req.query.id]
  let result = await query(sql, sqlParams)
  if (!result.length){
    res.json({
      code: 200,
      msg: "No matching flight was found",
      data: result
    })
    return
  }
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

// Book a flight
router.post("/flight", async (req, res, next) => {
  // Check whether the number is full
  // Query the flight
  const sqlGetFlight = 'SELECT * FROM flight WHERE flight.id = ?'
  const sqlParamsGetFlight = [req.body.flight_id]
  const flight = await query(sqlGetFlight,sqlParamsGetFlight)
  // Query the number of flights booked
  const sqlGetNumFlight = 'SELECT COUNT(*) as flight_num FROM user_flight WHERE flight_id = ?;'
  const sqlParamsGetNumFlight = [req.body.flight_id]
  const num = await query(sqlGetNumFlight, sqlParamsGetNumFlight)
  if(flight[0].capacity <= num[0].flight_num){
    res.json({
      code: 200,
      msg: "The flight is full",
      data: num
    })
    return
  }
  // Query whether the user has booked the flight
  const getUserFlight = `SELECT * FROM user_flight WHERE flight_id = ${req.body.flight_id} AND user_id = ${req.body.user_id};`
  const resultUserFlight = await query(getUserFlight)
  if(resultUserFlight.length != 0){
    res.json({
      code: 200,
      msg: "You've already made a reservation",
      data: resultUserFlight
    })
    return
  }
  // If the number of passengers is not full, book the flight
  const sql = "INSERT INTO user_flight(user_id,flight_id) VALUES (?,?);"
  const sqlParams = [req.body.user_id,req.body.flight_id]
  const result = await query(sql, sqlParams)
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

// Cancel the reservation for this flight
router.delete("/flight/:id", async (req, res, next) => {
  const sql = `delete from user_flight where id = ${req.params.id}`
  const result = await query(sql)
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

// Gets the list of flights booked by the user
router.get("/user_flight/:id", async (req, res, next) => {
  const sql = `SELECT user_flight.id as id, flight.type type,flight.capacity capacity,flight.number number,flight.start_point start_point,flight.destination destination,flight.middle middle,flight.departure_time departure_time,flight.arrival_time arrival_time, flight.price price,flight.all_time all_time,flight.stop_time stop_time FROM user_flight  INNER JOIN flight ON user_flight.flight_id = flight.id WHERE user_flight.user_id = ${req.params.id};` // sql
  let result = await query(sql)
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

// get user list
router.get("/user", async (req, res, next) => {
  const sql = `SELECT * from user;` // sql
  let result = await query(sql)
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

// delet user
router.delete("/user/:id/:user_id", async (req, res, next) => {
  // Check whether the user is an administrator
  const sqlGetUser = `select * from user where id = ${req.params.user_id}`
  const getUser = await query(sqlGetUser)
  if(!getUser[0].is_admin){
    res.json({
      code: 200,
      msg: "Without permission",
      data: []
    })
    return
  }
  const sql = `delete from user where id = ${req.params.id}`
  const result = await query(sql)
  res.json({
    code: 200,
    msg: "success",
    data: result
  })
})

module.exports = router

// 1.引入Mysql
const mysql = require("mysql");
const dbConfig = require("./config").database;

// 2.创建数据库连接池
const pool = mysql.createPool({
  host: dbConfig.host,
  port: dbConfig.port,
  user: dbConfig.user,
  password: dbConfig.password,
  database: dbConfig.database,
});

// 3.创建通用查询方法,通过sql值传递防止sql注入
let query = (sql, value) => {
  return new Promise((resolve, reject) => {
    // 建立连接查询
    pool.getConnection((error, connection) => {
      // 连接失败
      if (error) {
        reject({ code: 0, data: error });
      }
      // 通过连接去查询数据库
      connection.query(sql, value, (error, results, fields) => {
        // 关闭连接
        connection.release();
        // sql语句执行失败
        if (error) {
          reject({ code: 0, data: error, msg: "sql语句执行失败" });
        }
        // 返回sql操作完成的结果
        resolve({ code: 1, data: results, msg: "sql语句执行成功" });
      });
    });
  });
};

module.exports = query;

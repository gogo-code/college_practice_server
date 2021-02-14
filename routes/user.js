const express = require("express");
const router = express.Router();
// 引入MD5
const md5 = require("blueimp-md5");
// 引入token生成器
const jwt = require("jsonwebtoken");

// 引入查询函数
const Query = require("../config/dbHelper");
const KEY = require("../config/config").key;

// 注册管理员的接口
router.post("/reg", (req, res, next) => {
  // 1.获取参数
  const { account, password } = req.body;
  const md5_password = md5(password, KEY);
  console.log(account, md5_password);
  // 2.判断
  if (!account || !password) {
    res.json({
      status: 0,
      mes: "用户名或密码不能为空",
    });
  }
  // 3.插入数据库
  let sql = `INSERT INTO zgl_user(zgl_user_account,zgl_user_password) VALUES (?, ?);`;
  let value = [account, md5_password];
  Query(sql, value)
    .then((result) => {
      res.json({
        status: result.code,
        msg: "注册主管理员账号成功!",
      });
    })
    .catch((error) => {
      res.json({
        status: error.code,
        msg: "注册主管理员账号失败!",
      });
    });
});

// 用户名和密码登录
router.post("/login", (req, res, next) => {
  // 1. 获取数据
  const { account, password} = req.body;
  // 2. 判断
  if (!account || !password) {
    res.json({
      status: 0,
      msg: "用户名或密码不能为空!",
    });
  }

  // if (!account || !password) {
  //   res.json({
  //     status: 0,
  //     msg: "用户名或密码不能为空!",
  //   });
  // }

  // 3. 查询数据库
  let sql = `SELECT * FROM zgl_user WHERE zgl_user_account = ? AND zgl_user_password = ?;`;
  let value = [account, password];

  Query(sql, value)
    .then((result) => {
      if (result.data.length > 0) {
        const {
          zgl_user_id,
          zgl_user_account,
          zgl_user_password,
          zgl_user_img,
          zgl_user_name,
          zgl_role_id,
        } = result.data[0];

        //  3.1 生成一个token
        const userData = {
          zgl_user_id,
          zgl_user_account,
          zgl_user_password,
        };
        const token = jwt.sign(userData, KEY);
        // console.log(token);
        // console.log(jwt.verify(token, KEY));

        // 3.2  把token存入session
        req.session.token = token;

        // 3.3 给客户端返回数据
        res.json({
          status: 1,
          msg: "登录成功!",
          data: {
            token,
            zgl_user_name,
            zgl_user_img,
            zgl_user_name,
            zgl_role_id,
          },
        });
      } else {
        res.json({
          status: 0,
          msg: "当前用户不存在!",
        });
      }
    })
    .catch((error) => {
      return next(error);
    });
});

// 退出登录
router.get("/logout", (req, res, next) => {
  // 方式1
  // req.session.cookie.maxAge = 0;
  // 方式二
  req.session.destroy();
  res.json({
    status: 1,
    msg: "退出登录成功!",
  });
});

module.exports = router;

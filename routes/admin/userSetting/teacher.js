const express = require("express");
const router = express.Router();

const Query = require("./../../../config/dbHelper");

router.get("/query", (req, res, next) => {
  const { sxgl_name, sxgl_department } = req.query;
  let sql = `SELECT sxgl_teacher_id,sxgl_name,sxgl_department,sxgl_phone FROM sxgl_teacher where 1=1`;
  let value = [];
  if (sxgl_name) {
    sql += " and sxgl_name like ?";
    value.push("%" + sxgl_name + "%");
  }
  if (sxgl_department) {
    sql += " and sxgl_department like ?";
    value.push("%" + sxgl_department + "%");
  }

  sql += " ORDER BY sxgl_teacher_id";
  Query(sql, value)
    .then((result) => {
      res.json({
        status: result.code,
        data: result.data,
      });
    })
    .catch((error) => {
      res.json({
        status: error.code,
        data: error.data,
      });
    });
});

router.post("/add", (req, res, next) => {
  const { token, data } = req.body;
  console.log(data);
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql1 = `INSERT INTO sxgl_teacher (
      sxgl_teacher_id,
      sxgl_name,
      sxgl_department,
      sxgl_phone
  ) VALUES (?,?,?,?);`;

    const sql2 = `INSERT INTO sxgl_user (
        sxgl_user_account,
        sxgl_user_name,
        sxgl_user_password,
        sxgl_role_id ) VALUES (?,?,?,?);`;

    for (var i = 0; i < data.length - 1; i++) {
      const { sxgl_teacher_id, sxgl_name, sxgl_department, sxgl_phone } = data[
        i
      ];
      let value1 = [sxgl_teacher_id, sxgl_name, sxgl_department, sxgl_phone];
      let value2 = [
        sxgl_teacher_id,
        sxgl_name,
        "0241e53fcb7e6fd794bb860a2adb6b81",
        3,
      ];
      Query(sql1, value1);
      Query(sql2, value2);
    }
    const { sxgl_teacher_id, sxgl_name, sxgl_department, sxgl_phone } = data[
      data.length - 1
    ];
    Query(sql2, [
      sxgl_teacher_id,
      sxgl_name,
      "0241e53fcb7e6fd794bb860a2adb6b81",
      3,
    ]);
    Query(sql1, [sxgl_teacher_id, sxgl_name, sxgl_department, sxgl_phone])
      .then((result) => {
        res.json({
          status: result.code,
          msg: "新增成功!",
          data: {},
        });
      })
      .catch((error) => {
        console.log(error);
        res.json({
          status: error.code,
          data: error.data,
        });
      });
  }
});

router.post("/update", (req, res, next) => {
  const {
    token,
    sxgl_teacher_id,
    sxgl_name,
    sxgl_department,
    sxgl_phone,
  } = req.body;

  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_teacher SET sxgl_name=?,sxgl_department=?,sxgl_phone=? WHERE sxgl_teacher_id = ?;`;
    const value = [sxgl_name, sxgl_department, sxgl_phone, sxgl_teacher_id];
    Query(sql, value)
      .then((result) => {
        res.json({
          status: result.code,
          msg: "修改成功!",
          data: {},
        });
      })
      .catch((error) => {
        console.log(error);
        res.json({
          status: error.code,
          data: error.data,
        });
      });
  }
});

router.post("/reset", (req, res, next) => {
  const { token, id } = req.body;
  console.log(id);
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_user SET sxgl_user_password="0241e53fcb7e6fd794bb860a2adb6b81" WHERE sxgl_user_account = ?;`;
    const value = [id];
    Query(sql, value)
      .then((result) => {
        res.json({
          status: result.code,
          msg: "修改成功!",
          data: {},
        });
      })
      .catch((error) => {
        console.log(error);
        res.json({
          status: error.code,
          data: error.data,
        });
      });
  }
});

router.post("/delete", (req, res, nsext) => {
  const { ids } = req.body;
  let sql = `DELETE sxgl_teacher,sxgl_user FROM sxgl_teacher left join sxgl_user  on sxgl_teacher.sxgl_teacher_id=sxgl_user.sxgl_user_account WHERE sxgl_teacher.sxgl_teacher_id=?`;
  for (var i = 0; i < ids.length - 1; i++) {
    Query(sql, [ids[i]]);
  }
  Query(sql, [ids[ids.length - 1]])
    .then((result) => {
      res.json({
        status: result.code,
        msg: "删除成功!",
        data: {},
      });
    })
    .catch((error) => {
      res.json({
        status: error.code,
        msg: "删除失败!",
        data: error.data,
      });
    });
});

module.exports = router;

const express = require("express");
const router = express.Router();

const Query = require("./../../../config/dbHelper");
router.get("/query", (req, res, next) => {
  const {
    sxgl_student_name,
    sxgl_student_college,
    sxgl_student_major,
  } = req.query;
  let sql = `SELECT  b.sxgl_select,b.sxgl_student_id,b.sxgl_student_name,b.sxgl_student_college,b.sxgl_student_major,b.sxgl_student_class,b.sxgl_student_phone FROM sxgl_intention a left join sxgl_student b  on a.sxgl_student_id=b.sxgl_student_id where 1=1`;
  let value = [];
  if (sxgl_student_name) {
    sql += " and b.sxgl_student_name like ?";
    value.push("%" + sxgl_student_name + "%");
  }
  if (sxgl_student_college) {
    sql += " and b.sxgl_student_college like ?";
    value.push("%" + sxgl_student_college + "%");
  }
  if (sxgl_student_major) {
    sql += " and b.sxgl_student_major like ?";
    value.push("%" + sxgl_student_major + "%");
  }
  console.log(sql);
  sql += " ORDER BY b.sxgl_student_id";
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

router.get("/queryDetail", (req, res, next) => {
  const {
    sxgl_student_id
  } = req.query;
  let sql = `SELECT * from sxgl_intention where sxgl_student_id=?`;
  let value = [sxgl_student_id];
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

router.post("/update", (req, res, next) => {
  const { token, data } = req.body;
  const { sxgl_student_remark, sxgl_student_id,sxgl_select } = data;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_student SET sxgl_student_remark=?,sxgl_select=? WHERE sxgl_student_id = ?;`;
    const value = [sxgl_student_remark, sxgl_select,sxgl_student_id];
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

module.exports = router;
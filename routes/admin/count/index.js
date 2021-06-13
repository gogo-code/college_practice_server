const express = require("express");
const router = express.Router();

const Query = require("./../../../config/dbHelper");
// 查询师生比
router.get("/queryteacherToStudent", (req, res, next) => {
  let sql = `select count(*) a from sxgl_student union select count(*) b from sxgl_teacher`;
  Query(sql, [])
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
module.exports = router;


router.get("/querycollege", (req, res, next) => {
    let sql = `SELECT sxgl_student_college, COUNT(*) as sum FROM sxgl_student GROUP BY sxgl_student_college;`;
    Query(sql, [])
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
  module.exports = router;






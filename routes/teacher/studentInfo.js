const express = require("express");
const router = express.Router();

const Query = require("./../../config/dbHelper");

router.get("/query", (req, res, next) => {
  const {
    sxgl_company_tutor_id,
    sxgl_student_name,
    sxgl_student_college,
    sxgl_student_major,
  } = req.query;
  let sql = `SELECT sxgl_student_id,sxgl_student_name,sxgl_student_college,sxgl_student_major,sxgl_student_class,sxgl_student_phone,sxgl_select,sxgl_student_Report,sxgl_student_score FROM sxgl_student where sxgl_company_tutor_id=?`;
  let value = [sxgl_company_tutor_id];
  if (sxgl_student_name) {
    sql += " and sxgl_student_name like ?";
    value.push("%" + sxgl_student_name + "%");
  }
  if (sxgl_student_college) {
    sql += " and sxgl_student_college like ?";
    value.push("%" + sxgl_student_college + "%");
  }
  if (sxgl_student_major) {
    sql += " and sxgl_student_major like ?";
    value.push("%" + sxgl_student_major + "%");
  }
  console.log(sql);
  sql += " ORDER BY sxgl_student_id";
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
    const {
      work,
      usual,
      report,
      sxgl_student_id
    } = data;
    let sxgl_student_score
    if(work) {
      sxgl_student_score = work * 0.2 + usual * 0.3 + report * 0.5;
    }
    else {
      sxgl_student_score =  usual * 0.5 + report * 0.5;
    }
    
    if (req.session.token !== token) {
      res.json({
        status: 0,
        msg: "非法用户!",
      });
    } else {
      const sql = `UPDATE sxgl_student SET sxgl_student_score = ? WHERE sxgl_student_id = ?;`;
      const value = [
        sxgl_student_score,
        sxgl_student_id
      ];
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

const express = require("express");
const router = express.Router();

const Query = require("./../../config/dbHelper");

router.get("/query", (req, res, next) => {
  const { sxgl_student_name, sxgl_year } = req.query;
  console.log(req.query)
  let sql = `SELECT DISTINCT
    b.sxgl_student_class,
    c.sxgl_company_name,
    c.sxgl_company_phone,
    d.sxgl_name,
    d.sxgl_phone,
    e.sxgl_company_tutor_name,
    e.sxgl_company_tutor_phone,
    a.sxgl_createtime,
    a.sxgl_plan_name,
    a.sxgl_department,
    a.sxgl_year,
    a.sxgl_grade,
    a.sxgl_endtime,
    a.sxgl_type 
  FROM
    sxgl_plan a
    LEFT JOIN sxgl_student b ON a.sxgl_department = b.sxgl_student_college
    LEFT JOIN sxgl_company c ON b.sxgl_company_id=c.sxgl_company_id
    LEFT JOIN sxgl_teacher d on b.sxgl_teacher_id=d.sxgl_teacher_id
    LEFT JOIN sxgl_company_tutor e ON b.sxgl_company_tutor_id=e.sxgl_company_tutor_id where b.sxgl_student_name=? and a.sxgl_year=?`;
  let value = [sxgl_student_name, sxgl_year];
  Query(sql, value)
    .then((result) => {
      res.json({
        status: result.code,
        data: result.data.length===0?[{sxgl_company_name: "",
        sxgl_company_phone: "",
        sxgl_company_tutor_name: "",
        sxgl_company_tutor_phone: "",
        sxgl_createtime: "",
        sxgl_department: "",
        sxgl_endtime: "",
        sxgl_grade: "",
        sxgl_name: null,
        sxgl_phone: null,
        sxgl_plan_name: "",
        sxgl_student_class: "",
        sxgl_type: "",
        sxgl_year: ""}]:result.data,
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

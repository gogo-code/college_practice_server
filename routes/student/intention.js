const express = require("express");
const router = express.Router();

const Query = require("./../../config/dbHelper");

// 查询实习方式
router.get("/query", (req, res, next) => {
  const { sxgl_student_id } = req.query;
  let sql = `SELECT sxgl_select,sxgl_student_remark FROM sxgl_student where sxgl_student_id=?`;
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

// 实习方式修改 0-未选择 1-自主实习 2-学校安排 3-审批通过 4-审批未通过 5-填写实习申请表
router.post("/updateSelect", (req, res, next) => {
  const { token, data } = req.body;
  const { sxgl_student_id, sxgl_select } = data;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_student SET sxgl_select=? WHERE sxgl_student_id = ?;`;
    const value = [sxgl_select, sxgl_student_id];
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

//   自主实习添加
router.post("/add", (req, res, next) => {
  const { token, data } = req.body;
  const {
    sxgl_intention_position,
    sxgl_student_id,
    sxgl_intention_type,
    sxgl_comp_name,
    sxgl_comp_contact,
    sxgl_comp_phone,
    sxgl_comp_address,
    sxgl_file,
    sxgl_year
  } = data;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `INSERT INTO sxgl_intention (
        sxgl_intention_position,
        sxgl_student_id,sxgl_comp_name,sxgl_comp_contact,sxgl_comp_phone,sxgl_comp_address,sxgl_file,sxgl_year) VALUES (?,?,?,?,?,?,?,?);`;
    const value = [
      sxgl_intention_position,
      sxgl_student_id,
      sxgl_comp_name,
      sxgl_comp_contact,
      sxgl_comp_phone,
      sxgl_comp_address,
      sxgl_file,
      sxgl_year
    ];
    Query(sql, value)
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

// 学校安排查询
router.get("/query", (req, res, next) => {
    const { sxgl_student_id } = req.query;
    let sql = `SELECT sxgl_select FROM sxgl_student where sxgl_student_id=?`;
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

//   实习报告提交
router.post("/reportAdd", (req, res, next) => {
  const { token, data } = req.body;
  const {
    sxgl_student_Report,
    sxgl_student_id
  } = data;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_student SET  sxgl_student_Report=? WHERE sxgl_student_id = ?;`;
    const value = [
      sxgl_student_Report,
      sxgl_student_id
    ];
    Query(sql, value)
      .then((result) => {
        res.json({
          status: result.code,
          msg: "上传成功!",
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

// 实习结果查询
router.get("/queryResult", (req, res, next) => {
  const { sxgl_student_id } = req.query;
  let sql = `SELECT sxgl_student_score FROM sxgl_student where sxgl_student_id=?`;
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


module.exports = router;

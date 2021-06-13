const express = require("express");
const router = express.Router();

const Query = require("./../../../config/dbHelper");

// 实习基地维护查询
router.get("/query", (req, res, next) => {
  const { sxgl_company_name } = req.query;
  let sql = `SELECT * FROM sxgl_company where 1=1`;
  let value = [];
  if (sxgl_company_name) {
    sql += " and sxgl_company_name like ?";
    value.push("%" + sxgl_company_name + "%");
  }
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

// 实习单位查询
router.get("/queryCompanyName", (req, res, next) => {
  const sql = `SELECT sxgl_company_name,sxgl_company_id FROM sxgl_company`;
  Query(sql)
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

// 实习指导教师查询
router.get("/queryCompanyTeacherName", (req, res, next) => {
  let sql = `SELECT sxgl_company_tutor_name,sxgl_company_tutor_id FROM sxgl_company_tutor where sxgl_company_id=?`;
  const { sxgl_company_id } = req.query;
  let value = [sxgl_company_id];
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
  const {
    sxgl_company_name,
    sxgl_company_address,
    sxgl_company_type,
    sxgl_connect_person,
    sxgl_company_phone,
    sxgl_company_industry,
  } = data;

  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `INSERT INTO sxgl_company (sxgl_company_name,
      sxgl_company_address,
      sxgl_company_type,
      sxgl_connect_person,
      sxgl_company_phone,
      sxgl_company_industry) VALUES (?,?,?,?,?,?)`;
    const value = [
      sxgl_company_name,
      sxgl_company_address,
      sxgl_company_type,
      sxgl_connect_person,
      sxgl_company_phone,
      sxgl_company_industry,
    ];
    Query(sql, value)
      .then((result) => {
        res.json({
          status: result.code,
          msg: "新增单位成功!",
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
  const { token, data } = req.body;
  const {
    sxgl_company_id,
    sxgl_company_name,
    sxgl_company_address,
    sxgl_company_type,
    sxgl_connect_person,
    sxgl_company_phone,
    sxgl_company_industry,
  } = data;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_company SET sxgl_company_name=?,sxgl_company_address=?,sxgl_company_type=?,sxgl_connect_person=?,sxgl_company_phone=?,sxgl_company_industry=? WHERE sxgl_company_id = ?;`;
    const value = [
      sxgl_company_name,
      sxgl_company_address,
      sxgl_company_type,
      sxgl_connect_person,
      sxgl_company_phone,
      sxgl_company_industry,
      sxgl_company_id,
    ];

    Query(sql, value)
      .then((result) => {
        res.json({
          status: result.code,
          msg: "修改单位成功!",
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

router.post("/delete", (req, res, next) => {
  const { ids } = req.body;
  let sql = `DELETE FROM sxgl_company WHERE sxgl_company_id=?`;
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

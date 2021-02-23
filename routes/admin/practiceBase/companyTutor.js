const express = require("express");
const router = express.Router();

const Query = require("./../../../config/dbHelper");

router.get("/query", (req, res, next) => {
  const sql = `SELECT * FROM sxgl_company_tutor;`;
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

router.post("/add", (req, res, next) => {
  const {
    token,
    sxgl_company_tutor_name,
    sxgl_company_tutor_phone,
    sxgl_company_id,
    sxgl_company_tutor_job,
    sxgl_company_tutor_img,
    sxgl_company_tutor_edu,
  } = req.body;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `INSERT INTO sxgl_company_tutor (
      sxgl_company_tutor_name,
      sxgl_company_tutor_phone,
      sxgl_company_id,
      sxgl_company_tutor_job,
      sxgl_company_tutor_img,
      sxgl_company_tutor_edu) VALUES (?,?,?,?,?,?);`;
    const value = [
      sxgl_company_tutor_name,
      sxgl_company_tutor_phone,
      sxgl_company_id,
      sxgl_company_tutor_job,
      sxgl_company_tutor_img,
      sxgl_company_tutor_edu,
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

router.post("/update", (req, res, next) => {
  const {
    token,
    sxgl_company_tutor_id,
    sxgl_company_tutor_name,
    sxgl_company_tutor_phone,
    sxgl_company_id,
    sxgl_company_tutor_job,
    sxgl_company_tutor_img,
    sxgl_company_tutor_edu,
  } = req.body;
  console.log(req.body);
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_company_tutor SET sxgl_company_tutor_name=?,sxgl_company_tutor_phone=?,sxgl_company_id=?,sxgl_company_tutor_job=?,sxgl_company_tutor_img=?,sxgl_company_tutor_edu=? WHERE sxgl_company_tutor_id = ?;`;
    const value = [
      sxgl_company_tutor_name,
      sxgl_company_tutor_phone,
      sxgl_company_id,
      sxgl_company_tutor_job,
      sxgl_company_tutor_img,
      sxgl_company_tutor_edu,
      sxgl_company_tutor_id,
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

router.post("/delete", (req, res, next) => {
  const { sxgl_company_tutor_ids } = req.body;
  let sql = `DELETE FROM sxgl_company_tutor WHERE sxgl_company_tutor_id=?`;
  for (var i = 0; i < sxgl_company_tutor_ids.length - 1; i++) {
    Query(sql, [sxgl_company_tutor_ids[i]]);
  }
  Query(sql, [sxgl_company_tutor_ids[sxgl_company_tutor_ids.length - 1]])
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

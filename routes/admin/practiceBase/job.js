const express = require("express");
const router = express.Router();

const Query = require("./../../../config/dbHelper");

router.get("/query", (req, res, next) => {
  const { sxgl_job_name, sxgl_company_id } = req.query;

  // select a.name,b.job from A a  left join B b on a.id=b.A_id
  let sql = `SELECT a.sxgl_job_id,a.sxgl_job_name,b.sxgl_company_name,a.sxgl_job_type,a.sxgl_company_id FROM sxgl_job a left join sxgl_company b on a.sxgl_company_id=b.sxgl_company_id where 1=1`;
  let value = [];
  if (sxgl_job_name) {
    sql += " and a.sxgl_job_name like ?";
    value.push("%" + sxgl_job_name + "%");
  }
  if (sxgl_company_id) {
    sql += " and a.sxgl_company_id like ?";
    value.push("%" + sxgl_company_id + "%");
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

router.post("/add", (req, res, next) => {
  const { token, data } = req.body;
  const { sxgl_job_name, sxgl_job_type, sxgl_company_id } = data;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `INSERT INTO sxgl_job (
      sxgl_job_name,
      sxgl_job_type,
      sxgl_company_id) VALUES (?,?,?);`;
    const value = [sxgl_job_name, sxgl_job_type, sxgl_company_id];
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
  const { token, data } = req.body;
  const { sxgl_job_id, sxgl_job_name, sxgl_job_type, sxgl_company_id } = data;
  if (req.session.token !== token) {
    res.json({
      status: 0,
      msg: "非法用户!",
    });
  } else {
    const sql = `UPDATE sxgl_job SET sxgl_job_name=?,sxgl_job_type=?,sxgl_company_id=? WHERE sxgl_job_id = ?;`;
    const value = [sxgl_job_name, sxgl_job_type, sxgl_company_id, sxgl_job_id];
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
  const { ids } = req.body;
  let sql = `DELETE FROM sxgl_job WHERE sxgl_job_id=?`;
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

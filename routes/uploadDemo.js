var express = require("express");
var fs = require("fs");
const path = require("path");
var router = express.Router();
const { practice_report,practice_intention} = require("../tools/uploadFile");
// 上传实习报告
router.post(
  "/uploadReport",
  practice_report.single("sxgl_file"),
  (req, res, next) => {
    res.json({
      status: 1,
      msg: "上传成功",
      data: {
        name: "/public/uploads/documents/practice_report/" + req.file.filename,
      },
    });
  }
);

// 上传申请文件
router.post(
  "/uploadIntention",
  practice_intention.single("sxgl_file"),
  (req, res, next) => {
    res.json({
      status: 1,
      msg: "上传成功",
      data: {
        name: "/public/uploads/documents/practice_intention/" + req.file.filename,
      },
    });
  }
);

// 下载
router.get("/download", (req, res) => {
  var filePath = req.query.data;
  console.log("下载文件：" + filePath);
  filePath = path.join(__dirname, "../" + filePath);
  console.log(filePath);
  // res.json({
  //   status: 1,
  //   msg: "下载成功",
  // });
  res.download(filePath, function (err) {
   
    if (err) {
      console.log(err);
    }
  });
  // res.attachment(filePath)
  // res.sendFile(filePath)
});

// 下载学生信息导入模板
router.get("/downloadStudent", (req, res) => {
  var filePath = req.query.data;
  console.log("下载文件：" + filePath);
  filePath = path.join(__dirname, "../" + filePath);
  console.log(filePath);
  // res.json({
  //   status: 1,
  //   msg: "下载成功",
  // });
  res.download(filePath, function (err) {
   
    if (err) {
      console.log(err);
    }
  });
  // res.attachment(filePath)
  // res.sendFile(filePath)
});

router.get("/downloadTeacher", (req, res) => {
  var filePath = req.query.data;
  console.log("下载文件：" + filePath);
  filePath = path.join(__dirname, "../" + filePath);
  console.log(filePath);
  // res.json({
  //   status: 1,
  //   msg: "下载成功",
  // });
  res.download(filePath, function (err) {
    
    if (err) {
      console.log(err);
    }
  });
  // res.attachment(filePath)
  // res.sendFile(filePath)
});

router.get("/downloadReport", (req, res) => {
  var filePath = req.query.data;
  console.log("下载文件：" + filePath);
  filePath = path.join(__dirname, "../" + filePath);
  console.log(filePath);
  // res.json({
  //   status: 1,
  //   msg: "下载成功",
  // });
  res.download(filePath, function (err) {
   
    if (err) {
      console.log(err);
    }
  });
  // res.attachment(filePath)
  // res.sendFile(filePath)
});

module.exports = router;

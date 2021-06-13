// 引入类库相关
const createError = require("http-errors");
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");

// 引入session相关
const session = require("express-session");
const MySQLStore = require("express-mysql-session")(session);
const database = require("./config/config").database;
const sessionStore = new MySQLStore({
  host: database.host,
  port: database.port,
  user: database.user,
  password: database.password,
  database: database.database,
});

// 引入路由相关
const userRouter = require("./routes/user");
const companyRouter = require("./routes/admin/practiceBase/company");
const companyTutorRouter = require("./routes/admin/practiceBase/companyTutor");
const jobRouter = require("./routes/admin/practiceBase/job");
const settingStudentRouter = require("./routes/admin/userSetting/student");
const settingTeacherRouter = require("./routes/admin/userSetting/teacher");
const planRouter = require("./routes/admin/practicePlan/plan");
const checkRouter = require("./routes/admin/check/check");
const uploadRouter = require("./routes/uploadDemo");
const intentionRouter=require('./routes/student/intention')
const planQueryRouter=require('./routes/student/plan')
const questManaRouter=require('./routes/teacher/questMana')
const studentInfoRouter=require('./routes/teacher/studentInfo')
const countRouter=require('./routes/admin/count/index')

// 引入全局控制中间件
const authControl = require("./middleWare/authControl");

const app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));

// 配置模板引擎
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

// 使用session
app.use(
  session({
    key: "user",
    secret: "itLike", //加密字符串
    resave: true, //强制保存session，即使它没有变化
    saveUninitialized: true, //强制将未初始化的session存储。当新建一个session且未设定属性或值时，它就处于未初始化状态。在设定cookie前，这对于登录验证，减轻服务器存储压力，权限控制是有帮助的，默认为true
    cookie: { maxAge: 24 * 3600 * 1000 },
    //  cookie: {maxAge: 1000},
    rolling: true, //在每次请求时进行设置cookie，将重置cookie过期时间
    store: sessionStore,
  })
);

// 使用各种默认集成的中间件
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

// 使用权限控制中间件
app.use(authControl);

// 使用路由中间件
app.use("/api/auth/user", userRouter);
app.use("/api/auth/admin/company", companyRouter);
app.use("/api/auth/admin/companyTutor", companyTutorRouter);
app.use("/api/auth/admin/job", jobRouter);
app.use("/api/auth/admin/student", settingStudentRouter);
app.use("/api/auth/admin/teacher", settingTeacherRouter);
app.use("/api/auth/admin/plan", planRouter);
app.use("/api/auth/admin/check", checkRouter);
app.use("/api/auth/upload", uploadRouter);
app.use("/api/auth/student/intention", intentionRouter);
app.use("/api/auth/student/plan", planQueryRouter);
app.use("/api/auth/teacher/questMana", questManaRouter);
app.use("/api/auth/teacher/studentInfo", studentInfoRouter);
app.use("/api/auth/admin/count",countRouter)



// 页面404处理中间件
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;


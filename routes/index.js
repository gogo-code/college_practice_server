var express = require('express');
var router = express.Router();

const query=require('./../config/dbHelper')
/* GET home page. */
router.get('/', function(req, res, next) {
  let sql=`insert into zgl_user(zgl_user_password,zgl_user_ZGH,zgl_role_id) values (?,?,?);`
  let value=['admin','admin',2]
  query(sql,value).then(res=>{
    console.log(res)
  }).catch(error=> {
    console.log(error)
  })

  res.render('index', { title: 'Express' });
});

module.exports = router;

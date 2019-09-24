//app.js 服务器端项目
//1:下载第三方模块 
//express/express-session/cors/mysql
//2:将第三方模块引入到当前程序中
const express= require("express");
const session = require("express-session");
const cors = require("cors");
const mysql = require("mysql");
//3:创建数据库连接池
var pool = mysql.createPool({
   host:"127.0.0.1",
   user:"root",
   password:"",
   port:3306,
   connectionLimit:20,
   database:"censhs"
})

//4:创建web服务器监听 8080 端口
var server = express();
server.listen(8080);
//5:处理跨域 cors 
//5.1：配置允许访问程序地址(脚手架)
//     http://127.0.0.1:5050  (ok)
//     http://localhost:5050
//5.2:每请求是否验证true
server.use(cors({
  origin:[
    "http://127.0.0.1:5501","http://localhost:5501"],
  credentials:true
}))
//6:配置session
//#session配置一定要在所有请求之前
server.use(session({
   secret:"128位字符串",    //#安全字符串
   resave:true,            //#每次请求保存数据 
   saveUninitialized:true  //#保存初始化数据
}));
//7:配置静态目录
//http://127.0.0.1:8080/01.jpg
server.use(express.static("public"));

//功能一:完成用户登录
//启动服务器app.js/启动数据库
//打开浏览器
//http://127.0.0.1:8080/login?uname=188123456789&upwd=123
//http://127.0.0.1:8080/login?uname=122123456789&upwd=123

server.get("/login",(req,res)=>{
  //6.1:接收网页传递数据 用户名和密码
  var u = req.query.uname;
  var p = req.query.upwd;

  //6.2:创建sql
  var sql = "SELECT uid FROM censh_login";
  sql+=" WHERE uname = ? AND upwd = ?";
  //6.3:执行sql语句并且获取返回结果
  pool.query(sql,[u,p],(err,result)=>{
   //6.4:判断登录是否成功
   if(err)throw err;
   //6.5:将结果返回网页
   if(result.length==0){
     res.send({code:-1,msg:"用户名或密码有误"})
   }else{
     //获取当前登录用户id
     //result=[{id:2}]
     //var id = result[0].id;
     //将用户id保存session对象中
     //uid当前登录：用户凭证
    //  req.session.uid = id;
    //  console.log(req.session);
     res.send({code:1,msg:"登录成功"});
   }
  });
});

// 功能二：菜单请求二级列表
server.get("/index",(req,res)=>{
  var sql = "SELECT fname FROM censh_family";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      console.log(result)
      res.send({code:1,msg:"请求成功",data:result});
    }
  })
})

// 功能二：产品页筛选条件的系列1，机芯类型，价格部分,产品图片,活动中的宣传图片
server.get("/longinesproduct",(req,res)=>{
  var list = [];
  // 系列
  var sql1 = "SELECT product FROM censh_product_xl_one";
  pool.query(sql1,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      list.push(result);
    }
  })
  //机芯类型
  var sql2 = "SELECT product_xl FROM censh_product_xl_two";
  pool.query(sql2,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      list.push(result);
    }
  })
  // 价格
  var sql3 = "SELECT product_price FROM censh_product_price";
  pool.query(sql3,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      list.push(result);
    }
  })
  // 获取详情页的图片
  var sql4 = "SELECT img FROM censh_longinesproduct_pic";
  pool.query(sql4,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      //console.log(result)
      list.push(result);
    }
  })
   //活动中的宣传图片
   var sql5 = "SELECT img FROM censh_longinesproduct_work_pic";
   pool.query(sql5,(err,result)=>{
     if(err)throw err;
     if(result.length==0){
       res.send({code:-1,msg:"请求有误"})
     }else{
       list.push(result);
       res.send({code:1,msg:"请求成功",data:list});
     }
   })
})

// 功能三：单个商品的详情页--图片
server.get("/order",(req,res)=>{
  var pics = [];
  // 展示图片
  var sql1 = "SELECT order_watch_id,displayimg FROM censh_order_pic";
  pool.query(sql1,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      pics.push(result);
      console.log(pics)
      res.send({code:1,msg:"请求成功",data:pics});
    }
  })
  // 商品详情
  // var sql2 = "SELECT detailimg FROM censh_order_pic";
  // pool.query(sql2,(err,result)=>{
  //   if(err)throw err;
  //   if(result.length==0){
  //     res.send({code:-1,msg:"请求有误"})
  //   }else{
  //     pics.push(result);
  //   }
  // })
  // 商品故事
  // var sql3 = "SELECT storyimg FROM censh_order_pic";
  // pool.query(sql3,(err,result)=>{
  //   if(err)throw err;
  //   if(result.length==0){
  //     res.send({code:-1,msg:"请求有误"})
  //   }else{
  //     pics.push(result);
  //   }
  // })
  // 店铺
  // var sql4 = "SELECT storeimg FROM censh_order_pic";
  // pool.query(sql4,(err,result)=>{
  //   if(err)throw err;
  //   if(result.length==0){
  //     res.send({code:-1,msg:"请求有误"})
  //   }else{
  //     pics.push(result);
  //   }
  // })
  // 更多推荐
  // var sql5 = "SELECT moreimg FROM censh_order_pic";
  // pool.query(sql5,(err,result)=>{
  //   if(err)throw err;
  //   if(result.length==0){
  //     res.send({code:-1,msg:"请求有误"})
  //   }else{
  //     pics.push(result);
  //   }
  // })
  // 同价位不同品牌
  // var sql6 = "SELECT otherimg FROM censh_order_pic";
  // pool.query(sql6,(err,result)=>{
  //   if(err)throw err;
  //   if(result.length==0){
  //     res.send({code:-1,msg:"请求有误"})
  //   }else{
  //     pics.push(result);
  //     res.send({code:1,msg:"请求成功",data:pics});
  //   }
  // })

})

//功能四：企业页面图片
server.get("/qiye",(req,res)=>{
  var sql = "SELECT img FROM censh_qiye_pic";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      res.send({code:1,msg:"请求成功",data:result});
      console.log(result)
    }
  })
})

//功能五：浪琴红12页面图片
server.get("/longinesred12",(req,res)=>{
  var sql = "SELECT img FROM censh_longinesred12_pic";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      res.send({code:1,msg:"请求成功",data:result});
      console.log(result)
    }
  })
})

不对---表建错了
//功能六：将指定商品添加至购物车
server.get("/addcard",(req,res)=>{
  // var uid = req.session.uid;
  // if(!uid){
  //   res.send({code:-1,msg:"请先登录"});
  // return;
  // }
  var sql = "SELECT img FROM censh_longinesred12_pic";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"请求有误"})
    }else{
      res.send({code:1,msg:"请求成功",data:result});
      console.log(result)
    }
  })
})


// //功能二:商品分页显示77~109
// //1:接收客户请求 /product GET
// // http://127.0.0.1:8
// server.get("/product",(req,res)=>{
//  //2:接收客户请求数据 
//  //  pno 页码   pageSize 页大小
//  var pno = req.query.pno;
//  var ps  = req.query.pageSize;
//  //3:如果客户没有请示数据设置默认数据
//  //  pno=1     pageSize=4
//  if(!pno){
//    pno = 1;
//  }
//  if(!ps){
//    ps = 4;
//  }
//  //4:创建sql语句
//  var sql = "SELECT lid,lname,price,img_url";
//  sql+=" FROM xz_laptop";
//  sql+=" LIMIT ?,?";
//  var offset = (pno-1)*ps;//起始记录数 ?
//  ps = parseInt(ps);      //行数       ?
//  //5:发送sql语句
//  pool.query(sql,[offset,ps],(err,result)=>{
//    //6:获取返回结果发送客户端
//    if(err)throw err;
//    res.send({code:1,msg:"查询成功",
//    data:result});
//  });
// })


// //功能三:将指定商品添加至购物车
// //#此功能先行条件先登录
// //1:接收客户端请求 /addcart GET
// //http://127.0.0.1:8080/login?uname=tom&upwd=123
// //http://127.0.0.1:8080/addcart?lid=1&lname=kk&price=9
// server.get("/addcart",(req,res)=>{
// //2:判断当前用户是否登录成功
// //  uid
// //  如果uid为undefined 没登录
// var uid = req.session.uid;
// if(!uid){
//   res.send({code:-1,msg:"请先登录"});
//   return;
// }
// //3:获取客户端数据???小心处理
// //  lid    商品编号
// //  price  商品价格
// //  lname  商品名称
// var lid = req.query.lid;
// var price = req.query.price;
// var lname = req.query.lname;
// //console.log(lid+":"+price+":"+lname)
// //res.send(lid+":"+price+":"+lname);
// //4:创建查询sql:当前用户是否购买此商品
// var sql = "SELECT id FROM xz_cart";
// sql+=" WHERE uid = ? AND lid = ?";
// //5:执行sql语句
// pool.query(sql,[uid,lid],(err,result)=>{
//   if(err)throw err;
//   //6:在回调函数中判断下一步操作
//   //  没购买过此商品  添加
//   //  己购买过此商品  更新
//   if(result.length==0){
//    var sql = `INSERT INTO xz_cart VALUES(null,${lid},${price},1,'${lname}',${uid})`;
//   }else{
//    var sql = `UPDATE xz_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
//   }
//   //7:执行sql获取返回结果
//   pool.query(sql,(err,result)=>{
//     if(err)throw err;
//     //8:如果sql UPDATE INSERT DELETE
//     //判断执行成功 result.affectedRows 影响行数
//     if(result.affectedRows>0){
//      res.send({code:1,msg:"商品添加成功"});
//     }else{
//      res.send({code:-2,msg:"添加失败"}); 
//     }
//   })
// })
// })
// //功能4：查询指定用户购物车信息
// server.get("/carts",(req,res)=>{
//   var uid=req.session.uid;
//   if(!uid){
//     res.send({code:-1,msg:"请登录"});
//     return;
//   }
//   var sql="SELECT id,lname,price FROM xz_cart WHERE uid=?";
//   pool.query(sql,[uid],(err,result)=>{
//     if(err)throw err;
//     res.send({code:1,msg:"查询成功",data:result});
//   })
// })

// //功能5：删除指定用户购物车信息
// server.get("/delcart",(req,res)=>{
//   var uid = req.session.uid;
//   if(!uid){
//     res.send({code:-1,msg:"请先登录"});
//     return;
//   }
//   var id=req.query.id;
//   var sql="DELETE FROM xz_cart WHERE id=?";
//   pool.query(sql,[id],(err,result)=>{
//     if(err) throw err;
//     // res.send({code:2,msg:"删除成功",data:result});

//     if(result.affectedRows>0){
//       res.send({code:2,msg:"商品删除成功"});
//      }else{
//       res.send({code:-3,msg:"删除失败"}); 
//      }
//   })
// })

// //功能6：删除多个指定用户购物车信息
// server.get("/delcarts",(req,res)=>{
//   var uid = req.session.uid;
//   if(!uid){
//     res.send({code:-1,msg:"请先登录"});
//     return;
//   }
//   var id=req.query.id;
//   var sql=`DELETE FROM xz_cart  WHERE id IN (${id})`;
//   pool.query(sql,(err,result)=>{
//     if(err) throw err;
//     if(result.affectedRows>0){
//       res.send({code:2,msg:"商品删除成功"});
//      }else{
//       res.send({code:-3,msg:"删除失败"}); 
//      }
//   })
// })



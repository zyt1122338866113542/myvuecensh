
SET NAMES UTF8;
DROP DATABASE IF EXISTS censhs;
CREATE DATABASE censhs CHARSET=UTF8;
USE censhs;
/******用户模块相关的表******/
-- #用户信息表
CREATE TABLE censh_user(
    uid INT(11) NOT NULL AUTO_INCREMENT,
    uname VARCHAR(32) default NULL,
    upwd VARCHAR(32) default NULL,
    user_name VARCHAR(32) default NULL,
    gender INT(11) default NULL,
    PRIMARY KEY (uid)
);

INSERT INTO censh_user VALUES(null,'188123456789','123','多多',1);

#用户登录表
CREATE TABLE censh_login(
  uid INT(11) NOT NULL AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32) ,
  PRIMARY KEY (uid)
);
INSERT INTO censh_login VALUES(null,'188123456789','123');
INSERT INTO censh_login VALUES(null,'122123456789','123');




/*图片表*/
CREATE TABLE img_Login(
  img_url VARCHAR(255)
);
INSERT INTO img_Login VALUES('logo.png');
INSERT INTO img_Login VALUES('login_bg.jpg');

/******轮播图模块******/
#首页轮播广告表
CREATE TABLE index_carousel(
  cid INT(11) NOT NULL AUTO_INCREMENT,
  img VARCHAR(128) default NULL,
  title VARCHAR(64) default NULL,
  href VARCHAR(128) default NULL,
  PRIMARY KEY(cid)
);
INSERT INTO index_carousel VALUES(1,default,'手表1','1.html');
INSERT INTO index_carousel VALUES(2,default,'手表2','2.html');
INSERT INTO index_carousel VALUES(3,default,'手表3','3.html');
INSERT INTO index_carousel VALUES(4,default,'手表4','4.html');
INSERT INTO index_carousel VALUES(5,default,'手表5','5.html');


/*****首页商品分类*******/
#首页商品
CREATE TABLE index_product(
  pid INT(11) PRIMARY KEY  AUTO_INCREMENT,
  title VARCHAR(64)default NULL,
  pic VARCHAR(128) default NULL,
  price DECIMAL(10,2) default NULL,
  details VARCHAR(128) default NULL,
  href VARCHAR(128)default NULL,
  seq_new TINYINT,
	seq_hop TINYINT,
	seq_brands TINYINT,
  seq_parts TINYINT,
  seq_store TINYINT,
  seq_video TINYINT,
  seq_news TINYINT,
  seq_pankings TINYINT,
  seq_share TINYINT
);

INSERT INTO index_product VALUES(1,'朗格1',default,100,default,'product_details.html?pid=1', '1', '1', '1','1', '1', '1','1', '1', '1');
INSERT INTO index_product VALUES(2,'朗格2',default,200,default,'product_details.html?pid=2', '2', '2', '2','2', '2', '2','2', '2', '2');
INSERT INTO index_product VALUES(3,'朗格3',default,300,default,'product_details.html?pid=3', '3', '3', '3','3', '3', '3','3', '3', '3');

/*****首页商品品牌分类---数据库中存在*******/
#商品品牌
CREATE TABLE censh_family(
  fid INT(11) NOT NULL AUTO_INCREMENT,
  fname VARCHAR(32) default NULL,
  PRIMARY KEY(fid)
);
INSERT INTO censh_family VALUES(1,'朗格');
INSERT INTO censh_family VALUES(2,'爱彼');
INSERT INTO censh_family VALUES(3,'宝珀');
INSERT INTO censh_family VALUES(4,'宝玑');
INSERT INTO censh_family VALUES(5,'播威');
INSERT INTO censh_family VALUES(6,'法穆兰');
INSERT INTO censh_family VALUES(7,'宝齐莱');
INSERT INTO censh_family VALUES(8,'格林汉');
INSERT INTO censh_family VALUES(9,'冠蓝狮');
INSERT INTO censh_family VALUES(10,'欧米茄');
INSERT INTO censh_family VALUES(11,'劳力士');
INSERT INTO censh_family VALUES(12,'真力时');
INSERT INTO censh_family VALUES(13,'浪琴');
INSERT INTO censh_family VALUES(14,'雷达');
INSERT INTO censh_family VALUES(15,'帝陀');
INSERT INTO censh_family VALUES(16,'名士');
INSERT INTO censh_family VALUES(17,'艾美');
INSERT INTO censh_family VALUES(18,'万宝龙');
INSERT INTO censh_family VALUES(19,'宝曼');
INSERT INTO censh_family VALUES(20,'波尔');
INSERT INTO censh_family VALUES(21,'西马');
INSERT INTO censh_family VALUES(22,'美度');
INSERT INTO censh_family VALUES(23,'天梭');
INSERT INTO censh_family VALUES(24,'精工');

/*****商品每一个品牌的属性分类*******/

#爱彼品牌
CREATE TABLE index_product_aibi(
  pid INT(11) PRIMARY KEY  AUTO_INCREMENT,
  title VARCHAR(64) ,
  pic VARCHAR(128) default NULL,
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
	seq_new_arrival TINYINT,
	seq_top_sale TINYINT
);
INSERT INTO index_product_aibi VALUES(1,'爱彼1',default,100,'product_details.html?pid=4', '1', '1', '1');
INSERT INTO index_product_aibi VALUES(2,'爱彼2',default,200,'product_details.html?pid=5', '2', '2', '2');
INSERT INTO index_product_aibi VALUES(3,'爱彼3',default,300,'product_details.html?pid=6', '3', '3', '3');

#宝珀品牌
CREATE TABLE index_product_baopo(
  pid INT(11) PRIMARY KEY  AUTO_INCREMENT,
  title VARCHAR(64) ,
  pic VARCHAR(128) default NULL,
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
	seq_new_arrival TINYINT,
	seq_top_sale TINYINT
);
INSERT INTO index_product_baopo VALUES(1,'宝珀1',default,100,'product_details.html?pid=7', '1', '1', '1');
INSERT INTO index_product_baopo VALUES(2,'宝珀2',default,200,'product_details.html?pid=8', '2', '2', '2');
INSERT INTO index_product_baopo VALUES(3,'宝珀3',default,300,'product_details.html?pid=9', '3', '3', '3');


#宝玑品牌
CREATE TABLE index_product_baoji(
  pid INT(11) PRIMARY KEY  AUTO_INCREMENT,
  title VARCHAR(64) ,
  pic VARCHAR(128) default NULL,
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
	seq_new_arrival TINYINT,
	seq_top_sale TINYINT
);
INSERT INTO index_product_baoji VALUES(1,'宝玑1',default,100,'product_details.html?pid=10', '1', '1', '1');
INSERT INTO index_product_baoji VALUES(2,'宝玑2',default,200,'product_details.html?pid=11', '2', '2', '2');
INSERT INTO index_product_baoji VALUES(3,'宝玑3',default,300,'product_details.html?pid=12', '3', '3', '3');


#商品属性
CREATE TABLE censh_product(
  lid INT(11) PRIMARY KEY NOT NULL  AUTO_INCREMENT,
  family_id INT(11) default NULL,
  title VARCHAR(128) default NULL ,    #标题
  subtitle VARCHAR(128) default NULL,  #副标题
  price DECIMAL(10,2) default NULL,
  spec VARCHAR(64) default NULL,      #规格
  lname VARCHAR(32) default NULL,     #名称
  details VARCHAR(1024) default NULL,
  sold_count INT(11) default NULL,     #数量
  href VARCHAR(128),
  is_onsale Boolean   #是否上线
);


/*****商品系列-----已存在*******/
#商品浪琴  系列1
CREATE TABLE censh_product_xl_one(
  product_xl_id INT(11) PRIMARY KEY NOT NULL  AUTO_INCREMENT,
  product VARCHAR(128)
);

INSERT INTO censh_product_xl_one VALUES(null,"心月系列primaluna1");
INSERT INTO censh_product_xl_one VALUES(null,"心月系列primaluna2");
INSERT INTO censh_product_xl_one VALUES(null,"心月系列primaluna3");
INSERT INTO censh_product_xl_one VALUES(null,"心月系列primaluna4");
INSERT INTO censh_product_xl_one VALUES(null,"心月系列primaluna5");
#商品浪琴  系列2
CREATE TABLE censh_product_xl_two(
  product_xl_two_id INT(11) PRIMARY KEY NOT NULL  AUTO_INCREMENT,
  product_xl VARCHAR(128)
);
INSERT INTO censh_product_xl_two VALUES(null,"石英");
INSERT INTO censh_product_xl_two VALUES(null,"机械");
INSERT INTO censh_product_xl_two VALUES(null,"电子");
INSERT INTO censh_product_xl_two VALUES(null,"光动能");
INSERT INTO censh_product_xl_two VALUES(null,"其他");
#商品浪琴  价格
CREATE TABLE censh_product_price(
  product_price_id INT(11) PRIMARY KEY NOT NULL  AUTO_INCREMENT,
  product_price VARCHAR(128)
);
INSERT INTO censh_product_price VALUES(null,"3000以内");
INSERT INTO censh_product_price VALUES(null,"3000-5000");
INSERT INTO censh_product_price VALUES(null,"5000-10000");
INSERT INTO censh_product_price VALUES(null,"10000-20000");
INSERT INTO censh_product_price VALUES(null,"20000-50000");
INSERT INTO censh_product_price VALUES(null,"50000-100000");
INSERT INTO censh_product_price VALUES(null,"100000以上");


/*****手表的图片可能不是很全*******/
-- CREATE TABLE censh_pic(
--   pic INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
--   censh_id INT(11) default NULL,
--   details_bigpic VARCHAR(128) default NULL,
--   details_sampelpic VARCHAR(128) default NULL
-- );
-- INSERT INTO censh_pic VALUES
-- ('1', '1', default, default),
-- ('2', '2', default, default),
-- ('3', '3', default, default),
-- ('4', '4', default, default);


/*****手表的图片*******/
CREATE TABLE censh_longinesproduct_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  watch_id INT,               #手表编号
  img VARCHAR(128)           #图片路径
);

INSERT INTO censh_longinesproduct_pic VALUES
(NULL, 1, 'image/浪琴Longines手表，腕表价格/1a765a887ef04dbabe06a5e8d2ecc52cX320.jpg'),
(NULL, 2, 'image/浪琴Longines手表，腕表价格/0d4a0473c652421a979e915507c2da75X320.jpg'),
(NULL, 3, 'image/浪琴Longines手表，腕表价格/2dce4ec9ff014925b955776894c8dbc7X320.jpg'),
(NULL, 4, 'image/浪琴Longines手表，腕表价格/3b4d9c0f23664f848b812c12c1be774bX320.jpg'),
(NULL, 5, 'image/浪琴Longines手表，腕表价格/4a3edf7edcc74ed1a922d4a582782e55X320.jpg'),
(NULL, 6, 'image/浪琴Longines手表，腕表价格/4a4d7acd4a7a465d92c2193c9a194839X320.jpg'),
(NULL, 7, 'image/浪琴Longines手表，腕表价格/4b8faaf7d500466e9c88e810c85d461fX320.jpg'),
(NULL, 8, 'image/浪琴Longines手表，腕表价格/5afa4a8f314245cb9fd3b01081217953X320.jpg'),
(NULL, 9, 'image/浪琴Longines手表，腕表价格/7a29dc53231a49729fefae6b0b023033X320.jpg'),
(NULL, 10, 'image/浪琴Longines手表，腕表价格/8d3583dbb7b54e208ef257aaaeb2b202X320.jpg'),
(NULL, 11, 'image/浪琴Longines手表，腕表价格/8f537616e4814c1dbcfe458c26ca0783X320.jpg'),
(NULL, 12, 'image/浪琴Longines手表，腕表价格/14dd24497200409da3521b4321a8ef34X320.jpg'),
(NULL, 13, 'image/浪琴Longines手表，腕表价格/45cc90a0acc44082b1580a5261419078X320.jpg'),
(NULL, 14, 'image/浪琴Longines手表，腕表价格/465c1b17fd7546ae9e8a61116bb3c9f3X320.jpg'),
(NULL, 15, 'image/浪琴Longines手表，腕表价格/1368bc542b3b4f1c8df14f99c58dcbd9X320.jpg'),
(NULL, 16, 'image/浪琴Longines手表，腕表价格/7283afb37fec4333a0efcb0004e4f5ddX320.jpg'),
(NULL, 17, 'image/浪琴Longines手表，腕表价格/83656f643aac46869c9bd274ab47723fX320.jpg'),
(NULL, 18, 'image/浪琴Longines手表，腕表价格/a4db7d2fc2a346a680b89a03451f6041X320.jpg'),
(NULL, 19, 'image/浪琴Longines手表，腕表价格/a93dad54140b40e395a968f4fd517be2X320.jpg'),
(NULL, 20, 'image/浪琴Longines手表，腕表价格/a93dad54140b40e395a968f4fd517be2X320.jpg'),
(NULL, 21, 'image/浪琴Longines手表，腕表价格/b7c7b998a4fd4ae0a07802641e8ced84X320.jpg'),
(NULL, 22, 'image/浪琴Longines手表，腕表价格/b13c47e935b94745b57b935a4bc8f2cbX320.jpg'),
(NULL, 23, 'image/浪琴Longines手表，腕表价格/b249fdf9e48841b3bd891201545500aaX320.jpg'),
(NULL, 24, 'image/浪琴Longines手表，腕表价格/b900a4b95d6b41258ebec10778e2ab16X320.jpg');

#没有添加
ALTER TABLE censh_longinesproduct_pic ADD img_detail VARCHAR(255);
-- 详情页活动正在进行中的图片
CREATE TABLE censh_longinesproduct_work_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  watch_id INT,               #手表编号
  img VARCHAR(128)           #图片路径
);
INSERT INTO censh_longinesproduct_work_pic VALUES
(NULL, 1, 'image/浪琴Longines手表，腕表价格/5d31225aead35.jpg'),
(NULL, 2, 'image/浪琴Longines手表，腕表价格/5d1afe6a48de6.jpg'),
(NULL, 3, 'image/浪琴Longines手表，腕表价格/5d36b3fe2fc9f.jpg');

/*****单个商品详情页的图片*******/
CREATE TABLE censh_order_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  order_watch_id INT,              #笔记本电脑编号
  displayimg VARCHAR(128)            #展示图片路径
  -- detailimg VARCHAR(128),             #商品详情图片
  -- storyimg VARCHAR(128),              #商品故事图片
  -- storeimg VARCHAR(128),              #店铺图片
  -- moreimg  VARCHAR(128),              #更多推荐
  -- otherimg VARCHAR(128)               #同价位不同品牌图片
);

INSERT INTO censh_order_pic VALUES
(NULL, 1, 
'image/order/9e238e44beb44f338a3ab6ceec185fc4X640.jpg'),
(NULL, 2, 
'image/order/LS4024AD背X640.jpg'),
(NULL, 3, 
'image/order/LS4024AD侧X640.jpg'),
(NULL, 4, 
'image/order/LS4024AD扣X640.jpg'),
(NULL, 5, 
'image/order/LS4024AD模X640.jpg');


(NULL, 6, "",
'image/order/e134bd5bc7dc41cabdde640b63df59ebX320.jpg',"","","",""),
(NULL, 7, "",
'image/order/119f90d9980a4fbbb8b29f6fd6950e59X320.jpg',"","","",""),
(NULL, 8, "",
'image/order/f2120c12a4ea4f50b2dab966a4b9b90dX320.jpg',"","","",""),


(NULL, 9,"","",'image/order/1496994057.jpg',"","",""),
(NULL, 10,"","",'image/order/shengshi_story.jpg',"","",""),
(NULL, 11,"","",'image/order/store.jpg',"","",""),


(NULL, 12,"","","",'image/order/5X125small.jpg',"",""),
(NULL, 13,"","","",'image/order/2X125small.jpg',"",""),
(NULL, 14,"","","",'image/order/4X125small.jpg',"",""),
(NULL, 15,"","","",'image/order/1X125small.jpg',"",""),
(NULL, 16,"","","",'image/order/2X125small(1).jpg',"",""),
(NULL, 17,"","","",'image/order/1X125small(2).jpg',"",""),


(NULL, 18,"","","","",'image/order/23150445206001-01X320.jpg',""),
(NULL, 19, "","","","",
'image/order/a153c92cc8f54ab6b0b24e00096a43deX320.jpg',""),
(NULL, 20,"","","","",
'image/order/8c250886ed3041619f187a6e6ea14d12X320.jpg',""),
(NULL, 21,"","","","",'image/order/IW502639正X320.jpg',""),
(NULL, 22,"","","","",'image/order/IW502802-01X320.jpg',""),


(NULL, 23, "","","","","",
'image/order/宝玑.jpg'),
(NULL, 24, "","","","","",
'image/order/宝珀.jpg'),
(NULL, 25, "","","","","",
'image/order/播威.jpg'),
(NULL, 26, "","","","","",
'image/order/伯爵.jpg'),
(NULL, 27, "","","","","",
'image/order/法穆兰.jpg'),
(NULL, 28, "","","","","",
'image/order/格拉苏蒂原创.jpg'),
(NULL, 29, "","","","","",
'image/order/积家.jpg'),
(NULL, 30, "","","","","",
'image/order/朗格.jpg'),
(NULL, 31, "","","","","",
'image/order/雅典.jpg'),
(NULL, 32, "","","","","",
'image/order/雅克德罗.jpg');
/*****购物车*******/
CREATE TABLE censh_shoppingcart(
  lid INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT(11) default NULL,
  product_id INT(11) default NULL,
  count INT(11) default NULL,
  is_checked TINYINT(1) default NULL
);
INSERT INTO censh_shoppingcart VALUES
('1', '10', '17', '1', '0'),
('2', '11', '11', '1', '0'),
('3', '12', '1', '1', '1'),
('4', '13', '3', '9', '0'),
('5', '14', '1', '1', '0'),
('13', '20', '1', '1', '1'),
('14', '22', '17', '11', '1'),
('15', '20', '28', '1', '0');

/*****订单*******/
CREATE TABLE censh_order(
  aid INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT(11) default NULL,
  address_id INT(11) default NULL,
  statues INT(11) default NULL,
  order_time BIGINT(20) default NULL,
  pay_time BIGINT(20) default NULL,
  deliver_time BIGINT(20) default NULL,
  reveived BIGINT(20) default NULL
);

CREATE TABLE censh_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);


/**收货地址信息**/
CREATE TABLE censh_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);



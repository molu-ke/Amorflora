/**爱尚鲜花数据**/
SET NAMES UTF8;
DROP DATABASE IF EXISTS am;
CREATE DATABASE am CHARSET=UTF8;
USE am;

/**鲜花家族**/
CREATE TABLE am_product_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);
INSERT INTO am_product_family VALUES
(1,'订阅惊喜'),
(2,'极速送花'),
(3,'永生花礼'),
(4,'花边小物'),
(5,'限时抢购'),
(6,'单束花礼');

/*鲜花产品*/
CREATE TABLE am_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属鲜花家族编号
  pic     VARCHAR(128),            #封面图片路径
  cover_title VARCHAR(128),         #封面标题
  cover_price DECIMAL(10,2),        #封面价格
  cover_rate_price DECIMAL(10,2),   #封面优惠后价格
  title   VARCHAR(128),       #标题
  subtitle VARCHAR(128),      #副标题
  range_price  VARCHAR(128),  #区间价格
  freight   VARCHAR(128),    #运费
  expect    VARCHAR(128),       #配送产品
  rule      VARCHAR(128),       #配送规则
  style     VARCHAR(128),       #款式
  duration   VARCHAR(128),       #时长
  shelf_time  BIGINT           #上架时间
);

/**购物车条目**/
CREATE TABLE am_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  style  VARCHAR(32),       #购买的款式
  duration VARCHAR(32),             #配送的时长
  price decimal(10,2),        #价格     
  is_checked  tinyint(1)        #是否选中        
);


INSERT INTO am_product VALUES
(1,1,"image/product/1-01-00.jpg","花漾盛宴鲜花系列",306,189,"花漾盛宴鲜花系列","四种套餐的惊喜选择 让芬芳飘洒","189.00 ~ 209.00","免运费","周期购","该商品为订阅包月鲜花，每1周配送一次","花漾盛宴A>花漾盛宴B","1个月(4束)",157123456789),
(2,1,"image/product/1-02-00.jpg","乐享甜蜜鲜花系列",99,null,"乐享甜蜜鲜花系列","一月四次，极简混搭，惊喜与甜蜜齐收，满室馨香","99.00 ~ 496.00","免运费","周期购","该商品为订阅包月鲜花，每1周配送一次","乐享甜蜜2束/次>乐享甜蜜1束/次","1个月（4次）>3个月（12次）",157123456789),
(3,1,"image/product/1-03-00.jpg","纯真单品/缤纷设计鲜花系列集选",99,null,"鲜花系列集选","纯真单品/精选单品/缤纷设计，一周一花，一周一种生活","99.00 ~ 2352.00","免运费","周期购","该商品为订阅包月鲜花，每1周配送一次","入门单品>精选单品>缤纷设计","1个月(4束)>3个月(12束)>6个月(24束)>1年赠1个月(52束)",157123456789),
(4,1,"image/product/1-04-00.jpg","轻奢甄选鲜花系列",199,null,"轻奢甄选鲜花系列","一周一花，质感奢华, 全球花材主题, 品位生活","19.00 ~ 4788.00","免运费","周期购","该商品为订阅包月鲜花，每1周配送一次","轻奢甄选","单次体验(1束)>1个月(4束)>3个月(12束)>6个月(24束)>1年赠1个月(52束)",157123456789),
(5,1,"image/product/1-05-00.jpg","订阅鲜花礼品卡系列",109,null,"订阅鲜花礼品卡系列","注：99元包月需加10元邮费，一月四次，每周一束","109.00 ~ 399.00","免运费",null,null,"99元/月纯真单品>199元/月缤纷设计>299元/月玫瑰之约>399元/月轻奢甄选",null,157123456789),

(6,2,"image/product/2-01-00.jpg",null,null,null,"[ 33枝玫瑰系列 ]","浓情七月，奢享玫瑰之爱，让芳香缠绕心间","199.00 ~ 339.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","巴黎之恋>浪漫心事>奥菲莉亚>好久不见>初恋记事本>柔情蜜意>挚爱此生","节日送达>平日送达",157123456789),
(7,2,"image/product/2-02-00.jpg",null,null,null,"19枝玫瑰礼盒 全国同城配送","19枝玫瑰礼盒 全国同城配送 新鲜直达","169.00 ~ 269.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","浓情糖果>深情邂逅-红玫瑰>深情邂逅-戴安娜>深情邂逅-香槟玫瑰","节日送达>平日送达",157123456789),
(8,2,"image/product/2-03-00.jpg",null,null,null,"【送长辈】感恩 关怀","亲情无价","169.00 ~ 269.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","关怀>感恩","节日送达>平日送达",157123456789),
(9,2,"image/product/2-04-00.jpg",null,null,null,"明艳雪山&情迷戴安娜","全国同城配送","169.00 ~ 299.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","情迷戴安娜>明艳雪山","节日送达>平日送达",157123456789),
(10,2,"image/product/2-05-00.jpg",null,null,null,"三生三世的爱情&一生所爱","三生三世的爱情&一生所爱","169.00 ~ 299.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","三生三世>一生所爱","节日送达>平日送达",157123456789),


(11,3,"image/product/3-01-00.jpg","【永生花】星光如梦",399,null,"星光如梦-爱的小公主小王子","星光如梦-爱的小公主小王子，霓虹永生花 -北京仓发货","399.00","免运费",null,null,"星光-小公主-粉色花>星光-小王子-红色花>星光-小棕熊-浅紫花>星光-红玫瑰>星光-小白熊-红花",null,157123456789),
(12,3,"image/product/3-02-00.jpg","进口永生花音乐盒",111.10,null,"【进口永生花音乐盒】","三生相守&一世情缘-上海普陀仓发货","111.10 ~ 249.00","免运费",null,null,"一世情缘-七彩色>一世情缘-蓝色>一世情缘-深紫色>一世情缘-浅紫色",null,157123456789),
(13,3,"image/product/3-03-00.jpg","【永生花】星座永生花",399,null,"星座永生花","心之所属 挚爱守护-北京仓发货","399.00","免运费",null,null,"水瓶座-浅蓝>摩羯座-深紫>射手座-墨绿>天蝎座-黑色>处女座-艳粉>金牛座-深蓝>双子座-浅粉>狮子座-米黄>白羊座-红色",null,157123456789),
(14,3,"image/product/3-04-00.jpg","【永生花】爱的抱抱&秘密花园",199,null,"爱的抱抱 & 秘密花园","精品永生花-北京仓发货","199.00 ~ 299.00","免运费",null,null,"朱砂红>海洋蓝>紫影>红色花园>绿色花园>紫色花园",null,157123456789),

(15,4,"image/product/4-01-00.jpg","爱尚花瓶集锦",25,null,"爱尚花瓶集合","花瓶大集合，总有一款适合你","25.00 ~ 79.00","免运费",null,null,"蓝釉花瓶>古典花瓶>八芒星花瓶>空谷花瓶>透明花瓶>星河灿花瓶>琥珀花瓶",null,157123456789),
(16,4,"image/product/4-02-00.jpg","睡美人桑蚕丝眼罩",98,null,"花边小物 | 睡美人桑蚕丝眼罩","这是一个关于好好睡眠的故事","98.00","免运费",null,null,"睡美人眼罩",null,157123456789),
(17,4,"image/product/4-03-00.jpg","日本坂源花剪",139,null,"花边小物 | 日本坂源花剪","美好生活从细节开始","139.00","免运费",null,null,"坂源花剪-绿色>坂源花剪-蓝色",null,157123456789),
(18,4,"image/product/4-04-00.jpg","荷兰进口可利鲜",35.00 ,null,"花边小物| 荷兰进口可利鲜","19大期间，液体类的产品暂停发货，暂定10月30日恢复"," 35.00 ~ 50.00","免运费",null,null,"单瓶装可利鲜>两瓶装可利鲜",null,157123456789),

(19,5,"image/product/5-01-00.jpg","感恩有你",89.90 ,199.00,"【感恩节主题花束】感恩有你","一束鲜花，两种插法；瓶插桌花随意搭","89.90","免运费",null,null,"感恩有你","11月20日",157123456789),
(20,5,"image/product/5-02-00.jpg","限时闪购",59.90 ,89.90,"【感恩节主题花束】感恩有你","一束鲜花，两种插法；瓶插桌花随意搭","89.90","免运费",null,null,"感恩有你","11月20日",157123456789),
(21,5,"image/product/5-03-00.jpg","限时三人团",59.90 ,89.90,"【感恩节主题花束】感恩有你","一束鲜花，两种插法；瓶插桌花随意搭","89.90","免运费",null,null,"感恩有你","11月20日",157123456789),
(22,5,"image/product/5-04-00.jpg","花漾盛宴",189.00 ,306.00,"【感恩节主题花束】感恩有你","一束鲜花，两种插法；瓶插桌花随意搭","89.90","免运费",null,null,"感恩有你","11月20日",157123456789),

(23,6,"image/product/6-01-00.jpg","【送TA】33枝玫瑰系列",199.00 ,null,"[ 33枝玫瑰系列 ]","浓情七月，奢享玫瑰之爱，让芳香缠绕心间","199.00 ~ 339.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","巴黎之恋>浪漫心事>奥菲莉亚>好久不见>初恋记事本>柔情蜜意>挚爱此生","节日送达>平日送达",157123456789),
(24,6,"image/product/6-02-00.jpg","【送长辈】感恩&关怀款",169.00 ,null,"【送长辈】感恩 关怀","浓情七月，奢享玫瑰之爱，让芳香缠绕心间","199.00 ~ 339.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","巴黎之恋>浪漫心事>奥菲莉亚>好久不见>初恋记事本>柔情蜜意>挚爱此生","节日送达>平日送达",157123456789),
(25,6,"image/product/6-03-00.jpg","【送TA】19枝玫瑰款",169.00 ,null,"19枝玫瑰礼盒","浓情七月，奢享玫瑰之爱，让芳香缠绕心间","199.00 ~ 339.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","巴黎之恋>浪漫心事>奥菲莉亚>好久不见>初恋记事本>柔情蜜意>挚爱此生","节日送达>平日送达",157123456789),
(26,6,"image/product/6-04-00.jpg","【送TA】明艳雪山&情迷戴安娜",169.00 ,null,"明艳雪山&情迷戴安娜","浓情七月，奢享玫瑰之爱，让芳香缠绕心间","199.00 ~ 339.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","巴黎之恋>浪漫心事>奥菲莉亚>好久不见>初恋记事本>柔情蜜意>挚爱此生","节日送达>平日送达",157123456789),
(27,6,"image/product/6-05-00.jpg","【新品】一篮春色",299.00 ,null,"【同城新品】一篮春色","仅限北京，上海，广州，南京，杭州地区用户下单购买","199.00 ~ 339.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","巴黎之恋>浪漫心事>奥菲莉亚>好久不见>初恋记事本>柔情蜜意>挚爱此生","节日送达>平日送达",157123456789),
(28,6,"image/product/6-06-00.jpg","[星座花礼]星座鲜花-射手座",129.00 ,null,"[星座花礼]星座鲜花-射手座","浓情七月，奢享玫瑰之爱，让芳香缠绕心间","199.00 ~ 339.00","免运费","极速达","该商品为同城配送，最快3小时内可送达","巴黎之恋>浪漫心事>奥菲莉亚>好久不见>初恋记事本>柔情蜜意>挚爱此生","节日送达>平日送达",157123456789);

/**鲜花图片**/
CREATE TABLE am_product_img(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,              #鲜花产品编号
  banner_pic VARCHAR(256),            #轮播图片路径
  details_pic VARCHAR(768)           #详细页图片路径
);
INSERT INTO am_product_img VALUES    
(null,1,"image/product/1-01-banner01.jpg>image/product/1-01-banner02.jpg>image/product/1-01-banner03.jpg","image/product/1-01-details01.jpg>image/product/1-01-details02.jpg>image/product/1-01-details03.jpg>image/product/1-01-details04.jpg>image/product/1-01-details05.gif>image/product/1-01-details06.jpg"),

(null,2,"image/product/1-02-banner01.jpg>image/product/1-02-banner02.jpg>image/product/1-02-banner03.jpg","image/product/1-02-details01.jpg>image/product/1-02-details02.jpg>image/product/1-02-details03.gif>image/product/1-02-details04.jpg>image/product/1-02-details05.jpg>image/product/1-02-details06.jpg"),

(null,3,"image/product/1-02-banner01.jpg>image/product/1-02-banner02.jpg>image/product/1-02-banner03.jpg","image/product/1-02-details01.jpg>image/product/1-02-details02.jpg>image/product/1-02-details03.gif>image/product/1-02-details04.jpg>image/product/1-02-details05.jpg>image/product/1-02-details06.jpg"),

(null,4,"image/product/1-02-banner01.jpg>image/product/1-02-banner02.jpg>image/product/1-02-banner03.jpg","image/product/1-02-details01.jpg>image/product/1-02-details02.jpg>image/product/1-02-details03.gif>image/product/1-02-details04.jpg>image/product/1-02-details05.jpg>image/product/1-02-details06.jpg"),

(null,5,"image/product/1-02-banner01.jpg>image/product/1-02-banner02.jpg>image/product/1-02-banner03.jpg","image/product/1-02-details01.jpg>image/product/1-02-details02.jpg>image/product/1-02-details03.gif>image/product/1-02-details04.jpg>image/product/1-02-details05.jpg>image/product/1-02-details06.jpg"),

(null,6,"image/product/2-01-banner01.jpg>image/product/2-01-banner02.jpg>image/product/2-01-banner03.jpg","image/product/2-01-details01.jpg>image/product/2-01-details02.jpg>image/product/2-01-details03.jpg>image/product/2-01-details04.jpg>image/product/2-01-details05.jpg>image/product/2-01-details06.jpg"),

(null,7,"image/product/2-02-banner01.jpg>image/product/2-02-banner02.jpg>image/product/2-02-banner03.jpg","image/product/2-02-details01.jpg>image/product/2-02-details02.jpg>image/product/2-02-details03.jpg>image/product/2-02-details04.jpg>image/product/2-02-details05.jpg>image/product/2-02-details06.jpg"),

(null,8,"image/product/2-03-banner01.jpg>image/product/2-03-banner02.jpg>image/product/2-03-banner03.jpg","image/product/2-03-details01.jpg>image/product/2-03-details02.jpg>image/product/2-03-details03.jpg>image/product/2-03-details04.jpg>image/product/2-03-details05.jpg>image/product/2-03-details06.jpg"),

(null,9,"image/product/2-03-banner01.jpg>image/product/2-03-banner02.jpg>image/product/2-03-banner03.jpg","image/product/2-03-details01.jpg>image/product/2-03-details02.jpg>image/product/2-03-details03.jpg>image/product/2-03-details04.jpg>image/product/2-03-details05.jpg>image/product/2-03-details06.jpg"),

(null,10,"image/product/2-03-banner01.jpg>image/product/2-03-banner02.jpg>image/product/2-03-banner03.jpg","image/product/2-03-details01.jpg>image/product/2-03-details02.jpg>image/product/2-03-details03.jpg>image/product/2-03-details04.jpg>image/product/2-03-details05.jpg>image/product/2-03-details06.jpg"),

(null,11,"image/product/3-01-banner01.jpg>image/product/3-01-banner02.jpg>image/product/3-01-banner03.jpg","image/product/3-01-details01.jpg>image/product/3-01-details02.jpg>image/product/3-01-details03.jpg>image/product/3-01-details04.jpg>image/product/3-01-details05.jpg>image/product/3-01-details06.jpg"),

(null,12,"image/product/3-02-banner01.jpg>image/product/3-02-banner02.jpg>image/product/3-02-banner03.jpg","image/product/3-02-details01.jpg>image/product/3-02-details02.jpg>image/product/3-02-details03.jpg>image/product/3-02-details04.jpg>image/product/3-02-details05.jpg>image/product/3-02-details06.jpg"),

(null,13,"image/product/3-03-banner01.jpg>image/product/3-03-banner02.jpg>image/product/3-03-banner03.jpg","image/product/3-03-details01.jpg>image/product/3-03-details02.jpg>image/product/3-03-details03.jpg>image/product/3-03-details04.jpg>image/product/3-03-details05.jpg>image/product/3-03-details06.jpg"),

(null,14,"image/product/3-04-banner01.jpg>image/product/3-04-banner02.jpg>image/product/3-04-banner03.jpg","image/product/3-04-details01.jpg>image/product/3-04-details02.jpg>image/product/3-04-details03.jpg>image/product/3-04-details04.jpg>image/product/3-04-details05.jpg>image/product/3-04-details06.jpg"),

(null,15,"image/product/4-01-banner01.jpg","image/product/4-01-details01.jpg>image/product/4-01-details02.jpg>image/product/4-01-details03.jpg>image/product/4-01-details04.jpg>image/product/4-01-details05.jpg>image/product/4-01-details06.jpg"),

(null,16,"image/product/4-02-banner01.jpg","image/product/4-02-details01.jpg>image/product/4-02-details02.jpg>image/product/4-02-details03.jpg>image/product/4-02-details04.jpg>image/product/4-02-details05.jpg"),

(null,17,"image/product/4-03-banner01.jpg>image/product/4-03-banner02.jpg>image/product/4-03-banner03.jpg","image/product/4-03-details01.jpg>image/product/4-03-details02.jpg>image/product/4-03-details03.gif>image/product/4-03-details04.jpg>image/product/4-03-details05.gif>image/product/4-03-details06.jpg"),

(null,18,"image/product/4-04-banner01.jpg>image/product/4-04-banner02.jpg","image/product/4-04-details01.jpg>image/product/4-04-details02.jpg>image/product/4-04-details03.jpg>image/product/4-04-details04.jpg>image/product/4-04-details05.jpg>image/product/4-04-details06.jpg"),

(null,19,"image/product/5-01-banner01.jpg>image/product/5-01-banner02.jpg>image/product/5-01-banner03.jpg","image/product/5-01-details01.jpg>image/product/5-01-details02.jpg>image/product/5-01-details03.jpg>image/product/5-01-details04.jpg>image/product/5-01-details05.jpg>image/product/5-01-details06.jpg"),

(null,20,"image/product/5-02-banner01.jpg>image/product/5-02-banner02.jpg","image/product/5-01-details01.jpg>image/product/5-01-details02.jpg>image/product/5-01-details03.jpg>image/product/5-01-details04.jpg>image/product/5-01-details05.jpg>image/product/5-01-details06.jpg"),

(null,21,"image/product/5-03-banner01.jpg>image/product/5-03-banner02.jpg>image/product/5-03-banner03.jpg","image/product/5-01-details01.jpg>image/product/5-01-details02.jpg>image/product/5-01-details03.jpg>image/product/5-01-details04.jpg>image/product/5-01-details05.jpg>image/product/5-01-details06.jpg"),

(null,22,"image/product/5-04-banner01.jpg>image/product/5-04-banner02.jpg>image/product/5-04-banner03.jpg","image/product/5-01-details01.jpg>image/product/5-01-details02.jpg>image/product/5-01-details03.jpg>image/product/5-01-details04.jpg>image/product/5-01-details05.jpg>image/product/5-01-details06.jpg"),

(null,23,"image/product/6-01-banner01.jpg>image/product/6-01-banner02.jpg>image/product/6-01-banner03.jpg","image/product/6-01-details01.jpg>image/product/6-01-details02.jpg>image/product/6-01-details03.jpg>image/product/6-01-details04.jpg>image/product/6-01-details05.jpg>image/product/6-01-details06.jpg"),

(null,24,"image/product/6-01-banner01.jpg>image/product/6-01-banner02.jpg>image/product/6-01-banner03.jpg","image/product/6-01-details01.jpg>image/product/6-01-details02.jpg>image/product/6-01-details03.jpg>image/product/6-01-details04.jpg>image/product/6-01-details05.jpg>image/product/6-01-details06.jpg"),

(null,25,"image/product/6-01-banner01.jpg>image/product/6-01-banner02.jpg>image/product/6-01-banner03.jpg","image/product/6-01-details01.jpg>image/product/6-01-details02.jpg>image/product/6-01-details03.jpg>image/product/6-01-details04.jpg>image/product/6-01-details05.jpg>image/product/6-01-details06.jpg"),

(null,26,"image/product/6-01-banner01.jpg>image/product/6-01-banner02.jpg>image/product/6-01-banner03.jpg","image/product/6-01-details01.jpg>image/product/6-01-details02.jpg>image/product/6-01-details03.jpg>image/product/6-01-details04.jpg>image/product/6-01-details05.jpg>image/product/6-01-details06.jpg"),

(null,27,"image/product/6-01-banner01.jpg>image/product/6-01-banner02.jpg>image/product/6-01-banner03.jpg","image/product/6-01-details01.jpg>image/product/6-01-details02.jpg>image/product/6-01-details03.jpg>image/product/6-01-details04.jpg>image/product/6-01-details05.jpg>image/product/6-01-details06.jpg"),

(null,28,"image/product/6-01-banner01.jpg>image/product/6-01-banner02.jpg>image/product/6-01-banner03.jpg","image/product/6-01-details01.jpg>image/product/6-01-details02.jpg>image/product/6-01-details03.jpg>image/product/6-01-details04.jpg>image/product/6-01-details05.jpg>image/product/6-01-details06.jpg");



/**用户信息**/
CREATE TABLE am_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
   phone VARCHAR(16),    
  upwd VARCHAR(32)
);
INSERT INTO am_user VALUES
(null,"123456","123456");


/****首页轮播广告商品****/
CREATE TABLE am_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
INSERT INTO am_index_carousel VALUES
(NULL, 'image/banner/banner1.jpg','轮播广告商品1',NULL),
(NULL, 'image/banner/banner2.jpg','轮播广告商品2',NULL),
(NULL, 'image/banner/banner3.jpg','轮播广告商品3',NULL),
(NULL, 'image/banner/banner4.jpg','轮播广告商品4',NULL),
(NULL, 'image/banner/banner5.jpg','轮播广告商品5',NULL),
(NULL, 'image/banner/banner6.jpg','轮播广告商品6',NULL);
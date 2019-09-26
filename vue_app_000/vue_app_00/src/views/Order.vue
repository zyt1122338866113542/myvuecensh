<template>
    <div>
        <my-header></my-header>
        <div class="col-main">
            <input type="hidden" id="productSku">
            <main data-pid="10106734">
                <section class="breadcrumbs clearfix">
                    <ul class="fl">
                        <li v-for="(item,index) of breadcrumbs" :key="index">
                            <router-link to="">{{item}} &nbsp;&nbsp;&gt;&nbsp;&nbsp;</router-link>
                        </li>
                    </ul>
                </section>
                <section class="summary clearfix">
                    <div class="summary-image  clearfix">
                        
                        <div class="picture ">
                            <ul>
                                <li>
                                    <img :src="i==1 ? 'http://127.0.0.1:8080/image/order/9e238e44beb44f338a3ab6ceec185fc4X640.jpg':
                                            i==2 ? 'http://127.0.0.1:8080/image/order/LS4024AD背X640.jpg':
                                            i==3 ? 'http://127.0.0.1:8080/image/order/LS4024AD侧X640.jpg':
                                            i==4 ? 'http://127.0.0.1:8080/image/order/LS4024AD扣X640.jpg':
                                                'http://127.0.0.1:8080/image/order/LS4024AD模X640.jpg'">
                                </li>
                            </ul>   
                        </div>
                        <div id="mask" v-show="show" :style="maskStyle"></div>
                        <div @mouseover="toggle" @mouseout="toggle" @mousemove="drag" id="super-mask"></div>
                        <div id="div-lg" v-show="show" v-for="(item,i) of pics[0]" :key="i"
                        :style="{'background-image':`url(http://127.0.0.1:8080/${item.displayimg})`}"
                        ></div>   
                    </div>
                    <div class="thumbanil fl">
                        <ul class="clearfix" id="sm">
                            <li v-for="(item,i) of pics[0]" :key="i" @click="changeone" >
                                <img :src=" `http://127.0.0.1:8080/`+item.displayimg" alt=""
                                    :data-id="item.lid">
                            </li>
                        </ul>
                    </div> 
                    <!-- <p class="tip">*产品图片仅供参考，请以实物为准</p> -->
                    <img src="http://127.0.0.1:8080/image/order/360icon1.gif" class="icon360" alt="">
                    <div class="summary-news">  
                        <div class="title">
                            品牌资讯 | NEWS
                            <div class="more">
                                <a href="">更多>></a>
                            </div>
                        </div>
                        <ul>
                            <li v-for="i of to" :key="i">
                                <a href="">{{lilist}}</a>
                            </li>
                        </ul>
                    </div> 
                    <div class="summary-detail fl">
                    <div class="title">
                        <div class="title-brand">
                            <img src="http://127.0.0.1:8080/image/order/0b252b69d7104716869d960ce47fd8be.jpg" alt="">
                            <span>江诗丹顿Vacheron Constantin</span>
                            <i class="bdsharettonbox share fr bdshare-button-style0-16" data-bd-bind="1566394310405">
                                <a href="#" class="bds_more" data-cmd="more"></a>
                            </i>
                            <i class="collection fr login_first" data-sku="25558/000R-9406" data-channel_id="1">
                                加入心愿单
                            </i>
                        </div>
                        <div class="title-name">
                            <h1>江诗丹顿 Vanchern Constantin TRADITIONNELLE系列 25558/000R-9406 石英 女款</h1>
                            <span class="red"></span>
                        </div>
                    </div>
                    <div class="content">
                        <div class="price-row clearfix">
                            <p>
                                <span class="red">¥142,000</span>
                                <!-- <em></em> -->
                                <span class="pre-money">预付定金</span>  
                                <span class="red">¥4,200</span>
                            </p>
                            <div class="erwercode fr">
                                <span>扫一扫</span>
                                <!-- 用jq写 -->
                                <div class="pic" id="qrcode"></div>
                            </div>
                        </div>
                        <div class="channel">
                            <div class="name">渠道售价</div>
                            <div class="btns">
                                <a href="" class="item on">正价购买</a>
                            </div>
                        </div>
                        <div class="getPointTips" @mouseover="showmytable" @mouseout="showmytable">
                            <span >奖励：购物一次最多可以有10400积分!</span>
                            <div class="tips" v-show="showtable">
                                <p>
                                    <span>购买&晒单有积分!</span>
                                </p>
                                <p>
                                    <span class="red">首次购就有积分!</span>
                                    在盛时网山的第一笔任意额消费购买实物商品即可获得200积分
                                </p>
                                <p>
                                    <span class="red">每笔订单满额就有积分!</span>
                                    凡在盛时网上单笔订单购买商品成交达成规定金额， 即可获得对应的积分奖励!
                                </p>
                                <table>
                                    <tbody>
                                        <tr>
                                            <th>积分奖励条件</th>
                                            <th>获得积分</th>
                                        </tr>
                                        <tr>
                                            <td>单笔订单金额超过99元</td>
                                            <td>100</td>
                                        </tr>
                                        <tr>
                                            <td>单笔订单金额超过999元</td>
                                            <td>1000</td>
                                        </tr>
                                        <tr>
                                            <td>单笔订单金额超过4999元</td>
                                            <td>5000</td>
                                        </tr>
                                        <tr>
                                            <td>单笔订单金额超过9999元</td>
                                            <td>10000</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p><span class="red">评价有积分！</span>收到实物商品后晒单评价每次可获得200积分</p>
                            </div>
                        </div>

                        <div class="detail-list">
                            <div class="detail-list-item">
                                <div class="detail-list-item-title">系列<i><span>品牌设计风格的划分</span></i></div>
                                <div class="detail-list-item-attributes">
                                    <a href="javascript:;"></a>
                                </div>
                            </div>

                            <div class="detail-list-item half" >
                                <div class="detail-list-item-title">产地<i><span>腕表的主要生产地</span></i></div>
                                <div class="detail-list-item-attributes">中国</div>
                            </div>

                            <div class="detail-list-item half">
                                <div class="detail-list-item-title">表径<i><span>腕表的表身直径(含表壳，不包括表冠、表耳部分) </span></i></div>
                                <div class="detail-list-item-attributes">38.0mm</div>
                            </div>

                            <div class="detail-list-item half">
                                <div class="detail-list-item-title">表带<i><span>对腕表固定手腕有效部分的统称，材质与款式繁多</span></i></div>
                                <div class="detail-list-item-attributes">棕色&nbsp;牛皮</div>
                            </div>

                            <div class="detail-list-item half">
                                <div class="detail-list-item-title">库存<i><span>库存以客服确认为准</span></i></div>
                                <div class="detail-list-item-attributes">有货</div>
                            </div>
                        </div>

                        <div class="detail-button clearfix">
                            <button type="button" class="pay fl add-cart-btn" data-sku="CSW00004M-CS" data-channel="1" data-cart_type="1" data-is_ajax="0"
                            @click="addcart"
                            >全额支付配送上门</button>
                            <button @click="jump">跳转到购物车</button>
                            <span v-show="showmsg">{{message}}</span>
                            <!-- <button type="button" class="pay fl add-cart-btn" data-sku="CSW00004M-CS" data-channel="1" data-cart_type="1" data-is_ajax="0"
                            >全额支付配送上门</button> -->
                            <span class="compare fl" data-pkid="10129193">对比</span>
                            <span class="sales-volume fl">门店销量：30</span>
                        </div>
                    </div>
                    <div class="more-hot">
                        <p>相关专题</p>
                        <router-link to="" v-for="(item,i) of alist" :key="i">{{item}}</router-link>
                    </div>
                    <div class="user-show" style="display: none;">
                        <div class="user-show-top">
                            <div class="user-show-top-title">
                                <img src="http://127.0.0.1:8080/image/images/product/晒图.png">
                            </div>
                            <div class="user-show-top-more">
                               <router-link to="">全部<span>0</span>张&gt;&gt;</router-link> 
                            </div>
                        </div>
                        <div class="user-show-pics">
                            <a class="item"></a>
                            <a class="item"></a>
                            <a class="item"></a>
                            <a class="item"></a>
                        </div>
                    </div>
                </div>
                </section>
                
                        
            </main>
        </div>
        <my-footer></my-footer>
    </div>
</template>
<script>
export default {
    data(){
        return{
            breadcrumbs:["首页","表","浪琴","浪琴 Longines HERIAGE 经典复刻系列"],      //保存面包屑导航
            pics:[
                {order_watch_id:1,displayimg:"",lname:"",price:""}
            ],                 //保存服务器返回的图片
            lilist:"江诗丹顿售后维修点如何查询?",
            i:1,
            to:5,
            show:false,
            showtable:false,
            showmsg:false,
            maskStyle:{left:0, top:-112},
            activeColor:'red',
            price:0,
            alist:["石英","男款","时尚","浪琴"]
            

            
        }
    },
    created() {
        this.loadMore();
    },
    methods:{
        loadMore(){
            // 1.创建url地址
            var url = "order";
            // 2.发送ajax请求
            this.axios.get(url).then(res=>{
            //console.log(res);
            this.pics = res.data.data; 
            //console.log(this.pics[0])
            })
        },
        // 完成展示表的切换
        changeone(e){
            if(e.target.nodeName=="IMG"){
                var id = e.target.dataset.id;
                this.i = id;
            }
        },
        //当鼠标在super-mask div上移动时
        drag(e){
            //通过事件对象获得鼠标相对于div左上角的偏移量。-mask的一半大小，就算出mask左上角相对于div左上角的left和top值
            var left=e.offsetX-80;
            var top=e.offsetY-80;
            //如果mask左边越界，就停留在最左边，而不超出
            if(left<0){left=0}
            //否则如果left超过mImg的宽-mask的宽，说明右边越界，就停留在最右边，而不超出。
            else if(left>240){left=240}
            //如果mask上边越界，就停留在最上边，而不超出
            if(top<0){top=0}
            //否则如果top超过mImg的高-mask的高，说明下边越界，就停留在最下边，而不超出。
            else if(top>240){top=240}
            //为最终计算结果left和top添加单位
            left=left+"px";
            top=top+"px";
            //修改maskStyle对象，自动触发页面mask元素位置的更改。
            this.maskStyle={left,top};
        },
        toggle(){
            this.show=!this.show;
        },
        gbPosition(){
            return `${-parseInt(this.maskStyle.left)*16/7}px ${-parseInt(this.maskStyle.top)*16/7}px`;
        },
        // computed:{
        //     // gbPosition(){
        //     //     return `${-parseInt(this.maskStyle.left)*16/7}px ${-parseInt(this.maskStyle.top)*16/7}px`;
        //     // }
        // },
        showmytable(){
            this.showtable = !this.showtable;
        },
        addcart(){
            var mylid = 10;
            var myprice = 1000;
            var mylname = "my";
            console.log(mylid,myprice,mylname);
            var url = "addcart";
            var obj={lid:mylid,lname:mylname,price:myprice}
            this.axios.get(url,{params:obj}).then(res=>{
                console.log(res);
                // if(res.data.code==-1){
                //     //异步，所以要用回调函数
                //     this.message = '请先登录';
                //     this.showmsg = true;
                //     this.$router.push("/login");
                // }else 
                if(res.data.code==-2){
                    console.log("添加失败")
                }else{
                    console.log("添加成功")
                    //http://127.0.0.1:8080/addcart?lid=1&lname=kk&price=9
                    
                }
            })
        },
        jump(){
            this.$router.push("/cart");
        }
        
    }
}
</script>
<style scoped>
@import url(../assets/css/order.css);
</style>

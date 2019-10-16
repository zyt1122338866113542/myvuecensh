<template>
  <header>
    <div class="nav">
        <div class="wrap">
            <div class="u1">
                <ul>	
                <li>欢迎{{$store.getters.getUname}}光临盛时网</li>
                <li>
                    <router-link to="Login">登录</router-link>
                <li>
                    <router-link to="Login">免费注册</router-link>
                </li>
            </ul>
            </div>
            <div class="u2">
                <ul>
                    <li>400-921-3599</li>
                    <li>
                        <router-link to="">盛时APP</router-link>
                    </li>
                    <li>
                        <router-link to="">我的盛时</router-link>
                    </li>
                    <li><router-link to="/cart">我的订单</router-link>
                    </li>
            </ul>
            </div>
        </div>	
    </div>
    <div class="core">
        <div class="wrap">
            <div class="logo">
                <div class="logo-wrap">
                    <router-link to="">
                        <img src="http://127.0.0.1:8080/image/index/logo.png" alt="">
                    </router-link>
                </div>
                <div class="store">
                    <router-link to="">全国<br>396家门店</router-link>
                </div>
            </div>
            <div class="search">
                <div class="select ">
                    <div class="name dropdown-toggle">产品</div>
                    <ul class="dropdown">
                        <li>产品</li>
                        <li>门店</li>
                    </ul>
                </div>
                <form class="product">
                    <input type="text" placeholder="请输入商品搜索词" class="search-box autocomplay-input" v-model="kw" @keydown.13="search">
                    <span class="help-hidden-accessible">
                    </span>
                    <button type="button" id="search" @click="search"></button>
                    <div class="swiper-container"></div>
                </form>	
                <a href="#" class="cart" onclick="point_click('购物车')">
                    <i class="ccart-num">{{$store.getters.getTotal}}</i>
                </a>
            </div>
        </div>
    </div>
    <div class="menu">
        <div class="wrap">
            <div class="item" >
                <router-link to="" class="hasChild" v-for="(item,index) of tabbarList" :key="index">{{item}}</router-link>
                <div class="sub">
                    <div class="tab on">
                        <div class="list col4">
                            <dl>
                                <dt>殿堂品牌</dt>
                                <dd v-for="(item,index) of list" :key="index">
                                    <router-link to="">{{item.fname}}</router-link>
                                     
                                </dd>
                            </dl>
                        </div>
                        <div class="list col4">
                            <dl>
                                <dt>殿堂品牌</dt>
                                <dd v-for="(item,index) of list" :key="index">
                                     <a href="">{{item.fname}}</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="list col4">
                            <dl>
                                <dt>殿堂品牌</dt>
                                <dd v-for="(item,index) of list" :key="index">
                                     <a href="">{{item.fname}}</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="list col4">
                            <dl>
                                <dt>殿堂品牌</dt>
                                <dd v-for="(item,index) of list" :key="index">
                                     <a href="">{{item.fname}}</a>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</header>
</template>
<script>
export default {
    data(){
        return{
            list:[],    //保存服务器返回的牌子列表
            tabbarList:["全部品牌","选表购表","盛时奥莱","积分商城","定制&周边","海外产品","维修保养","线下门店","品牌馆","资讯","视频"],
            // 菜单导航的列表
            kw:1,  //利用双向绑定获得搜索文本框中用户输入的关键词
            uname:''
        }
    },
    created() {
        this.loadMore();
        //如果地址栏中已经有用户输入的关键词参数kw，则自动获取到搜索文本框中保持同步
       // this.kw=this.$route.params.kw;
    },
    methods:{
        loadMore(){
            // 1.创建url地址
            var url = "index";
            // 2.发送ajax请求
             this.axios.get(url).then(res=>{
                //console.log(res);
                this.list = res.data.data; 
            })
        },
        // 搜索
        search(){
            this.$router.push("/longinesproduct/"+this.kw)
            }
        },
        watch:{
        //如果地址栏中已经有用户输入的关键词参数kw，则自动获取到搜索文本框中保持同步
            $route(){
                this.kw=this.$route.params.kw;
            }
        }
    
//   data(){
//     return {
//       kw:""//利用双向绑定获得搜索文本框中用户输入的关键词
//     }
//   },
//   methods:{
//     //点击查询按钮或在文本框上按回车，都可以跳转到/products页面，并把输入的关键词传过去。
//     search(){
//       this.$router.push("/products/"+this.kw)
//     }
//   },
//   //如果地址栏中已经有用户输入的关键词参数kw，则自动获取到搜索文本框中保持同步
//   created(){
//     this.kw=this.$route.params.kw;
//   },
//   watch:{
//     //如果地址栏中已经有用户输入的关键词参数kw，则自动获取到搜索文本框中保持同步
//     $route(){
//       this.kw=this.$route.params.kw;
//     }
//   }
 }
</script>
<style scoped>
    @import url(../assets/css/MyHeader.css);
    @import url(../assets/css/common.css);
    @import url(../../public/css/normalize.css);
</style>
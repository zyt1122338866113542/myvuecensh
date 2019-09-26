<template>
<div>
  <my-header></my-header>
  <div class="col-main">
    <section class="banner">
      <router-link to="">
          <img src="http://127.0.0.1:8080/image/浪琴Longines手表，腕表价格/5c935993794ce.jpg" alt="浪琴">
      </router-link>
    </section>
    <main data-typecode="wa">
      <section class="breadcrumbs clearfix">
        <ul class="fl">
          <li v-for="(item,index) of breadcrumbs" :key="index">
            <router-link to="">{{item}} &nbsp;&nbsp;&gt;&nbsp;&nbsp;</router-link>
          </li>
        </ul>
      </section>
      <section class="filter">
        <ul>
          <li class="filter-option clearfix">
            <div class="filter-option-title fl">筛选条件</div>
            <div class="filter-option-list">
              <ul>
                <li data-attr="brand" data-id="10003379">
                  <router-link to="">浪琴/Longines <i></i></router-link>
                </li>
              </ul>
            </div>
            <button class="filter-option-reset fr" data-url="">重置</button>
          </li>

          <li class="filter-row clearfix li-series normal-row">
              <div class="filter-title">系列</div>
              <div class="filter-list">
                  <ul class="clearfix myul1">
                      <li class="show" v-for="(item,index) 
          of list[0]" :key="index">
                          <router-link to="">
                              <span>{{item.product}}</span>
                          </router-link>
                      </li>
                  </ul>
                  <div class="filter-button">
                      <button class="buttom-more">更多</button>
                      <button class="buttom-close">收起</button>
                  </div>
              </div>
          </li>
          <li class="filter-row clearfix li-series normal-row">
              <div class="filter-title">机芯类型</div>
              <div class="filter-list">
                  <ul class="clearfix myul1">
                      <li class="show" v-for="(item,index) 
          of list[1]" :key="index">
                          <router-link to="">
                              <span>{{item.product_xl}}</span>
                          </router-link>
                      </li>
                  </ul>
                  <div class="filter-button">
                      <button class="buttom-more">更多</button>
                      <button class="buttom-close">收起</button>
                  </div>
              </div>
          </li>
          <li class="filter-row clearfix li-series normal-row">
              <div class="filter-title">价格区间</div>
              <div class="filter-list">
                  <ul class="clearfix myul1">
                      <li class="show" v-for="(item,index) 
          of list[2]" :key="index">
                          <router-link to="">
                              <span>{{item.product_price}}</span>
                          </router-link>
                      </li>
                  </ul>
                  <div class="filter-button">
                      <button class="buttom-more">更多</button>
                      <button class="buttom-close">收起</button>
                  </div>
              </div>
          </li>
        </ul>
        <div class="retarctable-button">
            <button class="open">显示全部筛选条件</button>
            <button class="close">已显示全部筛选条件</button>
        </div>
      </section>
      <section class="product-nav">
        <div class="product-nav-left fl">
          <div class="screen1 fl">
              <router-link to="" class="current">综合</router-link>
              <router-link to="" class="">价格</router-link>
              <router-link to="" class="">新品</router-link>
              <router-link to="" class="">评分</router-link>
              <router-link to="" class="">销量</router-link>
            </div>
            <div class="screen2 fl">
              <span>价格</span>
              <div class="screen-hover">
                  <div class="top">
                      <input type="number" class="price-from" value="" v-model="price1">
                      &nbsp;-&nbsp;
                      <input type="number" class="price-to" value="" v-model="price2">
                  </div>
                  <div class="bottom">
                    <button class="cancel">取消</button>
                    <button class="save price-filter">确定</button>
                  </div>
              </div>
            </div>
            <div class="screen3 fl">
              <input type="checkbox" id="checkbox-sellable">
              <label for="checkbox-sellable">只看有货</label>
              <input type="checkbox" id="checkbox-o2o">
              <label for="checkbox-o2o">预订付金</label>
              <input type="checkbox" id="checkbox-b2c">
              <label for="checkbox-b2c">在线直购</label>
              <input type="checkbox" id="checkbox-loop">
              <label for="checkbox-loop">360查看</label>
            </div>
            <div class="product-nav-right fr">
                共找到<span class="total-red">1845</span>款产品
            </div>
        </div>
      </section>
      <section class="product-list">
        <ul class="clearfix">
            <li class="list-content" v-for="(item,index) of list[3]" :key="index">
              <label>
                  <input type="checkbox" class="product-compare" value="10126896">
          &nbsp;对比
              </label>
                <div class="list-top">
                  <router-link to="" >
                      <!-- 事件 -->
                      <img :src=" `http://127.0.0.1:8080/`+ item.img" alt="" @click="jumporder">
                  </router-link>
                </div>
                <div class="list-bottom">
                  <h2>
                    <router-link to="">浪琴 Longines HERIAGE 经典复刻系列</router-link>
                  </h2>
                  <p class="price-inline">
                      <span class="original-price">￥14,100</span>
                      <span class="saves-volume">门店销量:224</span>
                  </p>
                  <div class="tags"></div>
                </div>
            </li>
        </ul>
      </section>
      <section class="page-control">
        <div class="page-box">
            <ol class="pagination clearfix" @click="change">
              <li :class="pno==1?'disable':''">上一页</li>
              <li v-for=" i of pcount" :key="i" :class="pno==i?'current':''">{{i}}</li>
              <li class="">
                  <router-link to="">...</router-link>
              </li>
              <li :class="pno==pcount?'disable':''">下一页</li>
            </ol>
            <div class="page-num">
                <span class="total">
                    &nbsp;共<span>57</span>&nbsp;页
                </span>
                <span class="jump">
                    到第<input type="text" title="跳到指定页">
                    &nbsp;页
                </span>
                <button>确定</button>
            </div>
        </div>
      </section>
    </main>
    <section class="seo_ranking">
      <div class="contentgroup">
        <div class="group" v-for="(item,index) of group" :key="index">
          <h2>{{item}}</h2>
        </div> 
      </div>
      <div class="tabs" >
        <div class="item" :class="show==false? 'on': ''"  @click="tab1" v-for="(item,i) of group" :key="i">
             热门资讯
          </div>
          <div class="item" :class="show==true? 'on': ''"  @click="tab2">
             热门排行榜
          </div>
      </div>


          <!-- <div class="lists">
            <ul class="ul1 on" >
              <li  v-for="(item,index1) of lists_rank1" :key="index1" data-index1="index1">
                <a href="" target="_blank">{{item}}</a>
              </li>     
            </ul>
            <ul class="ul2 "  v-if="show==false">
              <li v-for="(item,index2) of lists_rank2" :key="index2" data-index2="index2">
                <a href="" target="_blank">{{item}}</a>
              </li> 
            </ul>
          </div> -->
                          
        </section>
        <section class="seo_active">
            <h2>活动正在进行中</h2>
            <ul>
              <li v-for="(item,index) of list[4]" :key="index">
                  <router-link to="">
                    <img :src=" `http://127.0.0.1:8080/`+ item.img" alt="">
                  </router-link>
              </li>
            </ul>
        </section>
        <h2 class="desc">盛时官网为您推荐浪琴/Longines手表，更有手表新款报价、图片、参数、手表专卖店等信息。更有多种活动，让您嗨购不停。</h2>
        <div></div>
        <my-footer></my-footer>
  </div>
</div>

</template>
<script>
export default {
  data(){
    return{
      price1:"",
      price2:"",
      breadcrumbs:["首页","表","浪琴"],      //保存面包屑导航
      list:[],                               //图片
      pno:0,
      pcount:3,
      show:false,                             //控制标签的切换
      lid:9,
      group:[
        //榜单列表
        "资讯榜单","品牌榜单","机芯类型排行榜","表款类型排行榜"
        ],
      tabs:[
        ["热门资讯","热门排行榜"],
        ["品牌资讯","品牌排行榜"]
      ],
      tabsub1:["热门资讯","热门排行榜","品牌资讯","品牌排行榜"
      ],
      tabsub2:["机芯资讯","机芯排行榜","表款资讯","表款排行榜"],
      lists_rank1:[
          "1.范思哲反反复复付付",
          "2.范德萨范德萨发的多",
          "3.阿尔法从第三方成都市",
          "4.范德萨范德萨发吃剩的",
          "5.发斯蒂芬斯蒂芬斯蒂芬",
          "6.发生的房产税的房产税的",
          "7.方式等纷纷投入股份让人",
          "8.那就快点发货就是东方红",
          "9.据河南健康环境非常少分",
          "10.法警队是你的健康拿出来"
      ],
      lists_rank2:[
        "1.方式方法谷朊粉发发发",
        "2.反而儿童哈哈哈哈哈哈",
        "3.突突突突突突拖拖拖",
        "4.反反复复付付付付付付付付",
        "5.凄凄切切群群群群群群群群群群",
        "6.哒哒哒哒哒哒多哒哒哒哒哒哒多",
        "7.哒哒哒哒哒哒多多哒哒哒哒哒哒",
        "8.嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻",
        "9.啛啛喳喳错错错错错错错",
        "10.哒哒哒哒哒哒多多多多多多"
      ]
    }
  },
  props:["kw"], //自动接收地址栏关键词参数kw作为查询条件
  created() {
    this.loadMore();
  },
  methods:{
    loadMore(){
      // 1.创建url地址
      var url = "longinesproduct";
      this.pno++;
      var obj = {pno:this.pno,kw:this.kw}
      // 2.发送ajax请求
      this.axios.get(url,{params:obj}).then(res=>{
        //console.log(res);
        this.list = res.data.data; 
        console.log(this.list[0])
      })
    },
    // 页码跳转
    change(e){
      if (e.target.nodeName=="LI"){
        switch(e.target.innerHTML){
          case "上一页":
          if(this.pno>1){
              this.pno--;
          }
          break;
          case "下一页":
          if(this.pno<this.pcount){
              this.pno++;
          }
          break;
          default:
          this.pno=parseInt(e.target.innerHTML)
        }
      }
    },
    // tab标签切换
    tab1(){
      this.show=false;
    },
    tab2(){
      this.show=true;
    },
    jumporder(){
      var url = "order";
      var obj = {lid:this.lid}
      this.axios.get(url,{params:obj}).then(res=>{
        //console.log(res);
        this.$router.push("/order/"+this.lid)
      })
    }
  }
}
</script>
<style scoped>
@import url(../assets/css/longinesproduct.css);
</style>

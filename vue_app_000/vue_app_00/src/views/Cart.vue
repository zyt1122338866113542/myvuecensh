<template>
  <div>
    <my-header></my-header>
    <div class="col-main">
      <main>
        <section class="breadcrumbs clearfix">
          <ul class="fl">
            <li>
              <a href="">首页</a>&nbsp; >
            </li>
            <li>
              <a href="">我的购物车</a> &nbsp;&nbsp; 
            </li>
          </ul>
        </section>
        <section class="checkout-progress">
          <ul class="checkout-steps clearer">
              <li class="step" :class="i==index ? 'active':''" v-for="(item,i) of step" :key="i">
                  <div class="step-number">
                      <span>0{{i+1}}</span>
                  </div>
                  <div class="label">{{item}}</div>
              </li>
          </ul>
        </section>
        <section class="cart-content">
          <ul class="section-header">
            <li class="field-checkbox">间距</li>
            <li class="field-product">产品</li>
            <li class="field-price">价格</li>
            <li class="field-qty">数量</li>
            <li class="field-sum">小计</li>
            <li class="field-action">操作</li>
        </ul>
        <form action="/checkout/onepage" id="checkout-cart-form" method="post">
          <input type="hidden" value="1" id="checknum">
          <div class="checkout-body" id="section-subscipion-1" carttype="1">
            <div class="cart-type">
                <span>盛时自营</span>
            </div>
            <div class="content">
              <ul class="product-list " id="product1" v-for="(item,i) of list" :key="i">
                <li class="field-checkbox">
                  <input type="checkbox" name="item_id" value="16447" id="mycheckbox">
                </li>
                <li class="field-product">
                  <a href="" class="product-img">
                      <img style="width: 80px;" src="http://127.0.0.1:8080/image/card/4ed50519805a441b9f664b6466cdeaafX320.jpg" alt="">
                  </a>
                  <div class="col-right">
                      <a href="" class="product-name">
                          <span>{{item.lname}}</span>
                      </a>
                      <p class="sku">CSW00004M-CS</p>
                  </div>
                </li>
                <li class="field-price">
                  <p class="price">
                      ￥<span class="final-price">{{item.price}}</span>
                      <span>
                          ￥<del>1950</del>
                      </span>
                      <input type="hidden" name="field-price" value="1499">
                  </p>
                </li>
                <li class="field-qty">
                    <div class="qty-box">
                        <span class="ff" id="minus">-</span>
                        <!-- <input type="text" value="{{item.count}}" max="10" maxlength="4"> -->
                        <span class="count">{{item.count}}</span>
                        <span class="ff" id="plus">+</span>
                    </div>
                </li>
                <li class="field-sum">
                    <span class="item-subtotal" data-price="1499">
                        ￥<span class="price1" id="price">{{item.price}}</span>
                    </span>
                </li>
                <li class="field-action">
                    <button class="cart-item-delete" type="button" id="del" @click="del" :data-id="item.id"> 删除</button>
                </li>
                            
              </ul>
            </div>
          </div>
            <div class="cart-footer">
              <div class="tip">
                <img src="http://127.0.0.1:8080/image/images/checked.png" alt="">结算前请勾选商品 
              </div>
              <input type="hidden" name="cart_type" value="1">
              <span  class="delete-checked-items left" >
                <i></i>
                <!-- <button @click="aaa">删除选中商品</button>  -->
                <span @click="delmore">删除选中商品</span>
              </span>
              <a href="javascript:;" class="continue-shopping left">继续浏览购物</a>
              <!-- <button  class="disabled_btn right " id="pay">立即结算</button> -->
              <span @click="jump" class="right disabled_btn">立即结算2</span>
              <span class="subtotal right amount-total">合计
                ￥<span class="num checked-amoubt" id="totalAll">1499</span>元

                ￥<span class="num checked-amoubt" id="total">1,499</span>元
              </span>
              <span class="subtotal right">已选商品
                <span class="num checked-count">1</span>款
            </span>
            </div> 
        </form>
        </section>
      </main>
    </div>
  </div>
  
</template>
<script>
  export default {
    data(){
      return{
        step:["我的购物车","填写核对订单信息","成功提交订单","订单支付完成"],
        index:0,
        list:[],    //当前登录用户购物车列表
        lid:1,
        lname:'新款手表',
        price:5000,
        count:1
      } 
    },
    //props:["mylid"],
    created() {
        this.loadMore();
    },
    methods:{
      loadMore(){
        //功能：获取当前用户购物车列表
        var url = "carts";
        this.axios.get(url).then(res=>{
          if(res.data.code==-1){
            this.$router.push("/login");   
          }else{
            //获取服务器返回的数据
            //this.list = res.data.data;
            //添加一个新功能：为数据添加属性cb
            //创建循环遍历数据
            console.log(res)
            var rows = res.data.data;
            for(var item of rows){
                //添加新属性cb=false
                item.cb = false;
            }
              //重新赋值给list
              this.list = rows;  
              console.log(this.list)
          }
        })
      },
      // 删除一个
      del(e){
        var id=e.target.dataset.id;
        var url = "delcart";
        var obj={id};
        this.axios.get(url,{params:obj})
        .then(res=>{
          if(res.data.code==2){
            this.loadMore();
          }else{
            console.log('删除失败')
          }
        }).catch(err=>{
          console.log(err)
        })
      },
      // 全删
      delmore(){
        //console.log(5555555555)
        var id = "";
        for(var item of this.list){
          //console.log(item)
            if(!item.cb){
              //拼接id
              id+=item.id + ",";
            }
        }
        
        //去掉最后的逗号
        id=id.slice(0,-1);
        console.log(id);
        if(id==""){
          console.log('请选择要删除的')
          return;
        }
        var url = "delcarts";
        var obj = {id};
        this.axios.get(url,{params:obj}).then(res=>{
          console.log(res)
          if(res.data.code==2){
            this.loadMore();
            console.log("删除cg11111")
          }else{
            console.log("删除失败")
            
          }
        })    
      },
      aaa(){
        //console.log(222)
      },
      jump(){
        console.log(44545)
      }


    }
    
  }
</script>
<style scoped>
@import url(../assets/css/card.css);
</style>

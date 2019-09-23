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
                    <div class="summary-image fl clearfix">
                        <div class="picture fl">
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
                        <div class="thumbanil fl">
                            <ul class="clearfix" id="sm">
                                <li v-for="(item,i) of pics[0]" :key="i" @click="changeone" >
                                    <img :src=" `http://127.0.0.1:8080/`+ item.displayimg" alt=""
                                        :data-id="item.order_watch_id">
                                </li>
                            </ul>
                        </div>   
                    </div>
                    <div id="mask" style="top:112px;left: 0;display: block;"></div>
                    <div id="super-mask"></div>
                    <div id="div-lg" style="top:112px;left: 570px;display: block;background: url(pics[0].displayimg) no-repeat;background-position:50px 50px; ">
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
            pics:[],                 //保存服务器返回的图片
            i:1
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
            //console.log(this.pics)
            })
        },
        // 完成展示表的切换
        changeone(e){
            if(e.target.nodeName=="IMG"){
                var id = e.target.dataset.id;
                this.i = id;
            }
        }
    },
}
</script>
<style scoped>
@import url(../assets/css/order.css);
</style>

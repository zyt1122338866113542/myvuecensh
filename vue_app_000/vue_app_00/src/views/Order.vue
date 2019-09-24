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
                        <div id="div-lg" v-show="show"
                        
                        ></div>   
                    </div>
                    <div class="thumbanil fl">
                            <ul class="clearfix" id="sm">
                                <li v-for="(item,i) of pics[0]" :key="i" @click="changeone" >
                                    <img :src=" `http://127.0.0.1:8080/`+item.displayimg" alt=""
                                        :data-id="item.order_watch_id">
                                </li>
                            </ul>
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
                {order_watch_id:1,displayimg:""}
            ],                 //保存服务器返回的图片
            i:1,
            show:false,
            maskStyle:{left:0, top:-112},
            activeColor:'red'
            
        }
    },
   
    methods:{
        created() {
            this.loadMore();
        },
        loadMore(){
            // 1.创建url地址
            var url = "order";
            // 2.发送ajax请求
            this.axios.get(url).then(res=>{
                //console.log(res);
                this.pics = res.data.data; 
                console.log(this.pics)
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
        // computed:{
        //     gbPosition(){
        //     return `${-parseInt(this.maskStyle.left)*3/2}px ${-parseInt(this.maskStyle.top)*3/2}px`;
        //     }
        // },
        
    }
}
</script>
<style scoped>
@import url(../assets/css/order.css);
</style>

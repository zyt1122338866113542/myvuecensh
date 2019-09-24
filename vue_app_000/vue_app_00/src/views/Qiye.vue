<template>
  <div>
    <my-header></my-header>
    <div class="layoutcontainter">
      <div class="d-layout-one" style="width:100%;" v-for="(item,i) of pics" :key="i">
            <router-link to="">
              <img :src=" `http://127.0.0.1:8080/`+ item.img" alt="">
            </router-link> 
        </div>
    </div>
    <my-footer></my-footer>
  </div>
</template>
<script>
  export default {
    data(){
      return{
        pics:[]
      }
    },
    created() {
    this.loadMore();
    },
    methods:{
      loadMore(){
      // 1.创建url地址
      var url = "qiye";
      // 2.发送ajax请求
      this.axios.get(url).then(res=>{
        //console.log(res);
        this.pics = res.data.data; 
        console.log(this.pics[0])
      })
    },
    }
  }
</script>
<style scoped>
@import url(../assets/css/qiye.css);
</style>


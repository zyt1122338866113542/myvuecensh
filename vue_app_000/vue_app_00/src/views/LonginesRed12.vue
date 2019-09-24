<template>
  <div>
    <my-header></my-header>
    <div class="d-layout-one" style="width:100%;">
      <router-link to="">
        <video src="http://127.0.0.1:8080/image/detailslq/5c32f0883c4f2.mp4" id="video1" width="80%" height="100%" controls>
        </video>
      </router-link> 
    </div>
    <div class="layoutcontainter">
      <div class="d-layout-one" style="width:100%;" v-for="(item,i) of pics" :key="i">
            <router-link to="">
              <img :src=" `http://127.0.0.1:8080/`+ item.img" alt="">
            </router-link> 
        </div>
        <div class="d-layout-one" style="width:100%;">
            <router-link to="">
              <video src="http://127.0.0.1:8080/image/detailslq/5c32f0883c4f2.mp4" id="video1" width="80%" height="100%" controls>
                </video>
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
      var url = "longinesred12";
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


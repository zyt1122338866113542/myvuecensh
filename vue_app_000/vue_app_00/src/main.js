import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import MyHeader from './components/MyHeader'
import MyFooter from './components/MyFooter'
//引入所有的组件
import MintUi from "mint-ui"
//单引入mint-ui样式文件
import "mint-ui/lib/style.css"
//将mint-ui注册
Vue.use(MintUi)
import "./font/download/iconfont.css"

Vue.config.productionTip = false
axios.defaults.baseURL="http://localhost:8080";
Vue.prototype.axios=axios;
Vue.component("my-header",MyHeader);
Vue.component("my-footer",MyFooter);
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

//引入第三方模块
import Vuex from 'vuex'
//注册实例(先注册在创建存储对象)
Vue.use(Vuex)
//创建存储对象
var store = new Vuex.Store({
  state:{       //集中管理数据属性
    total:0,
    uname:''
  },
  mutations:{
    updateTotal(state,total){
      state.total += total;
    },
    updateTotalSub(state,total){
      if(state.total>=0) {
        state.total -= total;
      }
    },
    updateUname(state,uname){
      state.uname = uname;
    },
    clear(state){
      state.total = 0;
    }
  },
  actions:{
    //集中保存异步修改数据函数
    modifyCount:(context)=>{
      setTimeout(()=>{
        //异步调用mutations中的函数
        //完成异步修改数据
        context.commit("clear");
      },3000)
    }
  },
  getters:{    //集中获取数据函数
    getTotal(state){  //特殊：所有函数都有参数
      return state.total;
    },
    getUname(state){  //特殊：所有函数都有参数
      return state.uname;
    }
  }
})
//将存储对象添加vue实例作为属性
new Vue({
  router,
  render: h => h(App),
  store
}).$mount('#app')

import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/Index.vue'
import Login from './views/Login.vue'
import Order from './views/Order.vue'
import LonginesProduct from './views/LonginesProduct.vue'
import Qiye from './views/Qiye.vue'
import LonginesRed12 from './views/LonginesRed12.vue'
import Cart from './views/Cart.vue'
Vue.use(Router)
export default new Router({
  routes: [
    {path:"/",component:Index},
    {path:"/index",component:Index},
    {path:"/login",component:Login},
    {path:"/longinesproduct/:kw",component:LonginesProduct,props:true},
    {path:"/order/:lid",component:Order,props:true},
    {path:"/qiye",component:Qiye},
    {path:"/longinesred12",component:LonginesRed12},
    {path:"/cart",component:Cart},
  ]
})

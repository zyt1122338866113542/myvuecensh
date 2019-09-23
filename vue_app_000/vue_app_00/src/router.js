import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/Index.vue'
import Login from './views/Login.vue'
import Order from './views/Order.vue'
import LonginesProduct from './views/LonginesProduct.vue'
Vue.use(Router)
export default new Router({
  routes: [
    {path:"/",component:Index},
    {path:"/index",component:Index},
    {path:"/login",component:Login},
    {path:"/longinesproduct",component:LonginesProduct},
    {path:"/order",component:Order},
  ]
})

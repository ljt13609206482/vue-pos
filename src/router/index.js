import Vue from 'vue'
import Router from 'vue-router'
//引入组件
import Pos from '@/components/page/Pos'
import Product from '@/components/page/Product'
import Member from '@/components/page/member'
import Count from '@/components/page/count' 
import Setting from '@/components/page/setting'

Vue.use(Router)


//设置路由
export default new Router({
  routes: [
    {
      path: '/',
      name: 'Pos',
      component: Pos
    },
    {
      path:'/product',
      name:'product',
      component:Product
    },
    {
      path:'member',
      name:'member',
      component:Member
    },
    {
      path:'/count',
      name:'member',
      component:Member
    },
    {
      path:'/setting',
      name:'setting',
      component:Setting
    }
  ]
})

import Vue from 'vue'
import Router from 'vue-router'
//引入组件
import Pos from '@/components/page/Pos'

Vue.use(Router)


//设置路由
export default new Router({
  routes: [
    {
      path: '/',
      name: 'Pos',
      component: Pos
    }
  ]
})

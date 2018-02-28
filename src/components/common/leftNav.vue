<template>
  <div class="left-nav">
      <ul>
          <li>
              <router-link to="/">
                <i class="icon iconfont icon-goumai"></i>
                <div>收银</div>
              </router-link>
          </li>
          <li>
              <router-link to="/product">
                <i class="icon iconfont icon-hanbao"></i>
                <div>商品</div>
              </router-link>
          </li>
          <li>
              <router-link to="/member">
                <i class="icon iconfont icon-huiyuanqia"></i>
                <div>会员</div>
              </router-link>
          </li>
          <li>
              <router-link to="/count">
                <i class="icon iconfont icon-shuru"></i>
                <div>统计</div>
              </router-link>
          </li>
          <li>
              <router-link to="/setting">
                <i class="icon iconfont icon-gongnengjianyi"></i>
                <div>设置</div>
              </router-link>
          </li>
      </ul>
  </div>
</template>
<script>
   export default{

   } 
</script>
<style>
    .left-nav{
       color:#1d8ce0;
       font-size:10px;
       height:100%;
       background-color: #ffffff;
       float:left;
       width:5%;
    }
    .left-nav a{
        color: #1d8ce0;
        text-decoration:none;
    }
    .left-nav li i{
        width: 50px;
        height: 50px;
       font-size:24px;
    }
    .left-nav ul{
        padding:0px;
        margin: 0px;
    }
    .left-nav li{
        list-style: none;
        text-align: center;
        border-bottom:1px solid #20a0ff;
        padding:10px;
    }
</style>

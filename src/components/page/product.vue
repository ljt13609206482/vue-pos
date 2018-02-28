<template>
  <div class="product">
    <div class="title">
      <h1>商品管理</h1>
    </div>
    <div class="product-list">
      <el-tabs type="card">
        <el-tab-pane label="汉堡">
          <el-table :data="hamburgers" border style="width:100%">
            <el-table-column prop="goodsId" label="商品编号"></el-table-column>
            <el-table-column prop="goodsName" label="商品名称"></el-table-column>
            <el-table-column prop="price" label="商品价格(元)"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                <el-button type="text" size="small" @click="updateProduct">更新</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div class="product-btn">
            <router-link to="/addProduct">
              <el-button type="success">添加商品</el-button>
            </router-link>
          </div>
        </el-tab-pane>
        <el-tab-pane label="小食">
          <el-table :data="snacks" border style="width:100%">
            <el-table-column prop="goodsId" label="商品编号"></el-table-column>
            <el-table-column prop="goodsName" label="商品名称"></el-table-column>
            <el-table-column prop="price" label="商品价格(元)"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                <el-button type="text" size="small" @click="updateProduct">更新</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div class="product-btn">
            <el-button type="success">添加商品</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="饮料">
          <el-table :data="drinks" border style="width:100%">
            <el-table-column prop="goodsId" label="商品编号"></el-table-column>
            <el-table-column prop="goodsName" label="商品名称"></el-table-column>
            <el-table-column prop="price" label="商品价格(元)"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                <el-button type="text" size="small" @click="updateProduct">更新</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div class="product-btn">
            <el-button type="success">添加商品</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="套餐">
          <el-table :data="packages" border style="width:100%">
            <el-table-column prop="goodsId" label="商品编号"></el-table-column>
            <el-table-column prop="goodsName" label="商品名称"></el-table-column>
            <el-table-column prop="price" label="商品价格(元)"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                <el-button type="text" size="small" @click="updateProduct">更新</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div class="product-btn">
            <el-button type="success">添加商品</el-button>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
    <router-view></router-view>
  </div>
</template>
<script>
import axios from 'axios'
    export default{
      data(){
        return {
          hamburgers:[],
          snacks:[],
          drinks:[],
          packages:[]
        }
      },
      created:function(){
        //请求分类商品数据
        axios
          .get("http://jspang.com/DemoApi/typeGoods.php")
          //请求成功后对返回数据进行操作
          .then(response => {
            //console.log(response)
            this.hamburgers = response.data[0];
            this.snacks = response.data[1];
            this.drinks = response.data[2];
            this.packages = response.data[3];
          })
          //请求失败后的处理函数
          .catch(error => {
            alert("网络错误！无法访问！");
          });
      },
      methods:{
        //根据传入的商品信息，从商品列表中删除对应商品
        deleteGoods:function(good){
          //console.log(good.goodsId)
          if(good.goodsId<=3){
            this.hamburgers=this.hamburgers.filter(o=>o.goodsId!=good.goodsId);
          }
          if(3<good.goodsId<=6){
            this.snacks=this.snacks.filter(o=>o.goodsId!=good.goodsId);
          }
          if(6<good.goodsId<=8){
              this.drinks=this.drinks.filter(o=>o.goodsId!=good.goodsId);
          }
          if(6<good.goodsId<=8){
              this.packages=this.packages.filter(o=>o.goodsId!=good.goodsId);
          }
        },
        updateProduct:function(){
          this.$router.push('/updateProduct')
        }  
      }
    }
</script>
<style>
  .product-btn{
    float: right;
    margin-top: 20px;
    margin-right: 50px;
  }
</style>


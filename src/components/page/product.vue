<template>
  <div class="product">
    <div class="title">
      <h1>商品管理</h1>
    </div>
    <el-col :span="14">
      <div class="product-list">
        <el-tabs type="card">
          <el-tab-pane label="汉堡">
            <el-table :data="hamburgers" border style="width:100%">
              <el-table-column prop="pid" label="商品编号"></el-table-column>
              <el-table-column prop="product_name" label="商品名称"></el-table-column>
              <el-table-column prop="price" label="商品价格(元)"></el-table-column>
              <el-table-column label="操作">
                <template slot-scope="scope">
                  <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                  <el-button type="text" size="small" @click="updateProduct(scope.row)">更新</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <el-tab-pane label="小食">
            <el-table :data="snacks" border style="width:100%">
              <el-table-column prop="pid" label="商品编号"></el-table-column>
              <el-table-column prop="product_name" label="商品名称"></el-table-column>
              <el-table-column prop="price" label="商品价格(元)"></el-table-column>
              <el-table-column label="操作">
                <template slot-scope="scope">
                  <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                  <el-button type="text" size="small" @click="updateProduct(scope.row)">更新</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <el-tab-pane label="饮料">
            <el-table :data="drinks" border style="width:100%">
              <el-table-column prop="pid" label="商品编号"></el-table-column>
              <el-table-column prop="product_name" label="商品名称"></el-table-column>
              <el-table-column prop="price" label="商品价格(元)"></el-table-column>
              <el-table-column label="操作">
                <template slot-scope="scope">
                  <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                  <el-button type="text" size="small" @click="updateProduct(scope.row)">更新</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <el-tab-pane label="套餐">
            <el-table :data="packages" border style="width:100%">
              <el-table-column prop="pid" label="商品编号"></el-table-column>
              <el-table-column prop="product_name" label="商品名称"></el-table-column>
              <el-table-column prop="price" label="商品价格(元)"></el-table-column>
              <el-table-column label="操作">
                <template slot-scope="scope">
                  <el-button type="text" size="small" @click="deleteGoods(scope.row)">删除</el-button>
                  <el-button type="text" size="small" @click="updateProduct(scope.row)">更新</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
        </el-tabs>
      </div>
    </el-col>
    <!-- 父组件嗲用子组件是，定义一个自定义事件函数 -->
    <el-col :span="10">
      <AddProduct @childrenMsg="addToList" :updateGood="updateGood"></AddProduct>
    </el-col>
  </div>
</template>
<script>
import AddProduct from '@/components/page/addProduct'
import axios from 'axios'
    export default{
      name:'addProduct',
      components:{
        AddProduct
      },
      data(){
        return {
          hamburgers:[],
          snacks:[],
          drinks:[],
          packages:[],
          updateGood:""
        }
      },
      created:function(){
        //请求分类商品数据
        axios
          .get("http://127.0.0.1:8081/xiangmu/vuePosData/product/productList.php")
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
          //获取url传递的参数
          console.log(this.$router.params)
      },
      methods:{
        //根据传入的商品信息，从商品列表中删除对应商品
        deleteGoods:function(good){
          console.log(good)
          if(good.family_id==1){
            this.hamburgers=this.hamburgers.filter(o=>o.pid!=good.pid);
          }
          if(good.family_id==2){
            this.snacks=this.snacks.filter(o=>o.pid!=good.pid);
          }
          if(good.family_id==3){
              this.drinks=this.drinks.filter(o=>o.pid!=good.pid);
          }
          if(good.family_id==4){
              this.packages=this.packages.filter(o=>o.pid!=good.pid);
          }
        },
        updateProduct:function(product){
            this.updateGood=product;
            console.log(this.updateGood)

        },
        //通过事件触发获取子组件传递的参数
        addToList:function(data){
          let url='http://127.0.0.1:8081/xiangmu/vuePosData/product/addProduct.php';
          url+='?family_id='+data.goodType+'&product_name='+data.goodName+'&price='+data.price+'&pic=""';
          axios.get(url
            ).then((response)=>{
              if(response.data.status==1){
                this.$message({
                  message:'商品更新成功！',
                  type:'success'
                })
                window.location.reload();
              }else{
                this.$message({
                  message:'商品更新失败！',
                  type:'danger'
                })
              }
          }).catch((err)=>{
            alert("网络错误！无法访问！");
          })
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


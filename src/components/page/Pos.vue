<template>
  <div class="pos">
    <!-- 24栏布局 -->
    <el-row>
      <!-- 导航栏 -->
      <el-col :span="7" class="pos-order" id="order-list">
        <el-tabs type="card">
          <el-tab-pane label=" 点 餐 ">
            <el-table :data="tableData" border style="width:100%">
              <el-table-column prop="product_name" label="商品名称"></el-table-column>
              <el-table-column prop="count" label="数量" width="50px;"></el-table-column>
              <el-table-column prop="price" label="金额" width="70px;"></el-table-column>
              <el-table-column label="操作" width="100" fixed="right">
                  <template slot-scope="scope">
                    <el-button type="text" size="small" @click="delSingleGoods(scope.row)">删除</el-button>
                    <el-button type="text" size="small" @click="addOrderList(scope.row)">增加</el-button>
                  </template>
              </el-table-column>
            </el-table>
            <div class="total-box">
              数量：
              <span>{{totalCount}}</span>
              金额：
              <span>￥{{totalMoney}}</span>
            </div>
            <div class="div-btn">
              <el-button type="warning">挂单</el-button>
              <el-button type="danger" @click="delAllGoods">删除</el-button>
              <el-button type="success" @click="checkOut">结账</el-button> 
            </div>
          </el-tab-pane>
          <el-tab-pane label=" 挂 单 ">
            挂单
          </el-tab-pane>
          <el-tab-pane label=" 外 卖 ">
            外卖
          </el-tab-pane>
        </el-tabs>
      </el-col>
      <!-- 商品栏 -->
      <el-col :span="17">
        <div class="popular-goods">
          <div class="title">常用商品</div>
          <div class="popular-goods-list">
            <ul>
              <li v-for="good of popularGoods" @click="addOrderList(good)">
                <span>{{good.product_name}}</span>
                <span class="p-price">￥{{good.price}}</span>
              </li>
            </ul>
          </div>
        </div>

        <div class="goods-type">
          <el-tabs type="border-card">
            <el-tab-pane label="汉堡">
              <div>
                <ul class="food-list">
                  <li v-for="hamburger of hamburgers" @click="addOrderList(hamburger)">
                    <span class="food-img">
                      <img :src="'static/'+hamburger.pic" width="100%">
                    </span>
                    <span class="food-name">{{hamburger.product_name}}</span>
                    <span class="food-price">￥{{hamburger.price}}元</span>
                  </li>
                </ul>
              </div>
            </el-tab-pane>
            <el-tab-pane label="小食">
              <ul class="food-list">
                  <li v-for="snack of snacks" @click="addOrderList(snack)">
                    <span class="food-img">
                      <img :src="'static/'+snack.pic" width="100%">
                    </span>
                    <span class="food-name">{{snack.product_name}}</span>
                    <span class="food-price">￥{{snack.price}}元</span>
                  </li>
                </ul>
            </el-tab-pane>
            <el-tab-pane label="饮料">
              <ul class="food-list">
                <li v-for="drink of drinks" @click="addOrderList(drink)">
                  <span class="food-img">
                    <img :src="'static/'+drink.pic" width="100%">
                  </span>
                  <span class="food-name">{{drink.product_name}}</span>
                  <span class="food-price">￥{{drink.price}}元</span>
                </li>
              </ul>
            </el-tab-pane>
            <el-tab-pane label="套餐">
              <ul class="food-list">
                <li v-for="p of packages" @click="addOrderList(p)">
                  <span class="food-img">
                    <img :src="'static/'+p.pic" width="100%">
                  </span>
                  <span class="food-name">{{p.product_name}}</span>
                  <span class="food-price">￥{{p.price}}元</span>
                </li>
              </ul>
            </el-tab-pane>
          </el-tabs>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
//引入axios远程获取数据
import axios from "axios";
export default {
  name: "pos",
  //初始化数据
  data() {
    return {
      tableData: [],
      popularGoods: [],
      hamburgers: [],
      snacks: [],
      drinks: [],
      packages: [],
      totalCount: 0,
      totalMoney: 0
    };
  },
  //组建创建后，从远程获取数据
  created: function() {
    //请求热销商品数据
    axios
      .get("http://localhost:8081/xiangmu/vuePosData/product/hotProduct.php")
      //请求成功后对返回数据进行操作
      .then(response => {
        console.log(response)
        this.popularGoods = response.data;
      })
      //请求失败后的处理函数
      .catch(error => {
        alert("网络错误！无法访问！");
      });
    //请求分类商品数据
    axios
      .get("http://127.0.0.1:8081/xiangmu/vuePosData/product/productList.php")
      //请求成功后对返回数据进行操作
      .then(response => {
        //console.log(response.data)
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
  mounted: function() {
    //获取显示区域高度
    var orderHeight = document.body.clientHeight;
    document.getElementById("order-list").style.height = orderHeight + "px";
  },
  methods: {
    //向订单中添加商品方法
    addOrderList(good) {
      //判断商品是否已经存在
      //console.log(good);
      let isHave = false;
      for (let i = 0; i < this.tableData.length; i++) {
        //console.log(this.tableData[i].goodsId);
        if (this.tableData[i].pid == good.pid) {
          isHave = true; //存在
        }
      }
      if (isHave) {
        //存在就进行数量添加
        let arr = this.tableData.filter(o => o.pid == good.pid);
        arr[0].count++;
      } else {
        //不存在就压入数组
        let newGood = {
          pid: good.pid,
          product_name: good.product_name,
          price: good.price,
          count: 1
        };
        this.tableData.push(newGood);
      }
      this.getCount(good);
    },
    //汇总商品的数量和金额的方法
    getCount() {
      this.totalCount = 0;
      this.totalMoney = 0;
      //汇总数量和金额
      if (this.tableData) {
        this.tableData.forEach(element => {
          this.totalCount += element.count;
          this.totalMoney += element.price * element.count;
        });
      }
    },
    //删除单个商品
    delSingleGoods(good) {
      //是要破那个过滤器筛选出除要删除的尚品以外的其它商品，重新赋值给商品数组
      this.tableData = this.tableData.filter(o => o.pid != good.pid);
      this.getCount(good);
    },
    delAllGoods(){
      this.tableData=[];
      this.totalCount=0;
      this.totalMoney=0;
    },
    //结账方法
    checkOut(){
      if(this.totalCount!=0){
        this.tableData=[];
        this.totalCount=0;
        this.totalMoney=0;
        this.$message({
          message:'结账成功！',
          type:'success'
        })
      }else{
        this.$message.error('暂无订单需要结账')
      }
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.pos-order {
  background-color: #f9fcfa;
  border-right: 1px solid #c0ccda;
}
.div-btn {
  margin-top: 10px;
}
.tabs {
  width: 372px;
}
.title {
  height: 20px;
  border-bottom: 1px solid #d3dce6;
  background-color: #f9fcfa;
  padding: 10px;
  text-align: left;
}
.popular-goods {
  height: auto;
  overflow: hidden;
  margin-bottom:20px; 
}
.popular-goods-list ul li {
  list-style: none;
  float: left;
  border: 1px solid #1d8ce0;
  border-radius: 5px;
  padding: 10px;
  margin-left: 15px;
  margin-top: 10px;
  background-color: #ffffff;
  cursor: pointer;
}
.p-price {
  color: #1d8ce0;
}
/* 清除上面元素浮动影响 */
.goods-type {
  clear: both;
}
.food-list li {
  list-style: none;
  width: 26%;
  border: 1px solid #1d8ce0;
  border-radius: 5px;
  height: auto;
  overflow: hidden;
  background-color: #ffffff;
  padding: 2px;
  float: left;
  margin: 5px;
  cursor: pointer;
}
.food-list li span {
  display: block;
  float: left;
}
.food-img {
  width: 40%;
}
.food-name {
  font-size: 15px;
  padding-left: 8px;
  color: #900;
}
.food-price {
  font-size: 16px;
  padding-left: 10px;
  padding-top: 10px;
}
.total-box {
  background-color: #ffffff;
  padding: 10px;
  border-bottom: #d3dce6;
}
</style>

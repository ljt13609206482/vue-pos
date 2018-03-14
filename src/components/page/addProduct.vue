<template>
  <div class="add-product">
      <div class="add-title">
          <h2>新增商品</h2>
      </div>
      <div class="add-product-info">
        <p>
            <span class="input-title">新增商品类型</span>
            <el-select v-model="goodType" placeholder="请选择">
                <el-option v-for="item in options":key="item.value"
                    :label="item.label" :value="item.value">
                </el-option>
            </el-select>
        </p>
        <p>
            <span class="input-title">商品名称</span>
            <el-input v-model="goodName" placeholder="请输入商品名称" style="width:200px"></el-input>
        </p>
        <p>
            <span class="input-title">商品价格</span>
            <el-input v-model="price" placeholder="请输入商品名称" style="width:200px"></el-input>
        </p>
        <p>
            <span class="input-title">商品图片</span>
            <input type="file">
        </p>
        <p class="add-btn">
            <el-button type="success" @click="addToProductList">新增</el-button>
        </p>
      </div>
  </div>

</template>
<script>
    export default{
        data() {
        return {
            options: [
                {value: '1',label: '汉堡'},
                {value: '2',label: '小食'}, 
                {value: '3',label: '饮料'}, 
                {value: '4',label: '套餐'}
                ],
                goodType:'',
                goodName:'',
                price:0
                
            }
        },
        created:function(){
            console.log(this.$route.params.paramName)
        },
        methods:{
            addToProductList:function(){
                //获取商品数据，并封装成一个商品对象
                var newGood={
                    goodType:this.goodType,
                    goodName:this.goodName,
                    price:this.price
                };
                this.$emit('childrenMsg',newGood)
            }
        }       
    }
</script>
<style>
    .add-product{
        background: #ffffff;
        margin:40px auto ;
        border: 1px solid #c0ccda;
        height: auto;
    }
    .add-product-info{
        width:80%;
        text-align: left;
        margin: 0 auto; 
    }
    .input-title{
        display: inline-block;
        padding: 10px;
    }
    .add-btn{
        position: relative;
        left: 300px;
    }
</style>


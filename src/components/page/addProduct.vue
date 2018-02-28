<template>
  <div class="add-product">
      <div class="add-title">
          <h2>新增商品</h2>
      </div>
      <div class="add-product-info">
            <p class="float-lf">
                <span class="input-title">新增商品类型</span>
                <el-select v-model="value" placeholder="请选择">
                    <el-option v-for="item in options":key="item.value"
                        :label="item.label" :value="item.value">
                    </el-option>
                </el-select>
                <span class="input-title">商品名称</span>
                <el-input v-model="input" placeholder="请输入商品名称" style="width:200px"></el-input>
            </p>
            <p class="float-lf">
                <span class="input-title">商品价格</span>
                <el-input v-model="input" placeholder="请输入商品名称" style="width:200px"></el-input>
               <span class="input-title">商品图片</span>
               <input type="file">
            </p>
            <p class="add-btn">
                <el-button type="success">新增</el-button>
            </p>
      </div>
  </div>

</template>
<script>
    export default{
        data() {
        return {
            options: [
                {value: '选项1',label: '汉堡'},
                {value: '选项2',label: '小食'}, 
                {value: '选项3',label: '饮料'}, 
                {value: '选项4',label: '套餐'}
                ],
                value:'',
                input:''
                
            }
        },
        methods:{
            
        }       
    }
</script>
<style>
    .add-product{
        width: 700px;
        background: #ffffff;
        margin:-50px auto ;
        border: 1px solid #c0ccda;
        height: 270px;
    }
    .float-lf{
        float: left;
        margin-left: 20px;
    }
    .input-title{
        display: inline-block;
        padding: 10px;
    }
</style>


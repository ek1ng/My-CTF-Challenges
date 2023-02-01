<template>
  <div>
    <el-row>
      <el-col :span="24"><Header/></el-col>
    </el-row>
    <el-row>
      <el-col :span="12"><ProductList/></el-col>
      <el-col :span="12"><InventorySum/></el-col>
    </el-row>
  </div>
</template>

<script>
// @ is an alias to /src
import Header from "@/components/ShopHeader.vue";
import ProductList from "@/components/ProductList.vue";
import InventorySum from "@/components/InventorySum.vue";

export default {
  name: "ShopView",
  components: {
    Header,
    ProductList,
    InventorySum,
  },
};
</script>

<style>
.el-row {
  margin-bottom: 20px;
}
.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
</style>
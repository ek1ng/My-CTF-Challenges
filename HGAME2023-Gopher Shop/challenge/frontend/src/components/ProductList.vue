<template>
  <el-row>
    <el-col
      v-for="(product, index) in productList"
      :key="product.ID"
      :span="8"
      :offset="index >= 0 ? 2 : 0"
    >
      <el-card :body-style="{ padding: '0px' }">
        <div style="padding: 14px">
          <span>{{ product.Name }}</span>
          <div class="bottom">
            <span>{{ product.Price }}</span>
            <el-button @click="purchase(product.Name)" plain
              >Purchase</el-button
            >
          </div>
        </div>
      </el-card>
    </el-col>
  </el-row>
</template>

<script>
import axios from "axios";
import { ElMessage, ElMessageBox } from "element-plus";

export default {
  data() {
    return {
      "productList": [],
    };
  },
  methods: {
    getProductList() {
      axios
        .get("/api/v1/product/list")
        .then((res) => {
          this.productList = res.data.productList;
        })
        .catch(() => {
          ElMessage({
            type: "error",
            message: "Failed to get product list",
          });
        });
    },
    purchase(product) {
      ElMessageBox.prompt("Please enter the purchase quantity", "Purchase", {
        confirmButtonText: "OK",
        cancelButtonText: "Cancel",
        inputPattern: /^\d+$/,
        inputErrorMessage: "Invalid Number",
      })
        .then(({ value }) => {
          axios
            .get("/api/v1/user/buyProduct", {
              params: {
                product: product,
                number: value,
              },
            })
            .then(() => {
              ElMessage({
                type: "success",
                message: `Purchase ${product} * ${value} successfully`,
              });
            })
            .catch(() => {
              ElMessage({
                type: "error",
                message: "Purchase failed",
              });
            });
        })
        .catch(() => {
          ElMessage({
            type: "info",
            message: "Input canceled",
          });
        });
    },
  },
  mounted() {
    this.getProductList();
  },
};
</script>

<style>
.bottom {
  margin-top: 13px;
  line-height: 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.button {
  padding: 0;
  min-height: auto;
}

.el-col {
  margin-bottom: 28px;
}
</style>

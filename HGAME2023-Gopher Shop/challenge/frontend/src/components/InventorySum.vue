<template>
  <div>
    <el-table :data="orderSum" border>
      <el-table-column prop="name" label="Product"></el-table-column>
      <el-table-column prop="quantity" label="Number"></el-table-column>
      <el-table-column label="Operations" width="120">
        <template #default="scope">
          <el-button
            size="small"
            link
            type="danger"
            @click="sellProduct(scope.row)"
            >Sell</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>



<script>
import axios from "axios";
import { ElMessage, ElMessageBox } from "element-plus";

export default {
  data() {
    return {
      orderSum: [],
    };
  },
  mounted() {
    this.getOrderSum();
    this.intervalId = setInterval(this.getOrderSum, 1000);
  },
  beforeUnmount() {
    clearInterval(this.intervalId);
  },
  methods: {
    getOrderSum() {
      axios
        .get("/api/v1/user/getOrderSum")
        .then((res) => {
          this.orderSum = Object.entries(res.data["orderSum"]).map(
            ([name, quantity]) => ({ name, quantity })
          );
        })
        .catch(() => {
          ElMessage({
            type: "error",
            message: "Get orderSum failed",
          });
        });
    },
    sellProduct(row) {
      ElMessageBox.prompt("Please enter the sell quantity", "Sell", {
        confirmButtonText: "OK",
        cancelButtonText: "Cancel",
        inputPattern: /^\d+$/,
        inputErrorMessage: "Invalid Number",
      })
        .then(({ value }) => {
          axios
            .get("/api/v1/user/sellProduct", {
              params: {
                product: row.name,
                number: value,
              },
            })
            .then(() => {
              ElMessage({
                type: "success",
                message: `Sell ${row.name} * ${value} successfully`,
              });
            })
            .catch(() => {
              ElMessage({
                type: "error",
                message: "Sell failed",
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
};
</script>

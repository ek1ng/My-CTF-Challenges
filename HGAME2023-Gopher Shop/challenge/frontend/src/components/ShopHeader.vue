<template>
  <div>
    <!-- <el-page-header @back="onBack()">
      <template #content> -->
   
        <div class="header">
          <div class="title">
            <el-image
            class="mr-3"
            style="height: 54px"
            src="https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301221444991.png"
          />
            <span style="font-size:56px;font-weight: 600;color: #303133"> Gopher Shop </span>
            <el-image
            class="mr-3"
            style="height: 54px"
            src="https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301221444991.png"
          />
        </div>

      <!-- </template>
      <template #extra> -->
        <div class="info">
          <el-descriptions :column="3" :size="large" border>
            <template #extra>
              <el-button type="info" plain @click="sleep()">Sleep</el-button>
              <!-- Vidar蓝！ -->
              <el-button type="primary" plain color="#009FE9" @click="buyInventory()">Buy Inventory</el-button>
              <el-button type="danger" plain @click="checkFlag()">Check Flag</el-button>
            </template>
            <el-descriptions-item label="Vidar Coin" align="center">{{
              this.balance
            }}</el-descriptions-item>
            <el-descriptions-item label="Days" align="center">{{
              this.days
            }}</el-descriptions-item>
            <el-descriptions-item label="Inventory" align="center">{{
              this.inventory
            }}</el-descriptions-item>
          </el-descriptions>
        </div>
      </div>
      <!-- </template>
    </el-page-header> -->
  </div>
</template>

<style scoped>
.el-descriptions {
  margin-right: 30px;
}

.title {
    display: flex;
    align-items: center;
    position: relative;
    margin-left: 30px;
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  line-height: 24px;
}

.info {
  display: flex;
  align-items: center;
  justify-content: space-between;
  line-height: 24px;
}
</style>

<script>
import axios from "axios";
import { ElMessage, ElNotification} from "element-plus";

export default {
  name: "ShopHeader",
  data() {
    return {
      balance: 0,
      days: 0,
      inventory: 0,
      intervalId: null,
    };
  },
  mounted() {
    this.getUserInfo();
    this.intervalId = setInterval(this.getUserInfo, 1000);
  },
  beforeUnmount() {
    clearInterval(this.intervalId);
  },
  methods: {
    getUserInfo() {
      axios
        .get("/api/v1/user/info")
        .then((res) => {
          this.balance = res.data.balance;
          if (res.data.message && res.data.message.includes("no days left")) {
            ElNotification({
              title: "Error",
              message: res.data.message,
              type: "error",
            });
            this.$router.push("/");
          }
          this.days = res.data.days;
          this.inventory = res.data.inventory;
        })
        .catch(() => {
          ElMessage({
            type: "error",
            message: "Get User Info Failed!",
          });
        });
    },
    buyInventory() {
      axios
      .get("/api/v1/user/buyInventory")
      .then(() => {
        ElMessage({
          type: "success",
          message: "Buy Inventory Successfully!",
        });
      }).catch(()=>{
        ElMessage({
          type: "error",
          message: "Buy Inventory Failed!",
        });
      })
    },
    sleep() {
      axios
      .get("/api/v1/user/tanking")
      .then(() => {
        ElMessage({
          type: "success",
          message: "Sleep Successfully!",
        });
      }).catch(()=>{
        ElMessage({
          type: "error",
          message: "Sleep Failed!",
        });
      })
    },
    checkFlag() {
      axios
      .get("/api/v1/user/checkFlag")
      .then((res) => {
        ElMessage({
          type: "success",
          message: res.data.message,
        });
      }).catch(()=>{
        ElMessage({
          type: "error",
          message: "U have no Flag!",
        });
      })
    },
    onBack() {
      this.$router.push("/");
    },
  },
};
</script>

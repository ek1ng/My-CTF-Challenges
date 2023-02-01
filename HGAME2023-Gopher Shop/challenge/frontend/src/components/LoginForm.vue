<template>
  <div class="login-container">
    <div class="form-container">
      <div class="title-bar">
        <h1 class="title" style="text-align:center">Gopher Shop</h1>
      </div>
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="Username">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item label="Password">
          <el-input v-model="form.password" type="password"></el-input>
        </el-form-item>
        <template v-if="!isSignUp">
          <el-form-item>
            <el-button @click="switchToSignUp">To Register</el-button>
            <el-button
              class="el-button--primary"
              type="primary"
              @click="submitForm"
              >Login</el-button
            >
          </el-form-item>
        </template>
        <template v-else>
          <el-form-item>
            <el-button @click="switchToSignUp">Back to Login</el-button>
            <el-button
              class="el-button--primary"
              type="primary"
              @click="submitForm"
              >Register</el-button
            >
          </el-form-item>
        </template>
      </el-form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { ElNotification } from "element-plus";
export default {
  data() {
    return {
      form: {
        username: "",
        password: "",
      },
      isSignUp: false,
    };
  },
  methods: {
    submitForm() {
      if (this.isSignUp) {
        // 执行注册操作
        axios
          .post("/api/v1/auth/register", this.form)
          .then(() => {
            ElNotification({
              title: "Success",
              message: "Register successfully",
              type: "success",
            });
            this.isSignUp = false;
          })
          .catch((err) => {
            ElNotification({
              title: "Error",
              message: "Register failed:" + err,
              type: "error",
            });
          });
      } else {
        // 执行登录操作
        axios
          .post("/api/v1/auth/login", this.form)
          .then(() => {
            // 登录成功
            ElNotification({
              title: "Success",
              message: "Login successfully",
              type: "success",
            });
            this.$router.push("/shop");
          })
          .catch((err) => {
            ElNotification({
              title: "Error",
              message: "Login failed:" + err,
              type: "error",
            });
          });
      }
    },
    switchToSignUp() {
      this.isSignUp = !this.isSignUp;
    },
  },
};
</script>
<style scoped>
.login-container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

.form-container {
  width: 300px;
  padding: 20px;
  background-color: #f5f7fa;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.el-form-item__label {
  font-size: 14px;
  color: #606266;
}

.el-form-item__content {
  margin-top: 10px;
}

.el-button--primary {
  background-color: #409eff;
  border-color: #409eff;
  color: #fff;
}
</style>

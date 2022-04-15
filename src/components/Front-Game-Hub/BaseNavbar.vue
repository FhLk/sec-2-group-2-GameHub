<script setup>
import GameLogo from "/images/gamecontroller.png";
import Profile from "/images/profile.png";
import Leaderboard from "/images/leaderBoard.png";
import { ref } from "vue";
const isLogin = ref(false);

const checkLogin = () => {
  if (localStorage.getItem("userId") == null) {
    isLogin.value = false;
  } else {
    isLogin.value = true;
  }
};

const logout = () => {
  localStorage.removeItem("userDisplay");
  localStorage.removeItem("userId");
  localStorage.removeItem("user");
  window.location.href = '/';
}
checkLogin();
</script>
 
<template>
  <div class="navbar">
    <div class="nav">
      <div class="nav-left">
        <router-link to="/">
          <img :src="GameLogo" alt="" class="gamelogo" />
        </router-link>
        <!-- <input type="search" class="search" placeholder="Search Games" /> -->
      </div>
      <div class="nav-right">
              <router-link to="/leaderboard">
          <img :src="Leaderboard" alt="" class="profile nav-right-item"  />
        </router-link>
        <router-link to="/register">
          <button
            class="register-button nav-right-item"
            v-if="isLogin == false"
          >
            Register
          </button></router-link
        >
        <router-link to="/login">
          <button class="login-button nav-right-item" v-if="isLogin == false">
            Login
          </button>
        </router-link>

        <router-link to="/profile">
          <img :src="Profile" alt="" class="profile nav-right-item" v-if="isLogin == true" />
        </router-link>

        <!-- ทำให้ logout ได้ (clear session) -->
        <button class="register-button nav-right-item" v-if="isLogin == true" @click="logout">
          Logout
        </button>
      </div>
    </div>
  </div>
</template>
 
<style scoped>
.nav {
  display: flex;
  justify-content: space-between;
  margin-left: 5%;
  margin-right: 5%;
  height: 90px;
}
.gamelogo {
  width: 150px;
  height: 100px;
}
.profile {
  width: 50px;
  height: 50px;
}
.nav-left {
  display: flex;
  justify-content: center;
  align-items: center;
}
.nav-right {
  display: flex;
  justify-content: center;
  align-items: center;
}
.register-button {
  background-color: #b51010;
  color: #f3f3f3;
  width: 75px;
  height: 40px;
  border: 2px solid white;
}
.login-button {
  background-color: #f3f3f3;
  color: #b51010;
  width: 75px;
  height: 40px;
  border: 1px solid white;
}
.search {
  width: 300px;
  height: 35px;
}
.nav-right-item {
  margin-right: 30px;
}
</style>
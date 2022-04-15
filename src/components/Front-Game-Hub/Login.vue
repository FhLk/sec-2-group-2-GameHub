<script setup>
import { ref } from "vue";
const username = ref("");
const password = ref("");
let dataFetch = [];
let getIdOfUser = 0;

const getProfile = () => {
  fetch("http://localhost:9000/profile", {
    method: "GET",
  })
    .then((res) => res.json())
    .then((data) => {
      dataFetch = data;
    });
};
getProfile();
const checkIsOnline = () => {
    if (localStorage.getItem("userId") !== null) {
       window.location.href="/";
    }
}
checkIsOnline();

const login = () => {
  dataFetch.forEach((element) => {
    if (element.user == username.value && element.password == password.value) {
      getIdOfUser = element.id;
      localStorage.setItem("userId", getIdOfUser);
      localStorage.setItem("user", element.user);
      localStorage.setItem("userDisplay", element.displayname);
      console.log("You are logged in.");
      window.location.href = "/";
    }
  });
};
</script>
 
<template>
  <div class="body">
    <div class="register-div">
      <h1 class="register-text">Login GameHub</h1>
      <div>
        <div class="crop-text-text-field">
          <div class="text-text-field">
            <div class="text-field">
              <h3>Username</h3>
              <input type="text" class="text-box" v-model="username" />
            </div>
            <div class="text-field">
              <h3>Password</h3>
              <input type="password" class="text-box" v-model="password" />
            </div>
          </div>
          
        </div>
        
        <div class="center">
        <p>Not our user? <router-link to="/#/register"> just register </router-link> </p>
        </div>
        <div class="register-button-div">
          <button class="register-button" @click="login">Login</button>
        </div>
      </div>
    </div>
  </div>
</template>
 
<style scoped>
.body {
  background-color: #f1f1f1;
  padding-bottom: 40vh;
  font-family: 'Poppins', sans-serif;
}
.text-field {
  display: flex;
  justify-content: space-between;
  margin-top: 1rem;
}
.text-field h3 {
  font-size: 16px;
}
.crop-text-text-field {
  display: flex;
  justify-content: center;
}
.text-text-field {
  width: 300px;
}
.text-box {
  width: 150px;
  height: 40px;
}
.register-button {
  background-color: #b51010;
  color: #f3f3f3;
  width: 100px;
  height: 60px;
  border: 1px solid white;
  border-radius: 5px;
  font-family: 'Poppins', sans-serif;
  cursor: pointer;
}
.register-button-div {
  margin-top: 2rem;
  text-align: center;
}
.register-text {
  text-align: center;
}
.register-div {
  padding-top: 2rem;
}
.center {
  text-align: center;
}
</style>
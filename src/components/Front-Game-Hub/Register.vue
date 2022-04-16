<script setup>
import { ref } from "vue";
const displayname = ref("");
const user = ref("");
const password = ref("");
const email = ref("");

// register by using fetch
const register = async () => {
  await fetch("http://localhost:9000/profile", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
    },
    body: JSON.stringify({
      displayname: displayname.value,
      user: user.value,
      password: password.value,
      email: email.value,
      score: {
        blackjack: 0,
        matching: 0,
      },
    }),
  })
    .then((res) => res.json())
    .then((data) => {
      console.log(data);
      window.location.href="/";
    });
};

const checkIsOnline = () => {
    if (localStorage.getItem("userId") !== null) {
       window.location.href="/";
    }
}
checkIsOnline();
</script>
 
<template>
  <div class="body">
    <div class="register-div">
      <h1 class="register-text">Register GameHub</h1>
      <div>
          <div class="crop-text-text-field">
            <div class="text-text-field">
              <div class="text-field">
                <h3>Display Name</h3>
                <input type="text" class="text-box" v-model="displayname" />
              </div>
              <div class="text-field">
                <h3>Username</h3>
                <input type="text" class="text-box" v-model="user" />
              </div>
              <div class="text-field">
                <h3>Password</h3>
                <input type="password" class="text-box" v-model="password" />
              </div>
              <div class="text-field">
                <h3>Email</h3>
                <input type="email" class="text-box" v-model="email" />
              </div>
            </div>
          </div>
          <div class="register-button-div">
            <button class="register-button" @click="register">Register</button>
          </div>
      </div>
    </div>
  </div>
</template>
 
<style scoped>
.body {
  background-color: #f1f1f1;
  padding-bottom: 25vh;
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
  border: 2px solid white;
  font-family: 'Poppins', sans-serif;
  border-radius: 5px;
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
</style>
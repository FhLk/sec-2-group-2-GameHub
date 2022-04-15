<script setup>
import { ref } from "vue";
const dataFetch = ref([]);
const userId = ref(0);
const checkEdit = ref(false);
const checkDelete = ref(false);
const fetchUser = async () => {
  await fetch(`http://localhost:9000/profile/${userId.value}`)
    .then((resdata) => resdata.json())
    .then((data) => (dataFetch.value = data));
};
const fetchEditUser = async () => {
  await fetch(`http://localhost:9000/profile/${userId.value}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      displayname: dataFetch.value.displayname,
      user: dataFetch.value.user,
      password: dataFetch.value.password,
      email: dataFetch.value.email,
      score: {
        blackjack: dataFetch.value.score.blackjack,
        matching: dataFetch.value.score.matching,
      },
    }),
  })
    .then((resdata) => resdata.json())
    .then((data) => (dataFetch.value = data))
    .then(localStorage.getItem("userDisplay", dataFetch.value.displayname))
    .then(localStorage.getItem("user", dataFetch.value.user));
  clickEdit();
  window.location.href = "/";
};
const fetchDeleteUser = async () => {
  await fetch(`http://localhost:9000/profile/${userId.value}`, {
    method: "DELETE",
  })
    .then((resdata) => resdata.json())
    .then(localStorage.removeItem("userDisplay"))
    .then(localStorage.removeItem("user"))
    .then(localStorage.removeItem("userId"));
  clickDelete();
  window.location.href = "/";
};
const getUser = async () => {
  if (localStorage.getItem("userId") != null) {
    userId.value = localStorage.getItem("userId");
    await fetchUser();
    console.log(dataFetch.value);
  }
};
const clickEdit = () => {
  if (checkEdit.value == true) {
    checkEdit.value = false;
  } else {
    checkEdit.value = true;
  }
};
const clickDelete = () => {
  if (checkDelete.value == true) {
    checkDelete.value = false;
  } else {
    checkDelete.value = true;
  }
};
getUser();
</script>
 
<template>
  <div class="body">
    <div class="register-div">
      <h1 class="register-text">Profile</h1>
      <div>
        <form>
          <div class="crop-text-text-field">
            <div class="text-text-field" v-if="checkEdit == true">
              <div class="text-field">
                <h3>Display Name</h3>
                <input
                  type="text"
                  class="text-box"
                  v-model="dataFetch.displayname"
                />
              </div>
              <div class="text-field">
                <h3>Username</h3>
                <input type="text" class="text-box" v-model="dataFetch.user" />
              </div>
              <div class="text-field">
                <h3>Password</h3>
                <input
                  type="password"
                  class="text-box"
                  v-model="dataFetch.password"
                />
              </div>
              <div class="text-field">
                <h3>Email</h3>
                <input
                  type="email"
                  class="text-box"
                  v-model="dataFetch.email"
                />
              </div>
            </div>
            <div class="text-text-field" v-if="checkEdit == false">
              <div class="text-field">
                <h3>Display Name</h3>
                <input
                  type="text"
                  class="text-box"
                  v-model="dataFetch.displayname"
                  disabled
                />
              </div>
              <div class="text-field">
                <h3>Username</h3>
                <input
                  type="text"
                  class="text-box"
                  v-model="dataFetch.user"
                  disabled
                />
              </div>
              <div class="text-field">
                <h3>Password</h3>
                <input
                  type="password"
                  class="text-box"
                  v-model="dataFetch.password"
                  disabled
                />
              </div>
              <div class="text-field">
                <h3>Email</h3>
                <input
                  type="email"
                  class="text-box"
                  v-model="dataFetch.email"
                  disabled
                />
              </div>
            </div>
          </div>
          <div class="register-button-div">
            <!-- ทำให้สามารถ fetch เพื่อ edit และ delete ได้ -->
            <div class="" v-if="checkEdit == false && checkDelete == false">
              <button class="register-button" @click="clickEdit">Edit</button>
              <button class="register-button" @click="clickDelete">
                Delete
              </button>
            </div>
            <div class="" v-if="checkEdit == true">
              <button class="register-button" @click="fetchEditUser">
                Edit
              </button>
              <button class="register-button" @click="clickEdit">Cancel</button>
            </div>
            <div class="" v-if="checkDelete == true">
              <button class="register-button" @click="fetchDeleteUser">
                Delete
              </button>
              <button class="register-button" @click="clickDelete">
                Cancel
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
 
<style scoped>
.body {
  background-color: #f1f1f1;
  padding-bottom: 25vh;
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
}
.register-button-div {
  margin-top: 2rem;
  display: flex;
  justify-content: center;
}
.register-text {
  text-align: center;
}
.register-div {
  padding-top: 2rem;
}
</style>
<script setup>
</script>
 
<template>
<div>
    <div class="item" v-show="popup">
     <div class="item-header">
          <div class="item-title">ITEM</div>
          <button class="close-item" @click="closeRule">&times;</button>
        </div>
        <p class="msg" :style="{color:'red'}">{{textCard}}</p>
        <ul class="item-list">
                <div class="card-card-div">
        <div v-for="(item,index) in specailcard" :key="index" class="card-card">
        <p class="text-test" @click="use(item)">{{item}}</p>
        </div>
    </div>
    </ul>
    </div>
</div>
</template>
 
<style scoped>

.item-div{
    margin-left: 10% ;
}
.button-choose-player-item{
  width: 120px;
  height: 55px;
  font-weight: 700;
  font-size: 20px;
  background-color: white;
  color: #11856d;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
  margin-left: 10%;
}

.button-choose-player-item:hover {
  background-color: #033326;
  border: #033326 5px solid;
  color: white;
}
.item-header .item-title {
  font-size: 35px;
  font-weight: bold;
  padding-left: 1%;
}

.item-header .close-item {
  cursor: pointer;
  border: none;
  outline: none;
  background: none;
  font-size: 35px;
  font-weight: bold;
}

.item-header .close-item:hover {
  color: red;
}

.msg{
    position: fixed;
    left: 31.5%;
    top: 5%;
}

.item-header {
  padding: 10px 15px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid black;
}
.item {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  z-index: 10;
  background-color: white;
  width: 30%;
  max-width: 80%;
  height: 25%;
  color: black;
  border: black 2px solid;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}

.item-list {
    margin-top: 2.5%;
    margin-bottom: 2.5%;
    padding: 0%;
}

.card-card {
  font-size: 40px;
  font-family: "Gill Sans MT";
  text-align: center;
  width: 100px;
  height: 100px;
  border-radius: 10px;
  background-image: url(../assets/special_card.png);
  background-size: cover;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
  margin: 5%;
  margin-top: 6%;
}

.card-card:hover{
    width: 120px;
    height: 120px;
}
.card-card-div {
  display: flex;
  justify-content: space-evenly;
}
.card-card-text {
  margin-top: 55px;
  color: black;
}

.text-test{
    margin-right: 28%;
    margin-top: 23%;
}

</style>
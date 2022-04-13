<script setup>
import BlackjackImg from "../../assets/blackjack.jpg";
import GamePick from './Game.vue'

const greetUser = () => {
    if(sessionStorage.getItem("userId") != null){
        return "Welcome back, " + sessionStorage.getItem("userDisplay");
    } else {
        return "Welcome to GameHub!";
    }
    
}
</script>
 
<template>
  <div class="body">
    <h3 class="pick-game">{{ greetUser() }}</h3>
    <div class="select-game">
        <GamePick gameName="Blackjack" :imgLink="BlackjackImg" linkTo="/blackjack"/>
        <GamePick gameName="Matching" :imgLink="BlackjackImg" linkTo="/matchingGame"/>


      <!-- <img :src="BlackjackImg" alt="" class="game"/> -->
    </div>
  </div>
</template>
 
<style scoped>
.body {
  background-color: #f1f1f1;
  padding-bottom:50vh;
}
.select-game{
    display:flex;
    justify-content: space-around;
}
.game{
    width:300px;
    height:175px;
}
.pick-game{
    padding-top:20px;
    padding-left:20px;
}
</style>
<script setup>
import BlackjackImg from "/images/blackjack.jpg";
import MacthingImg from "/images/matchingGame.png";

import GamePick from './Game.vue'

const greetUser = () => {
    if(localStorage.getItem("userId") != null){
        return "Welcome back, " + localStorage.getItem("userDisplay");
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
        <GamePick gameName="Wizard Matching" :imgLink="MacthingImg" linkTo="/matching"/>
      <!-- <img :src="BlackjackImg" alt="" class="game"/> -->
    </div>
  </div>
</template>
 
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
.body {
   background: rgb(2,0,36);
  background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);
  /* background-color: #566573; */
  font-family: 'Poppins', sans-serif;
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

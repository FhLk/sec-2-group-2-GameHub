<script setup>
import { computed, reactive, ref } from 'vue';

const props=defineProps({
  cardOfbot:{
    type: Object,
    require: true
  },
  bot:{
    type:Object,
    require:true
  },
  turn:{
    type:Number,
    require:true
  },
  items:{
    type:Array,
    require:true
  }
})

let red = ref('');
const isChoose = ref(false)

const cardOfBot=computed(()=>{
  return props.cardOfbot
})

const sumOfbot = computed(() => {
  return cardOfBot.value.Cal.reduce((p, c) => { return p + c }, 0)
});
const bot=computed(()=>{
   return props.bot
 });

const turn=computed(()=>{
   return props.turn
 })
const items=computed(()=>{
  return props.items
})

function Bot() {
  isChoose.value = true;
  if (sumOfbot.value < 18) {
    BotDrawn();
  }
  else {
    BotStop();
  }
  return true
}

function BotDrawn() {
  setTimeout(() => {
    red.value = 'color:red'
  }, 2000)
  setTimeout(() => {
      isChoose.value = false;
      red.value = ''
  }, 3000)
}
//if Bot choose Stop
function BotStop() {
  setTimeout(() => {
    red.value = 'color:red'
  }, 2000)
  setTimeout(() => {
    red.value = ''
    isChoose.value = false;
  }, 3000)
}
</script>
 
<template>
<div>
    <p class="player-score">
          <a style="color: #EA99D5;">{{ bot.name }}</a>
          :
          {{ turn === 2 ? sumOfbot : `? + ${sumOfbot - cardOfbot.FirstCard}`}}
        </p>
        <div v-if="turn === 2" class="card-card-div">
          <div v-for="card in cardOfbot.Cal" :key="card" class="card-card">
            <p class="card-card-text">{{ card }}</p>
          </div>
        </div>
        <div v-else class="card-card-div">
          <div v-for="card in cardOfbot.Show" :key="card" class="card-card">
            <p class="card-card-text">{{ card }}</p>
          </div>
        </div>
        <div class="com-center" v-show="turn===1 ? Bot(): false">
            <span :style="sumOfbot < 18 ? red : ''">DRAW</span> :
            <span :style="sumOfbot < 18 ? '' : red">STAY</span> 
        </div>
</div>
</template>
 
<style scoped>

.button-choose-player-div {
  display: flex;
  justify-content: center;
}

.com-center {
  text-align: center;
  font-size: 30px;
  margin-top: 4%;
}
.player-score {
  font-size: 30px;
}
.card-card-div {
  display: flex;
  justify-content: space-evenly;
}
.card-card-text {
  margin-top: 55px;
  color: black;
}
.card-card {
  font-size: 50px;
  font-family: "Gill Sans MT";
  text-align: center;
  width: 150px;
  height: 200px;
  border: 2px solid;
  border-radius: 10px;
  background-image: url("images/bg-card.jpg");
  background-size: cover;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
</style>
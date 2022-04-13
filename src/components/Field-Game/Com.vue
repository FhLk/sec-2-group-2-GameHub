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
  if(isUse()){
    BotUse();
  }
  if (sumOfbot.value < 18) {
    BotDrawn();
  }
  else {
    BotStop();
  }
  return true
}

function BotUse(){
    setTimeout(() => {
    red.value = 'color:red'
  }, 2000)
  setTimeout(() => {
      isChoose.value = false;
      red.value = ''
  }, 3000)
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
  }, 3000)
  setTimeout(() => {
    red.value = ''
    isChoose.value = false;
  }, 6000)
}

const useItem=ref([true,false])

const isUse = ()=>{
  return randomBoolean(useItem)
}

function randomBoolean(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
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
        <div class="center" v-show="turn===1 ? Bot(): false">
          <p v-show="isChoose" class="text-choose">
            <span :style="sumOfbot < 18 ? red : ''">DRAW</span> :
            <span :style="isUse ? red: '' ">ITEM</span> :
            <span :style="sumOfbot < 18 ? '' : red">STAY</span> 
          </p>
        </div>
</div>
</template>
 
<style scoped>

.text-choose {
  font-size: 30px;
}
.center {
  text-align: center;
  padding-top: 20px;
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
  background-image: url(../../assets/bg-card.jpg);
  background-size: cover;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
</style>
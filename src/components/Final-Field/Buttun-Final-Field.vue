<script setup>
import { ref } from 'vue';

defineEmits(['restartgame'])

const defaultValue=ref({})
const restartGame = () => {
  defaultValue.value.card=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  defaultValue.value.cardOfplayer=[]
  defaultValue.value.cardOfbotShow=['?']
  defaultValue.value.cardOfbotCal=[]
  defaultValue.value.turn =0
  defaultValue.value.GameField=true
  defaultValue.value.playerscore=0
  defaultValue.value.playerround=[]
  defaultValue.value.botscore= 0
  defaultValue.value.botround=[]
  defaultValue.value.isBotStop= undefined
  defaultValue.value.isPlayerStop=undefined
  defaultValue.value.round=1
  return defaultValue.value;
}


const endGame = () => {
  alert('Thank You For Playing :)')
  location.reload();
}
</script>
 
<template>
<div>
    <div class="final-field-button">
          <button class="restartButton" @click="$emit('restartgame',restartGame())">Play Agian</button>
          <button class="endGame" @click="endGame">End Game</button>
    </div>
</div>

</template>
 
<style scoped>
.restartButton {
  width: 120px;
  height: 55px;
  font-size: 20px;
  font-weight: 700;
  background-color: white;
  color: #11856d;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}

.restartButton:hover {
  background-color: #033326;
  color: white;
  border: #033326 5px solid;
}
.endGame {
  width: 120px;
  height: 55px;
  font-size: 20px;
  font-weight: 700;
  margin-left: 100px;
  background-color: white;
  color: #b51010;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.endGame:hover {
  background-color: #b51010;
  color: white;
  border: #b51010 5px solid;
}

.final-field-button {
  margin-top: 2%;
  display: flex;
  justify-content: center;
}

</style>
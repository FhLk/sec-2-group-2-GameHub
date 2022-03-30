<script setup>
import { computed, reactive, ref } from 'vue';

defineEmits(['nextround'])

const props=defineProps({
  sum:{
    type:Object,
    require:true
  },
  player:{
    type: Object,
    require: true
  },
  bot:{
    type: Object,
    require: true 
  },
  turn:{
    type: Number,
    require:true
  }
})

const winnerRound=ref('')

const winRound = (sumOfplayer, sumOfbot) => {
  //check condition and assigned value to 'winnerRound'
  if (sumOfplayer > 21 && sumOfbot > 21) {
    winnerRound.value = 'Draw'
    return 'DRAW';
  }
  if (sumOfplayer > sumOfbot && sumOfplayer <= 21) {
    winnerRound.value = props.player.name
    return `THE WINNER IN THIS ROUND IS ${props.player.name} !`;
  }
  else if (sumOfplayer > sumOfbot && sumOfplayer > 21) {
    winnerRound.value = props.bot.name
    return `THE WINNER IN THIS ROUND IS ${props.bot.name} !`;
  }
  if (sumOfplayer < sumOfbot && sumOfbot <= 21) {
    winnerRound.value = props.bot.name
    return `THE WINNER IN THIS ROUND IS ${props.bot.name} !`;
  }
  else if (sumOfplayer < sumOfbot && sumOfbot > 21) {
    winnerRound.value = props.player.name
    return `THE WINNER IN THIS ROUND IS ${props.player.name} !`;
  }
  else {
    winnerRound.value = 'Draw'
    return 'DRAW';
  }
}

const nextRound = () => {
  //increase score from check condition by name 
  if (winnerRound.value == props.player.name) {
    props.player.score++
    props.player.round.push("Win")
    props.bot.round.push("Lose")
  }
  else if (winnerRound.value == props.bot.name) {
    props.bot.score++
    props.player.round.push("Lose")
    props.bot.round.push("Win")
  }
  else {
    props.player.round.push("Draw")
    props.bot.round.push("Draw")
  }
  return
}

</script>
 
<template>
<div>
     <div class="winnerRound" v-show="turn == 2">
        {{ winRound(sum.player, sum.bot) }}
        <br />
    </div>
    <button @click="$emit('nextround',nextRound())" v-show="turn == 2" class="button-next">Next Round</button>
</div>

</template>
 
<style scoped>

.button-next {
  width: 120px;
  height: 60px;
  font-weight: 700;
  background-color: #4446c2;
  color: white;
  border: #4446c2 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
  margin-top: 5px;
}
.button-next:hover {
  background-color: white;
  color: #4446c2;
  border: white 5px solid;
}
.winnerRound {
  font-size: 20px;
  padding-bottom: 1%;
  padding-top: 1%;
}

</style>
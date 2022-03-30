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
  }
})

const sumOfbot = computed(() => {
  return props.cardOfbot.Cal.reduce((p, c) => { return p + c }, 0)
});

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
</div>
</template>
 
<style scoped>
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
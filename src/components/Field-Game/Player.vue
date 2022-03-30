<script setup>
import { computed, reactive, ref } from 'vue';

defineEmits(['drawn','stay'])

const props=defineProps({
  cardOfplayer:{
    type: Array,
    require: true
  },
  player:{
    type:Object,
    require:true
  },
  turn:{
    type:Number,
    require:true
  }
})


const sumOfplayer = computed(() => {
  return props.cardOfplayer.reduce((p, c) => { return p + c }, 0)
});

</script>
 
<template>
 <div>
        <div class="button-choose-player-div">
          <button
            v-show="turn == 0 && sumOfplayer < 21"
            @click="$emit('drawn',sumOfplayer)"
            class="button-choose-player-drawn"
          >DRAW</button>
          <button
            v-show="turn == 0 && sumOfplayer >= 21"
            class="button-choose-player-drawn-disable"
            :disabled="sumOfplayer >= 21"
          >DRAW</button>
          <button  v-show="turn == 0" class="button-choose-player-item">ITEM</button>
          <button  v-show="turn == 0" class="button-choose-player-money">INCREASE</button>
          <button v-show="turn == 0" @click="$emit('stay',sumOfplayer)" class="button-choose-player-stay">STAY</button>
        </div>
        <p class="player-score">
          <a style="color: #EDE682;">{{ player.name }} ($10,000)</a>
          : {{ sumOfplayer }}
        </p>
        <div class="card-card-div">
          <div v-for="card in cardOfplayer" :key="card" class="card-card">
            <p class="card-card-text">{{ card }}</p>
          </div>
        </div>
  </div>

</template>
 
<style scoped>

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
.button-choose-player-money{
  width: 125px;
  height: 60px;
  font-weight: 700;
  font-size: 20px;
  background-color: white;
  color: #11856d;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
  margin-left: 10%;
}

.button-choose-player-money:hover {
  background-color: #033326;
  border: #033326 5px solid;
  color: white;
}


.card-card-div {
  display: flex;
  justify-content: space-evenly;
}
.card-card-text {
  margin-top: 55px;
  color: black;
}
.player-score {
  font-size: 30px;
}

.button-choose-player-div {
  display: flex;
  justify-content: center;
}

.button-choose-player-drawn {
  width: 120px;
  height: 55px;
  font-weight: 700;
  font-size: 20px;
  background-color: white;
  color: #11856d;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.button-choose-player-drawn:hover {
  background-color: #033326;
  border: #033326 5px solid;
  color: white;
}
.button-choose-player-drawn-disable {
  width: 120px;
  height: 55px;
  font-weight: 700;
  font-size: 20px;
  background-color: #74807d;
  color: white;
  border: #74807d 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}

.button-choose-player-stay {
  margin-left: 100px;
  width: 120px;
  height: 55px;
  font-weight: 700;
  font-size: 20px;
  background-color: white;
  color: #b51010;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.button-choose-player-stay:hover {
  background-color: #b51010;
  border: #b51010 5px solid;
  color: white;
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
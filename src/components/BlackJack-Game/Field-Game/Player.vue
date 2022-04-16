<script setup>
import { computed, reactive, ref } from 'vue';

defineEmits(['drawn','stay','item','bet'])

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
    type: Number,
    require:true
  },
  items:{
    type: Array,
    require:true
  }
})

const player=computed(()=>{
  return props.player
})
const turn=computed(()=>{
  return props.turn
})

const popup=ref();
const items=computed(()=>{
  return props.items
})
const textCard=ref("")

const sumOfplayer = computed(() => {
  return props.cardOfplayer.reduce((p, c) => { return p + c }, 0)
});

const PopUpItem=()=>{
  popup.value= popup.value ? false:true
}

const use =(c)=>{
  items.value.splice(items.value.indexOf(c),1)
  PopUpItem();
  return c;
} 
</script>
 
<template>
 <div >
        <div class="button-choose-player-div" v-show="turn===0">
          <button v-show="sumOfplayer < 21" @click="$emit('drawn',sumOfplayer),isBet=false" class="button-choose-player-drawn"
          >DRAW</button>
          <button v-show="sumOfplayer >= 21" class="button-choose-player-drawn-disable" :disabled="sumOfplayer >= 21"
          >DRAW</button>
          <button v-show="items.length>0" class="button-choose-player-item" @click="PopUpItem"
          >ITEM</button>
          <button v-show="items.length===0" class="button-choose-player-item-disable" :disabled="items.length===0"
          >ITEM</button>
          <div class="item" v-show="popup">
            <div class="item-header">
              <div class="item-title">ITEM</div>
                <button class="close-item" @click="popup=false">&times;</button>
              </div>
              <p class="msg" :style="{color:'red'}">{{textCard}}</p>
            <ul class="item-list">
                <div class="card-card-div">
              <div v-for="(item,index) in items" :key="index" class="card-card-item">
              <p class="text-test" @click="$emit('item',use(item))">{{item}}</p>
              </div>
              </div>
            </ul>
          </div>
          <button @click="$emit('stay',sumOfplayer)" class="button-choose-player-stay">STAY</button>
        </div>
        <p class="player-score">
          <a style="color: #EDE682;">{{ player.name }}</a>
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
.text-test{
    margin-right: 10%;
    margin-top: 20%;
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
  /* margin-top: 10%; */
}

.button-choose-player-item:hover {
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
.button-choose-player-item-disable {
  width: 120px;
  height: 55px;
  font-weight: 700;
  font-size: 20px;
  background-color: #74807d;
  color: white;
  border: #74807d 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
  margin-left: 10%;
}

.button-choose-player-stay {
  margin-left: 10%;
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
  background-image: url("images/bg-card.jpg");
  background-size: cover;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.card-card-item {
  font-size: 25px;
  font-family: "Gill Sans MT";
  text-align: center;
  width: 50px;
  height: 50px;
  border: 2px solid;
  border-radius: 10px;
  background-image: url("images/item.png");
  background-size: cover;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}

.card-card-item:hover{
    width: 60px;
    height: 60px;
    font-size: 30px;
}
</style>
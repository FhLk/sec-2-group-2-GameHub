<script setup>
import {ref} from 'vue'

const props=defineProps({
    player:{
        type: Object,
        require: true
    },
    bot:{
      type:Object,
      require:true
    }

})

const HistoryButton = ref(false);
const PopUpHistory = () => {
  if(HistoryButton.value){
    HistoryButton.value = false;
  }
  else{
    HistoryButton.value=true;
  }
}
</script>
 
<template>
<div>
    <button
          class="historyBtn"
          style="margin-top: 2%;"
          v-show="player.round.length != 0"
          @click="PopUpHistory"
        >History</button>

  <div class="history" v-if="HistoryButton == true">
          <div class="history-header">
            <div class="history-title">History</div>
            <button class="close-history" @click="PopUpHistory">&times;</button>
          </div>
          <div class="history-body">
            <ul>
              <a style="color: #008E89;">{{ player.name }}</a>
              <li v-for="(result, index) in player.round" :key="index">
                Round {{ index + 1 }} : {{ result }}
                <span v-if="result == 'Win'">
                  <a style="color: red;">+1</a>
                </span>
                <span v-else>+0</span>
              </li>
              <br />
              <a style="color: #008E89;">{{ bot.name }}</a>
              <li v-for="(result, index) in bot.round" :key="index">
                Round {{ index + 1 }} : {{ result }}
                <span v-if="result == 'Win'">
                  <a style="color: red;">+1</a>
                </span>
                <span v-else>+0</span>
              </li>
            </ul>
          </div>
        </div>
</div>
</template>
 
<style scoped>

.historyBtn {
  width: 120px;
  height: 55px;
  font-weight: 700;
  background-color: white;
  color: #e76f1f;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
  display: block;
  margin: auto;
  position: absolute;
  transform: translate(1050%, 0);
}
.historyBtn:hover {
  background-color: #e76f1f;
  color: white;
  border: #e76f1f 5px solid;
}
.history {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  z-index: 10;
  background-color: white;
  width: 650px;
  max-width: 80%;
  color: black;
  border: black 2px solid;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.history-header {
  padding: 10px 15px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid black;
}
.history-header .history-title {
  font-size: 35px;
  font-weight: bold;
  padding-left: 1%;
}
.history-header .close-history {
  cursor: pointer;
  border: none;
  outline: none;
  background: none;
  font-size: 35px;
  font-weight: bold;
}
.history-header .close-history:hover {
  color: red;
}
.history-body {
  padding: 10px 15px;
  font-size: 20px;
  font-weight: bold;
}


</style>
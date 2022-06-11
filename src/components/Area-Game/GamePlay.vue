<script setup>
import { ref } from 'vue';
const Area=new Array(9)
// const spawnArea=new Array(9)
const getArea=ref([])
const getClickArea=ref([])
const isPlay=ref(true)
const spawn=ref(-1)
const RandomSpawn=()=>{
  // let duplicate = false
  // const rand = Math.floor(Math.random() * 9);
  // duplicate = randNumbers.value.some((randNumber) => randNumber === rand)
  // duplicate ? generateNumber() : randNumbers.value.push(rand)
  return Math.floor(Math.random() * 9);
}

const StartGame=()=>{
  isPlay.value=true
  spawn.value=RandomSpawn()
  for (let index = 0; index < Area.length; index++) {
    getArea.value[index]={count: index===spawn.value ? 0:1,click:false}
  }
}

StartGame()

const RestartGame=()=>{
  // isPlay.value=false
  spawn.value= -1
  StartGame()
}

let getNextIndex= -1
const isClick=(getIndex,getSpawn)=>{
  if(getIndex!==getSpawn && getIndex!==getNextIndex ){
    getNextIndex=getIndex
    getClickArea.value.push(getIndex)
    getArea.value[getIndex].click=true
    Move(getSpawn)  
  }
}

const Move=(oldSpawn)=>{
  // if(getClickArea.value.length<9){
    spawn.value=RandomSpawn()
  // }
  console.log(getClickArea.value)
}

const TestClass=(index)=>{
  if(index===spawn.value){
    return 'grid-item-spawn'
  }
  else if(getArea.value[index].click){
    return 'grid-item-click'
  }
  else{
    return 'grid-item'
  }
}

</script>

<template>
<div class="block-out">
  <div class="top-container">
    <button class="button-start" @click=" isPlay ? RestartGame():StartGame()">{{isPlay ? 'Restart Game':'Start Game'}}</button>
    <div class="grid-container" v-if="isPlay">
      <button :class="TestClass(index)" v-for="(grid,index) in getArea" :key="index" @click="isClick(index,spawn)" :disabled="grid.click"></button>
    </div> 
  </div>
</div>
</template>

<style scoped>
.button-start{
  margin-top: 10px;
  margin-bottom: 10px;
}
.block-out{
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: aqua;
  background-size: cover;
}

.top-container {
  width: 340px;
}
.grid-container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px 100px;
  column-gap: 10px;
  row-gap: 10px;
  background-color: green;
  padding: 10px;
}
.grid-item {
  display: flex;
  background-color: rgba(255, 255, 255, 0.8);
  border: 1px solid rgba(0, 0, 0, 0.8);
  justify-content: center;
  border-radius: 10px;
}

.grid-item:hover{
  background-color: blue;
}

.grid-item-spawn {
  display: flex;
  background-color: rgba(255, 0, 0, 0.8);
  border: 1px solid rgba(0, 0, 0, 0.8);
  justify-content: center;
  border-radius: 10px;
}

.grid-item-click {
  display: flex;
  background-color: rgba(0, 0, 0, 0.8);
  border: 1px solid rgba(0, 0, 0, 0.8);
  justify-content: center;
  border-radius: 10px;
}
</style>


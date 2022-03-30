<script setup>
defineEmits(['play'])
const props=defineProps({
    isPlay:{
        type: Number,
        require: true
    },
})
</script>
 
<template>
<div>
<div class="playbuttondiv">
    <h1 class="header" v-show="isPlay === 0">BlackJack Game</h1>
    <button @click="$emit('play')" class="playbutton">Play</button>
</div>
</div>

</template>
 
<style scoped>


.playbutton {
  width: 200px;
  height: 85px;
  font-size: 30px;
  background-color: white;
  color: #11856d;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.playbutton:hover {
  background-color: #033326;
  color: white;
  border: #033326 5px solid;
}
.playbuttondiv {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.header {
  margin-bottom: 30px;
  font-size: 50px;
}
</style>
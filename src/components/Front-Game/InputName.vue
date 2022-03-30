<script setup>
defineEmits(['go'])
const props=defineProps({
    player:{
        type: Object,
        require: true
    },
    isPlay:{
      type: Number,
      require: true
    }
})

</script>
 
<template>
 <div class="field-name" v-show="isPlay == 1">
        <div class="field-topic">
          <h1>WELCOME TO BLACKJACK GAMES !</h1>
        </div>
        <div class="field-name-text">
          <input
            type="text"
            placeholder="Enter Your Name..."
            v-model="player.name"
            class="field-name-text-text-input"
          />
        </div>
        <div class="ok-button-div">
          <button @click="$emit('go',player.name)" class="ok-button">GO</button>
        </div>
      </div>
</template>
 
<style scoped>

.field-name {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
::placeholder {
  color: rgba(54, 54, 54, 0.815);
  padding: 10px;
}
.field-name-text {
  border-radius: 100px;
  margin-top: 3rem;
  display: flex;
  justify-content: center;
  align-content: center;
}
.field-name-text-text-input {
  margin-left: 11px;
  width: 85%;
  border: solid #11856d;
  border-radius: 5px;
  height: 65px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.field-name-text-text-input:hover {
  border-color: #80e0cd;
}
.ok-button-div {
  margin-top: 2rem;
  display: flex;
  justify-content: center;
}
.ok-button {
  cursor: pointer;
  font-weight: 700;
  font-size: 20px;
  width: 100px;
  height: 50px;
  background-color: white;
  color: #11856d;
  border: white 5px solid;
  border-radius: 5px;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.ok-button:hover {
  background-color: #033326;
  color: white;
  border: #033326 5px solid;
}

</style>
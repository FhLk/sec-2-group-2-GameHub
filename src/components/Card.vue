<script setup>
import { computed } from "@vue/runtime-core";

defineEmits("selectCard");
const props = defineProps({
  matched: {
    type: Boolean,
    default: false,
  },
  position: {
    type: Number,
    require: true,
  },
  value: {
    type: String,
    require: true,
  },
  visible: {
    type: Boolean,
    default: false,
  },
})
  
const fippedStyle = computed(() => {
  if(props.visible){
    return 'is-flip'
  }
})

</script>

<template>
  <div class="card" :class="fippedStyle" @click="$emit('selectCard', { position: props.position, faceValue: props.value })">
    <div class="card-face is-front">
      <img :src="`/images/${value}.jpg`" alt="value" width="120" height="120" class="front-img">
      <img v-if="matched" src="https://api.iconify.design/emojione:white-heavy-check-mark.svg?color=%23888888" class="icon-checkmark"/>
    </div>

    <div class="card-face is-back"></div>
  </div>
</template>

<style>
.card {
  position: relative;
  transition: 0.5s transform ease-in;
  transform-style: preserve-3d;
}
.card.is-flip{
  transform: rotateY(180deg);
}
.card-face {
  width: 100%;
  height: 100%;
  position: absolute;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  backface-visibility: hidden;
}
.front-img {
  border-radius: 10px;
}
.card-face.is-front{
  transform: rotateY(180deg);
}
.card-face.is-back {
  background-image: url("images/background-back-card.jpg");
  color: white;
  /* background-repeat: no-repeat;
  background-attachment: fixed; */
  background-size: 100% 100%;
}
.icon-checkmark{
  position: absolute;
  right: 5px;
  bottom: 5px;
}

</style>

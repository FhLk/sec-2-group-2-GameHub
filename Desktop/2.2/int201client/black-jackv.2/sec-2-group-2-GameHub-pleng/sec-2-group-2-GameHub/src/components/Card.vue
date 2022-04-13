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
});
  

</script>

<template>
  <div
    class="card"
    @click="
      $emit('selectCard', { position: props.position, faceValue: props.value })
    "
  >
    <div v-if="visible" class="card-face is-front">
      <img :src="`/images/${value}.jpg`" :alt="value" />
      <img v-if="matched" src="https://api.iconify.design/emojione:white-heavy-check-mark.svg?color=%23888888"
      class="icon-checkmark"/>
    </div>

<!-- <div class="card-face is-front">
      <img
        class="card-image"
        :srcset="`/images/${value}@2x.jpg 2x, /images/${value}.jpg 1x`"
        :src="`/images/${value}.jpg`"
        :alt="value"
      />
      <img v-if="matched" src="https://api.iconify.design/emojione:white-heavy-check-mark.svg?color=%23888888"
      class="icon-checkmark"/>
    </div> -->

    <div v-else class="card-face is-back"></div>
  </div>
</template>

<style>
.card {
 
  position: relative;
}
.card-face {
  width: 100%;
  height: 100%;
  position: absolute;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.card-face.is-front {
  background-image:url("images/hedwig.jpg");
  color: white;
  /* background-size: 100% 100%; */
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

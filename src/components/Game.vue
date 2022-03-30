<script setup>
defineProps(
  {
    imgLink: String,
    gameName: String,
    linkTo: String,
  }
);
define
</script>
 
<template>
  <div class="game">
    <router-link :to="linkTo">
      <img :src="imgLink" alt="" class="image"/>
    </router-link>
    <p>{{ gameName }}</p>
  </div>
</template>
 
<style scoped>
.image{
    width:200px;
    height:100px;
}
/* .game{
    text-align:center;
} */
</style>
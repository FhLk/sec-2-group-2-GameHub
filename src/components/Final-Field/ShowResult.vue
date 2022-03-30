<script setup>

defineEmits(['restart','endgame'])

const props = defineProps({
  player:{
    type:Object,
    require:true
  },
  bot:{
    type:Object,
    require:true
  }
})

</script>
 
<template>
<div>
    <p style="font-size: 50px; text-align: center; padding-top: 2%;">Result</p>
        <ul style="text-align: center;list-style-type: none; font-size: 25px;">
          {{ player.name }}
          <li v-for="(result, index) in player.round" :key="index">
            Round {{ index + 1 }} : {{ result }}
            <span v-if="result == 'Win'">+1</span>
            <span v-else>+0</span>
          </li>
          <br />
          {{ bot.name }}
          <li v-for="(result, index) in bot.round" :key="index">
            Round {{ index + 1 }} : {{ result }}
            <span v-if="result == 'Win'">+1</span>
            <span v-else>+0</span>
          </li>
        </ul>
</div>

</template>
 
<style scoped>
</style>
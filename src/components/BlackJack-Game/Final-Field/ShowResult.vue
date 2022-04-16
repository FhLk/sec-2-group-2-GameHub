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
  },
  sum:{
      type:Object,
      require:true
    }
})

</script>
 
<template>
<div>
    <p style="font-size: 50px; text-align: center;margin-top: 2%;margin-bottom: 3%;">Result</p>
        <ul style="text-align: center;list-style-type: none; font-size: 25px;">
        <div class="score-player">
          {{ player.name }}
          <li v-for="(result, index) in player.round" :key="index">
            Round {{ index + 1 }} : {{ result }}
            <span v-if="result == 'Win'">+1</span>
            <span v-else>+0</span>
          </li>
          </div>
          <div class="score-bot">
          {{ bot.name }}
          <li v-for="(result, index) in bot.round" :key="index">
            Round {{ index + 1 }} : {{ result }}
            <span v-if="result == 'Win'">+1</span>
            <span v-else>+0</span>
          </li>
          </div>
        </ul>
</div>

</template>

<style scoped>
.score-player{
  float: left;
}
.score-bot{
  float: right;
}
</style>
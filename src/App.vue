<script setup>
import { ref, computed } from "vue"
import Card from "./components/Card.vue"

const cardList = ref([])
const playerSelect = ref([])
const newPlayer = ref(true)
const status = computed(() => {
  if (remaining.value === 0) {
    return "YOU ARE WIN!!!"
  } else {
    return `Remaining Pairs: ${remaining.value}`
  }
})

const startGame = () =>{
  newPlayer.value = false
  restart()
}

const cardItems = [
  "phinic",
  "mandrake",
  "hogwarts",
  "hat",
  "broom",
  "glasses",
  "fetish",
  "hedwig",
] // ค่าของ cards

cardItems.forEach((item) => {
  //แสดง cards 8 ชุด 16 ใบ
  cardList.value.push({
    //แสดง cards 4 ชุด 8 ใบ
    value: item,
    variant: 1,
    visible: false,
    position: null,
    matched: false
  })

  cardList.value.push({
    //แสดง cards 4 ชุด 8 ใบ
    value: item,
    variant: 2,
    visible: true,
    position: null,
    matched: false
  })
})

cardList.value = cardList.value.map((card, index) => {
  //ค่าของ cardList
  return {
    ...card,
    position: index, // position ไม่ได้ fix ตำแหน่ง ดังนั้นเลยใส่เป็น index แทน
  }
})

const remaining = computed(() => {
  // คู่ของ card ที่ยังคงเหลือ
  const remainingCards = cardList.value.filter(
    (card) => card.matched === false
  ).length; // หา length โดย filter หา card ที่ยังไม่ถูกแมชท์ (matched = false)
  return remainingCards / 2; // นำผลลัพธ์มาหาร 2 เพราะว่าจะเอาแค่ตัวเดียว
})

const shuffleCards = (cardList) => {
  //การสลับตำแหน่งของ cards
  for (let i = cardList.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i - 1))
    const temp = cardList[i]
    cardList[i] = cardList[j]
    cardList[j] = temp
  }
  return cardList
}

const restart = () => {
  // เริ่มเกมใหม่
  shuffleCards(cardList.value);

  cardList.value = cardList.value.map((card, index) => {
    // set ค่าของ cardList.value ให้เหมือนตอนเริ่มต้น ยกเว้น position ที่จะสุ่ม
    return {
      ...card,
      matched: false,
      position: index,
      visible: false,
    }
  })
}

const flipCard = (flip) => {
  cardList.value[flip.position].visible = true; // flip card ด้านหน้าขึ้น
  if (playerSelect.value[0]) {
    if (
      playerSelect.value[0].position === flip.position &&
      playerSelect.value[0].faceValue === flip.faceValue
    ) {
      // มี if นี้เพื่อไม่ให้เลือกการ์ดใบเดิมซ้ำได้
      return;
    } else {
      playerSelect.value[1] = flip;
    }
  } else {
    playerSelect.value[0] = flip;
  }
  checkMatch()
}

const checkMatch = () => {
  if (playerSelect.value.length === 2) {
    const cardOne = playerSelect.value[0];
    const cardTwo = playerSelect.value[1];

    if (cardOne.faceValue === cardTwo.faceValue) {
      cardList.value[cardOne.position].matched = true;
      cardList.value[cardTwo.position].matched = true;
    } else {
      setTimeout(() => {
        cardList.value[cardOne.position].visible = false;
        cardList.value[cardTwo.position].visible = false;
      }, 1000);
    }
    playerSelect.value.length = 0;
  }
}

</script>

<template>
  <div class="body">
    <h1>Wizard Matching</h1>
    <transition-group tag="div" class="game-board" name="shuffle-card">
      <Card
        v-for="card in cardList"
        :key="`${card.value}-${card.variant}`"
        :matched="card.matched"
        :value="card.value"
        :visible="card.visible"
        :position="card.position"
        @selectCard="flipCard"
      />
    </transition-group>
    <h2 class="status">{{ status }}</h2>

    <button v-if="newPlayer" @click="startGame" class="button">
      <img src="https://api.iconify.design/bi/play-circle-fill.svg?color=white&width=20&height=20" alt="StartIcon"/>
      Start Game
    </button> 

    <button v-else @click="restart" class="button">
      <img src="https://api.iconify.design/codicon/debug-restart.svg?color=white&width=20&height=20" alt="RestartIcon"/>
      Restart Game
    </button>
  </div>
</template>

<style>
@font-face{
  font-family: HarryFont;
  src: url("/fonts/Sarun's HarryPotter.TTF");
}
#app {
  height: 94.6vh;
  background-image: linear-gradient(rgba(9, 9, 9, 0.8), rgba(9, 9, 9, 0.8)), url("/images/background-3.jpg");
  padding-top: 50px;
}
html,
body {
  color: white;
  margin: 0;
  padding: 0;
  text-align: center;
  /* margin-top: 50px; */
  padding-top: 0;
  height: 100vh;
}
h1 {
  margin-top: 0;
  color: white;
  font-family: HarryFont;
  font-size: 60px;
}
.status{
   font-family: HarryFont;
   font-size: 35px;
}
.button{
  background-color:#552969;
  color:white;
  padding: 1rem 0.75rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin:0 auto;
  font-weight: bold;
  font-size: 1rem;
  border: 0;
  border-radius: 5px;
  cursor: pointer;
}
.button img{
  padding-right: 10px;
}

.button:hover{
  background-color:#8d5fa1;
}

.game-board {
  display: grid;
  grid-template-columns: repeat(4, 120px);
  grid-template-rows: repeat(4, 120px);
  grid-column-gap: 24px;
  grid-row-gap: 24px;
  justify-content: center;
}

.shuffle-card-move{
  transition: transform 0.8s ease-in;
}
</style>

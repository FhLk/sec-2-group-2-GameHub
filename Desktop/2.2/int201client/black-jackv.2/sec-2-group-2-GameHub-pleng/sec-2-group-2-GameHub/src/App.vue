<script setup>
import { ref, computed } from "vue";
import Card from "./components/Card.vue";

const cardList = ref([]);
const playerSelect = ref([]);
const status = computed(() => {
  if (remaining.value === 0) {
    return "YOU ARE WIN!!!";
  } else {
    return `Remaining Pairs: ${remaining.value}`;
  }
});
const cardItems = [
  "phinic",
  "mandrake",
  "hogwarts",
  "hat",
  "broom",
  "glasses",
  "fetish",
  "hedwig",
]; // ค่าของ cards

cardItems.forEach((item) => {
  //แสดง cards 8 ชุด 16 ใบ
  cardList.value.push({
    //แสดง cards 4 ชุด 8 ใบ
    value: item,
    visible: false,
    position: null,
    matched: false,
  });

  cardList.value.push({
    //แสดง cards 4 ชุด 8 ใบ
    value: item,
    visible: false,
    position: null,
    matched: false,
  });
});

cardList.value = cardList.value.map((card, index) => {
  //ค่าของ cardList
  return {
    ...card,
    position: index, // position ไม่ได้ fix ตำแหน่ง ดังนั้นเลยใส่เป็น index แทน
  };
});

const remaining = computed(() => {
  // คู่ของ card ที่ยังคงเหลือ
  const remainingCards = cardList.value.filter(
    (card) => card.matched === false
  ).length; // หา length โดย filter หา card ที่ยังไม่ถูกแมชท์ (matched = false)
  return remainingCards / 2; // นำผลลัพธ์มาหาร 2 เพราะว่าจะเอาแค่ตัวเดียว
});

const shuffleCards = (cardList) => {
  //การสลับตำแหน่งของ cards
  for (let i = cardList.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i - 1));
    const temp = cardList[i];
    cardList[i] = cardList[j];
    cardList[j] = temp;
  }
  return cardList;
};

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
    };
  });
};

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
  checkMatch();
};

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
      }, 1500);
    }
    playerSelect.value.length = 0;
  }
};
</script>

<template>
  <div class="body">
    <h1>Matching Game</h1>
    <div class="game-board">
      <Card
        v-for="(card, index) in cardList"
        :key="index"
        :matched="card.matched"
        :value="card.value"
        :visible="card.visible"
        :position="card.position"
        @selectCard="flipCard"
      />
    </div>
    <h2>{{ status }}</h2>
    <button @click="restart()" class="button">
      <img
        src="https://api.iconify.design/codicon:debug-restart.svg?color=%23888888"
       alt="RestartIcon"/>
        Restart Game
    </button>
  </div>
</template>

<style>
#app {
  height: 100vh;
}
html,
body {
  background-image: linear-gradient(rgba(9, 9, 9, 0.8), rgba(9, 9, 9, 0.8)),
    url("/images/background-3.jpg");
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
}
.button{
  background-color: 	rgb(102, 0, 0);
  color:white;
  padding: 0.75rem 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin:0 auto;
  font-weight: bold;
}
.game-board {
  display: grid;
  grid-template-columns: repeat(4, 120px);
  grid-template-rows: repeat(4, 120px);
  grid-column-gap: 24px;
  grid-row-gap: 24px;
  justify-content: center;
}
</style>

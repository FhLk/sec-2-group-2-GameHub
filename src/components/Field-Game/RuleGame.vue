<script setup>import { ref } from 'vue';

const RuleButton =ref(true)

const closeRule = () => {
  RuleButton.value = false;
}

</script>
 
<template>
<div class="rule" v-if="RuleButton == true">
        <div class="rule-header">
          <div class="rule-title">BlackJack Rule</div>
          <button class="close-rule" @click="closeRule">&times;</button>
        </div>
        <div class="rule-body">
          <p
            style="color: black;"
          >- ผู้เล่นจะต้องนำค่าของการ์ดที่ได้มาบวกกันให้เท่ากับหรือใกล้เคียง 21 มากที่สุด</p>
          <p style="color: black;">
            - โดยจะสามารถเลือก
            <a style="color: #11856d;">Draw</a> เพื่อจั่วการ์ดเพิ่ม หรือ
            <a style="color: #b51010;">Stay</a> เพื่อไม่จั่วการ์ด
          </p>
          <p
            style="color: black;"
          >- หากผู้เล่นฝ่ายใดมีค่าเท่ากับหรือใกล้เคียง 21 มากที่สุด จะเป็นผู้ชนะ</p>
          <p style="color: black;">- ในกรณีที่ฝ่ายใดมีค่ามากกว่า 21 จะหมดสิทธิ์ชนะในทันที</p>
          <p style="color: black;">- แต่หากทั้งคู่มีค่ามากกว่า 21 จะถือว่าเสมอ</p>
          <p style="color: black;">- ถ้า ชนะ จะได้ 1 คะแนน แต่ถ้า แพ้หรือเสมอ จะได้ 0 ใครได้ 2 คะแนนก่อนเป็นผู้ชนะ Game</p>
        </div>
      </div>
</template>
 
<style scoped>
.rule {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  z-index: 10;
  background-color: white;
  width: 800px;
  max-width: 80%;
  color: black;
  border: black 2px solid;
  box-shadow: 5px 5px 10px 2px rgba(36, 36, 36, 0.507);
}
.rule-header {
  padding: 10px 15px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid black;
}
.rule-header .rule-title {
  font-size: 35px;
  font-weight: bold;
  padding-left: 1%;
}
.rule-header .close-rule {
  cursor: pointer;
  border: none;
  outline: none;
  background: none;
  font-size: 35px;
  font-weight: bold;
}
.rule-header .close-rule:hover {
  color: red;
}
.rule-body {
  padding: 10px 15px;
  font-size: 20px;
  font-weight: bold;
  padding-left: 6%;
}


</style>
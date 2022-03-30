<script setup>
import { computed, reactive, ref } from 'vue';
import ButtonPlay from './components/Front-Game/ButtonPlay.vue';
import InputName from './components/Front-Game/InputName.vue';
import RuleGame from './components/Field-Game/RuleGame.vue';
import ButtonHistory from './components/Field-Game/ButtonHistory.vue';
import Player from './components/Field-Game/Player.vue';
import Com from './components/Field-Game/Com.vue';
import ButtonNextRound from './components/Field-Game/ButtonNextRound.vue';
import ShowResult from './components/Final-Field/ShowResult.vue';
import ButtunFinalField from './components/Final-Field/Buttun-Final-Field.vue';

const centerStyle = "font-size: 25px; margin-top: 2%; font-weight: 600"
//Original Card
const card = ref([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
//function randomCard
function randomCard(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

//Oject of Player
const player = reactive({ name: '', score: 0, round: [] })
const bot = reactive({ name: 'Computer', score: 0, round: [] })
//Card of Player
const cardOfplayer = ref([])
//Card of Bot 
const cardOfbotShow = ref(['?']) //use for Show
const cardOfbotCal = ref([]);// use for calculator
//use with tag html for show
const isChoose = ref(false);// when bot thinking of choose
const isBotStop = ref();// when bot choose 'Stop' = true
const isPlayerStop = ref();// when player choose 'Stop' = true
const GameField = ref(true)
const isPlay = ref(0);//when Start this web
let red = ref('');// ux of bot
let firstofBot = ref();// first card of bot (use 'ref()' because it to be calculator on html)
let secondofBot;// second card of bot
let firstofPlayer;//first card of player
let secondofPlayer;//second card of player 
let round = ref(1)
const turn =ref(0);

const sumOfplayer=ref();

const sumOfbot = computed(() => {
  return cardOfbotCal.value.reduce((p, c) => { return p + c }, 0)
});

function Start() {
  firstofBot.value = randomCard(card.value)//get first card of bot
  cardOfbotCal.value.push(firstofBot.value)//add card to card of bot use for calculator
  card.value.splice(card.value.indexOf(firstofBot.value), 1)// Remove card from original card
  secondofBot = randomCard(card.value)//get second card of bot
  cardOfbotCal.value.push(secondofBot);//add card to card of bot use for show 
  cardOfbotShow.value.push(secondofBot);//add card to card of bot use for calculator
  card.value.splice(card.value.indexOf(secondofBot), 1)// Remove card from original card
  //player seem bot
  firstofPlayer = randomCard(card.value)
  card.value.splice(card.value.indexOf(firstofPlayer), 1)
  cardOfplayer.value.push(firstofPlayer)
  secondofPlayer = randomCard(card.value)
  cardOfplayer.value.push(secondofPlayer)
  card.value.splice(card.value.indexOf(secondofPlayer), 1)
}
//Game play of player
//when player clink Drawn
const PlayerDrawn = (sum) => {
  sumOfplayer.value=sum;
  if (card.value.length != 0) {// if orifinal card not empty
    isPlayerStop.value = false;// assigned 'isPlayerStop' use for any process
    let num = randomCard(card.value);//get card from random original card
    cardOfplayer.value.push(num)//add card to card of player
    card.value.splice(card.value.indexOf(num), 1)// Remove card from original card
    turn.value = 1;//change turn to bot
    Bot();//bot turn
  }
}
//when player clink Stop
const PlayerStop = (sum) => {
  sumOfplayer.value=sum;
  isPlayerStop.value = true;// assigned 'isPlayerStop' use for any process
  turn.value = 1;//change turn to bot
  if (isPlayerStop.value == isBotStop.value) {//if player click stop and bot choose stop
    turn.value = 2//change to turn of result
  }
  else {
    Bot();//bot turn 
  }
}
//Game play of Bot
function Bot() {
  isChoose.value = true;//assigned 'isChoose' use for show tag html
  //Check condition
  if (sumOfbot.value < 18) {// if Calculator card of bot less than 18
    BotDrawn();//Bot Choose Drawn
    isBotStop.value = false//assigned 'isBotStop' use for process
  }
  else {//if more than 18
    BotStop();//Bot choose Stop
    isBotStop.value = true;//assigned 'isBotStop' use for process
  }
}
//if Bot choose Drawn
function BotDrawn() {
  //tell to player that bot choose this 
  setTimeout(() => {
    red.value = 'color:red'//change font-color to red
  }, 2000)
  //seem player clink drawn crad
  setTimeout(() => {
    if (card.value.length != 0) {
      let num = randomCard(card.value);
      cardOfbotShow.value.push(num)
      //make card of bot use for calculator = card of bot use for show, trim index 0 of card of bot use for show
      cardOfbotCal.value = [firstofBot.value, ...cardOfbotShow.value.slice(1)];
      card.value.splice(card.value.indexOf(num), 1)
      turn.value = 0;
      isChoose.value = false;
      red.value = ''
    }
  }, 3000)
}
//if Bot choose Stop
function BotStop() {
  //tell to player that bot choose this 
  setTimeout(() => {
    red.value = 'color:red'
  }, 3000)
  //seem player click Stop
  setTimeout(() => {
    red.value = ''
    turn.value = 0;
    isChoose.value = false;
    //if player click stop and bot choose stop
    if (isBotStop.value == isPlayerStop.value) {
      turn.value = 2;//change to turn of result
    }
  }, 6000)
}
//when click start new round
const nextRound = () => {
  round.value++
  card.value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  cardOfplayer.value = []
  cardOfbotShow.value = ['?']
  cardOfbotCal.value = []
  turn.value = 0
  isBotStop.value = undefined
  isPlayerStop.value = undefined
  Start()
}
//use for show tag html 
const play = () => {
  isPlay.value++
  if (isPlay.value == 2) {
    Start();// call function for start game
  }
}
//use to alert empty name
const go = (playerName) => {
  (playerName == '' ? alert("Please enter your name !") : play())
}
const winGame = (scoreplayer, scorebot) => {
  if (scoreplayer == 2) {
    GameField.value = false
    return player.name
  }
  else if (scorebot == 2) {
    GameField.value = false
    return bot.name
  }
}
const restartGame = (defaultValue) => {
  card.value = defaultValue.card;
  cardOfplayer.value = defaultValue.cardOfplayer;
  cardOfbotShow.value = defaultValue.cardOfbotShow;
  cardOfbotCal.value = defaultValue.cardOfbotCal
  turn.value = defaultValue.turn
  GameField.value = defaultValue.GameField
  player.score = defaultValue.playerscore
  player.round = defaultValue.playerround
  bot.score = defaultValue.botscore
  bot.round = defaultValue.botround
  isBotStop.value = defaultValue.isBotStop
  isPlayerStop.value = defaultValue.isPlayerStop
  round.value = defaultValue.round
  Start()
}

</script>

<template>
  <div class="body">
    <div class="beforegame" v-show="isPlay !== 2">
    <ButtonPlay 
    :isPlay="isPlay" 
    @play="play" v-show="isPlay===0"/>
      <InputName 
      :player="player" 
      :isPlay="isPlay" 
      @go="go" v-show="isPlay===1"/>
    </div>
    <div class="gameplay" v-show="isPlay == 2">
      <RuleGame/>
      <div class="field-game" v-show="GameField">
        <ButtonHistory 
        :player="player" 
        :bot="bot"/>
        <p class="score-board">
          Score Board
          <br />
          <a style="color: #EDE682;">{{ player.name.charAt(0) }}</a>
          | {{ player.score }} : {{ bot.score }} |
          <a style="color: #EA99D5;">{{bot.name.charAt(0)}}</a>
          <br />
          Round : {{ round }}
        </p>
        <Com :cardOfbot=
        "{Show:cardOfbotShow,
        Cal:cardOfbotCal,
        FirstCard:firstofBot}" :bot="bot" :turn="turn"/>
        <div class="center">
          <p v-show="isChoose" class="text-choose">
            <span :style="sumOfbot < 18 ? red : ''">DRAW</span> :
            <span :style="sumOfbot < 18 ? '' : red">STAY</span>
          </p>
          <p :style="centerStyle" v-if="turn == 0">
            Turn Of
            <a style="color: #EDE682;">{{ player.name }} ($500)</a>
          </p>
          <p :style="centerStyle" v-else-if="turn == 1">
            Turn Of
            <a style="color: #EA99D5;">{{ bot.name }} ($600)</a>
          </p>
          <div v-else>
            <ButtonNextRound :sum="{player:sumOfplayer,bot:sumOfbot}"
            :player="player" 
            :bot="bot" 
            :turn="turn"
            @nextround="nextRound"/>
          </div>
        </div>
        <Player 
        :player="player" 
        :cardOfplayer="cardOfplayer" 
        :turn="turn"
        @drawn="PlayerDrawn" 
        @stay="PlayerStop" />
      </div>
    </div>
    <div class="beforegame" v-show="GameField == false">
      <div class="final-field">
        <ShowResult :player="player" :bot="bot"/>
        <div class="winnerGame">THE WINNER IS {{ winGame(player.score, bot.score) }} !!!!!!</div>
        <ButtunFinalField @restartgame="restartGame"/>
      </div>
    </div>
  </div>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap");



.body {
  background-color: #0b5345;
  color: white;
  font-family: "Jost", sans-serif;
  background-size: cover;
  z-index: 2;
  position: absolute;
  top: 20;
  left: 0;
  right: 0;
  padding-bottom: 11.75rem;
}
.beforegame {
  background-color: #0b5345;
  color: white;
  font-family: "Jost", sans-serif;
  height: 81.30vh;
  padding-bottom: 11.75rem;
}
.winnerGame {
  font-size: 60px;
  font-weight: 700;
  text-align: center;
  padding-top: 3%;
  padding-bottom: 3%;
}

.gameplay {
  padding-left: 5%;
}
.final-field {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.score-board {
  font-size: 26px;
  text-align: center;
}
.center {
  text-align: center;
  padding-top: 20px;
}

.text-choose {
  font-size: 30px;
}
</style>
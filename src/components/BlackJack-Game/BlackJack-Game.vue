<script setup>
import { computed, reactive, ref } from 'vue';
import ButtonPlay from './Front-Game/ButtonPlay.vue';
import InputName from './Front-Game/InputName.vue';
import RuleGame from './Field-Game/RuleGame.vue';
import ButtonHistory from './Field-Game/ButtonHistory.vue';
import Player from './Field-Game/Player.vue';
import Com from './Field-Game/Com.vue';
import ButtonNextRound from './Field-Game/ButtonNextRound.vue';
import ShowResult from './Final-Field/ShowResult.vue';
import ButtunFinalField from './Final-Field/Buttun-Final-Field.vue';

const centerStyle = "font-size: 25px; margin-top: 2%; font-weight: 600"
//Original Card
const card = ref([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
//function randomCard
function randomCard(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}
const checkLogin = () => {
    if(localStorage.getItem("user") == null){
      window.location.href = "/#/login"
    }
}
checkLogin()
const randomItem =()=>{
    return Math.floor(Math.random() * 12)+1;
}

//Item
const itemOfPlayer=ref([])
const itemOfBot=ref([])

//Oject of Player
const player = reactive({ name: '', score: 0, round: []})
const bot = reactive({ name: 'Computer', score: 0, round: []})
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

  itemOfPlayer.value= Item();
  itemOfBot.value= Item();
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
  //seem player clink drawn crad
  setTimeout(() => {
    if (card.value.length != 0) {
      let num = randomCard(card.value);
      cardOfbotShow.value.push(num)
      cardOfbotCal.value = [firstofBot.value, ...cardOfbotShow.value.slice(1)];
      card.value.splice(card.value.indexOf(num), 1)
      turn.value = 0;
    }
  }, 3000)
}

function BotStop() {
  setTimeout(() => {
    turn.value = 0;
    if (isBotStop.value == isPlayerStop.value) {
      turn.value = 2;//change to turn of result
    }
  }, 3000)
}
//when click start new round
const oldsumofplayer=ref([]);
const oldsumofbot=ref([])
const nextRound = (s) => {
  oldsumofplayer.value.push(s[0])
  oldsumofbot.value.push(s[1])
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
const dataFetch = ref({})
const userId = ref(0);
const getProfile = async () => {
  userId.value = localStorage.getItem("userId")
  await fetch(`http://localhost:9000/profile/${userId.value}`, {
    method: "GET",
  }).then((res) => res.json()).then(data => {
      dataFetch.value = data;
    });
};
const increaseScore = async () => {
  await dataFetch.value.score.blackjack++
  await fetchUpdateScore()
}
const fetchUpdateScore = async () => {
  await fetch(`http://localhost:9000/profile/${userId.value}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      displayname: dataFetch.value.displayname,
      user: dataFetch.value.user,
      password: dataFetch.value.password,
      email: dataFetch.value.email,
      score: dataFetch.value.score,
    }),
  })
    .then((resdata) => resdata.json())
    .then((data) => (dataFetch.value = data))
};

const getProfileAndIncreaseScore = async () => {
  await getProfile();
  await increaseScore();
}
const winGame = (scoreplayer, scorebot) => {
  if (scoreplayer === 2) {
    GameField.value = false
    getProfileAndIncreaseScore();
    return player.name
  }
  else if (scorebot === 2) {
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

const textUse=ref("")
const isUse=ref(false)

const UseItem=(c)=>{
  isUse.value=true
  textUse.value=`Player Use ITEM`
  setTimeout(()=>{
    if(card.value.includes(c)){
      card.value.splice(card.value.indexOf(c), 1)
      cardOfplayer.value.push(c);
      isUse.value=false
      textUse.value=""
    }
    else{
      textUse.value=`Not Have ${c} in Original Card`
      setTimeout(()=>{textUse.value=""},2000)
    }
  },3000)
}

const Item=()=>{
  return [
randomItem(),
randomItem(),
randomItem(),
randomItem(),
randomItem(),
randomItem()
  ]
}


</script>

<template>
  <div class="body">
    <div class="beforegame" v-show="isPlay !== 2">
    <ButtonPlay @play="play" v-show="isPlay===0"/>
      <InputName :player="player" :isPlay="isPlay" @go="go" v-show="isPlay===1"/>
    </div>
    <div class="gameplay" v-show="isPlay == 2">
      <RuleGame/>
      <div class="field-game" v-show="GameField">
        <ButtonHistory 
        :player="player" 
        :bot="bot"
        :sum="{player:oldsumofplayer,bot:oldsumofbot}"/>
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
        FirstCard:firstofBot}" 
        :bot="bot" 
        :turn="turn"
        :items="itemOfBot"/>
        <div class="center">
          <p :style="centerStyle" v-if="turn === 0">
            Turn Of
            <a style="color: #EDE682;">{{ player.name }}</a><br>
            <span v-show="isUse" style="color: red;">{{textUse}}</span>
          </p>
          <p :style="centerStyle" v-else-if="turn === 1">
            Turn Of
            <a style="color: #EA99D5;">{{ bot.name }}</a>
          </p>
          <div v-else>
            <ButtonNextRound :sum="{player:sumOfplayer,bot:sumOfbot}"
            :player="player" 
            :bot="bot" 
            @nextround="nextRound"
            v-show="turn === 2"/>
          </div>
        </div>
        <Player 
        :player="player" 
        :cardOfplayer="cardOfplayer"
        :turn="turn"
        :items="itemOfPlayer"
        @drawn="PlayerDrawn" 
        @stay="PlayerStop"
        @item="UseItem"/>
      </div>
    </div>
    <div class="beforegame" v-show="GameField === false">
      <div class="final-field">
        <ShowResult :player="player" :bot="bot"
        :sum="{player:oldsumofplayer,bot:oldsumofbot}"/>
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
  font-size: 50px;
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
  margin-top: 3%;
}

.text-choose {
  font-size: 30px;
}
</style>
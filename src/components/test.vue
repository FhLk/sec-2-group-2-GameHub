<script setup>
import { computed, reactive, ref } from 'vue';

//Original Card
const card=ref([1,2,3,4,5,6,7,8,9,10,11,12]);
const cardCheat=[9,10,11,12];

//function randomCard
function randomCard(arr){
  return arr[Math.floor(Math.random()*arr.length)];
}

//Oject of Player
const player=reactive({name:'',score:0,round:[]})
const bot=reactive({name:'',score:0,round:[]})

//Card of Player
const cardOfplayer=ref([])

//Card of Bot 
const cardOfbotShow=ref(['?']) //use for Show
const cardOfbotCal=ref([]);// use for calculator

//use with tag html for show
const turn=ref(0); // use for change turn between player and bot (turn of player is 0, turn of bot is 1)
const isChoose=ref(false);// when bot thinking of choose
const isBotStop=ref();// when bot choose 'Stop' = true
const isPlayerStop=ref();// when player choose 'Stop' = true
const GameField=ref(true)
const isPlay=ref(0);//when Start this web

let red=ref('');// ux of bot

let firstofBot=ref();// first card of bot (use 'ref()' because it to be calculator on html)
let secondofBot;// second card of bot
let firstofPlayer;//first card of player
let secondofPlayer;//second card of player 
let round=ref(1)

//Calculator card of player
const sumOfplayer=computed(()=>{
  return cardOfplayer.value.reduce((p,c)=>{
    return p+c},0)
});

//Calculator card of bot
const sumOfbot=computed(()=>{
  return cardOfbotCal.value.reduce((p,c)=>{return p+c},0)
});

//when start first time this web-page
function Start(){ 
  if(bot.name.toLocaleLowerCase()=="gao"){
    firstofBot.value=randomCard(cardCheat)
    cardOfbotCal.value.push(firstofBot.value)
    card.value.splice(card.value.indexOf(firstofBot.value),1)
    
    secondofBot=21-firstofBot.value
    cardOfbotCal.value.push(secondofBot);//add card to card of bot use for show 
    cardOfbotShow.value.push(secondofBot);//add card to card of bot use for calculator
    card.value.splice(card.value.indexOf(secondofBot),1)
  }
  else{
firstofBot.value = randomCard(card.value)//get first card of bot
cardOfbotCal.value.push(firstofBot.value)//add card to card of bot use for calculator
card.value.splice(card.value.indexOf(firstofBot.value),1)// Remove card from original card
secondofBot = randomCard(card.value)//get second card of bot
cardOfbotCal.value.push(secondofBot);//add card to card of bot use for show 
cardOfbotShow.value.push(secondofBot);//add card to card of bot use for calculator
card.value.splice(card.value.indexOf(secondofBot),1)// Remove card from original card
  }

//player seem bot
firstofPlayer = randomCard(card.value)
card.value.splice(card.value.indexOf(firstofPlayer),1)
cardOfplayer.value.push(firstofPlayer)
secondofPlayer = randomCard(card.value)
cardOfplayer.value.push(secondofPlayer)
card.value.splice(card.value.indexOf(secondofPlayer),1)
}

const CheckName=(playerName,BotName)=>{
  if(playerName==''&&BotName==''){
    return true
  }
  else{
    return false
  }
}

//Game play of player
//when player clink Drawn
const PlayerDrawn=()=>{
  if(card.value.length!=0){// if orifinal card not empty
    isPlayerStop.value=false;// assigned 'isPlayerStop' use for any process
    let num=randomCard(card.value);//get card from random original card
    cardOfplayer.value.push(num)//add card to card of player
    card.value.splice(card.value.indexOf(num),1)// Remove card from original card
    turn.value=1;//change turn to bot
    Bot();//bot turn
  }
}
//when player clink Stop
const PlayerStop =()=>{
  isPlayerStop.value=true;// assigned 'isPlayerStop' use for any process
  turn.value=1;//change turn to bot
  if(isPlayerStop.value==isBotStop.value){//if player click stop and bot choose stop
    turn.value=2//change to turn of result
  }
  else{
    Bot();//bot turn 
  }
}

//Game play of Bot
function Bot(){
  isChoose.value=true;//assigned 'isChoose' use for show tag html
  //Check condition
  if(sumOfbot.value<18){// if Calculator card of bot less than 18
    BotDrawn();//Bot Choose Drawn
    isBotStop.value=false//assigned 'isBotStop' use for process
  }
  else{//if more than 18
    BotStop();//Bot choose Stop
    isBotStop.value=true;//assigned 'isBotStop' use for process
  }
}

//if Bot choose Drawn
function BotDrawn(){
  //tell to player that bot choose this 
  setTimeout(()=>{
    red.value='color:red'//change font-color to red
  },3000)

  //seem player clink drawn crad
  setTimeout(()=>{
    if(card.value.length!=0){
      let num=randomCard(card.value);
      cardOfbotShow.value.push(num)

      //make card of bot use for calculator = card of bot use for show, trim index 0 of card of bot use for show
      cardOfbotCal.value=[firstofBot.value,...cardOfbotShow.value.slice(1)];

      card.value.splice(card.value.indexOf(num),1)
      turn.value=0;
      isChoose.value=false;
      red.value=''
    }
  },6000)
}

//if Bot choose Stop
function BotStop(){
  //tell to player that bot choose this 
  setTimeout(()=>{
    red.value='color:red'
  },3000)

  //seem player click Stop
  setTimeout(()=>{
    red.value=''
    turn.value=0;
    isChoose.value=false;

    //if player click stop and bot choose stop
    if(isBotStop.value==isPlayerStop.value){
      turn.value=2;//change to turn of result
    }

  },6000)
}

//find the winner this round
const winnerRound=ref('')
//Get Sum of Bot and player to find winner this round 
const winRound=(sumOfplayer,sumOfbot)=>{
  //check condition and assigned value to 'winnerRound'
  if(sumOfplayer > 21 && sumOfbot > 21 ){
    winnerRound.value='Drawn'
    return 'Drawn';
  }

  if(sumOfplayer>sumOfbot && sumOfplayer <= 21 ){
    winnerRound.value=player.name
    return player.name
  }
  else if(sumOfplayer>sumOfbot && sumOfplayer > 21){
    winnerRound.value=bot.name
    return bot.name
  }

  if(sumOfplayer<sumOfbot && sumOfbot <=21){
    winnerRound.value= bot.name
    return bot.name;
  }
  else if(sumOfplayer<sumOfbot && sumOfbot > 21){
    winnerRound.value=player.name
    return player.name
  }
  else{
    winnerRound.value='Drawn'
    return'Drawn';
  }
}

//when click start new round
const nextRound=()=>{
  round.value++
  //increase score from check condition by name 
  if(winnerRound.value==player.name){
    player.score++
    player.round.push("Win")
    bot.round.push("Lose")
  }
  else if(winnerRound.value==bot.name){
    bot.score++
    player.round.push("Lose")
    bot.round.push("Win")
  }
  else{
    player.round.push("Drawn")
    bot.round.push("Drawn")
  }
  //reset value and restart round
  card.value=[1,2,3,4,5,6,7,8,9,10,11,12];
  cardOfplayer.value=[]
  cardOfbotShow.value=['?']
  cardOfbotCal.value=[]
  turn.value=0
  isBotStop.value=undefined
  isPlayerStop.value=undefined
  Start() 
}

//use for show tag html 
const play=()=>{
  isPlay.value++
  if(isPlay.value==2){
    Start();// call function for start game
  }
}

const winGame=(scoreplayer,scorebot)=>{
  if(scoreplayer == 2){
    GameField.value=false
    return player.name
  }
  else if(scorebot==2){
    GameField.value=false
    return bot.name
  }
}

const restartGame=()=>{
  card.value=[1,2,3,4,5,6,7,8,9,10,11,12];
  cardOfplayer.value=[]
  cardOfbotShow.value=['?']
  cardOfbotCal.value=[]
  turn.value=0
  GameField.value=true
  player.score=0
  player.round=[]
  bot.score=0
  bot.round=[]
  isBotStop.value=undefined
  isPlayerStop.value=undefined
  round.value=1
  Start()
}

const endGame=()=>{
  location.reload();
}
</script>
 
<template>
  <div class="body">
    <div class="playbuttondiv">
      <button @click="play" v-show="isPlay == 0" class="playbutton">
        Play
      </button>
    </div>
    <div class="field-name" v-show="isPlay == 1">
      <div class="field-name-text">
        <p class="field-name-text-text">Player Name:</p>
        <input
          type="text"
          placeholder="Player Name...."
          v-model="player.name"
        />
      </div>
      <div class="field-name-text">
        <p class="field-name-text-text">Bot Name:</p>
        <input
          type="text"
          placeholder="Bot Name...."
          v-model="bot.name"
          class="field-name-text-text-input"
        />
      </div>
      <div class="ok-button-div">
        <button @click="play" class="ok-button" :disabled="CheckName(player.name,bot.name)">OK</button>
      </div>
    </div>

    <div class="gameplay" v-show="isPlay == 2">
      <div class="field-game" v-show="GameField">
        <p class="score-board">
          Score Board 
          <div>
            {{ player.name }} | {{ player.score }}:{{ bot.score }} | {{ bot.name }}
            </div>
            <div>Round {{round}}</div>
        </p>
        <p class="player-score">
          {{ bot.name }}:
          {{ turn == 2 ? sumOfbot : sumOfbot - firstofBot }}
        </p>
        <div v-if="turn == 2" class="card-card-div">
          <div v-for="card in cardOfbotCal" :key="card" class="card-card">
            <p class="card-card-text">{{ card }}</p>
          </div>
        </div>
        <div v-else class="card-card-div">
          <div v-for="card in cardOfbotShow" :key="card" class="card-card">
            <p class="card-card-text">{{ card }}</p>
          </div>  
        </div>
        <div class="center">
          <p v-show="isChoose" class="text-choose">
            <span :style="sumOfbot < 18 ? red : ''">Drawn</span>:<span
              :style="sumOfbot < 18 ? '' : red"
              >Stop</span
            >
          </p>
          <p v-if="turn == 0">-----Turn Of {{player.name}}-----</p>
          <p v-else-if="turn == 1">-----Turn Of {{bot.name}}-----</p>
          <div v-else>
            <p>-----Result-----</p>
            <div class="winnerRound" v-show="turn == 2">
              THE WINNER THIS ROUND IS
              {{ winRound(sumOfplayer, sumOfbot) }}
            </div>
            <button @click="nextRound" v-show="turn == 2" class="button-next">Next Round</button>
          </div>
        </div>
        <div class="button-choose-player-div">
          <button
            v-show="turn == 0"
            @click="PlayerDrawn"
            class="button-choose-player-left"
          >
            Drawn
          </button>
          <button
            v-show="turn == 0"
            @click="PlayerStop"
            class="button-choose-player-right"
          >
            Stop
          </button>
        </div>
        <p class="player-score">{{ player.name }}: {{ sumOfplayer }}</p>
        <div class="card-card-div">
          <div v-for="card in cardOfplayer" :key="card" class="card-card">
            <p class="card-card-text">{{ card }}</p>
          </div>
        </div>
      </div>
      <p v-show="player.round.length !=0">History Round
  <ul>
    {{player.name}}
    <li v-for="(result,index) in player.round" :key="index">Round {{index+1}} : {{result}}
      <span v-if="result=='Win'">Score : +1</span>
      <span v-else>Score +0</span>
    </li>
    {{bot.name}}
     <li v-for="(result,index) in bot.round" :key="index">Round {{index+1}} : {{result}}
      <span v-if="result=='Win'">Score : +1</span>
      <span v-else>Score +0</span>
    </li>
  </ul>
</p>
<div class="final-field" v-show="GameField==false">
<p class="score-board">
          <div>
            {{ player.name }} | {{ player.score }} - {{ bot.score }} | {{ bot.name }}
            </div>
        </p>
<div class="winnerGame">
  THE WINNER GAME IS {{winGame(player.score,bot.score)}} !!!!!!
</div>
<button @click="restartGame">Play Agian</button>
<button @click="endGame">End Game</button>
</div>
    </div>
  </div>

</template>
 
<style scoped>
.body {
  height: 100vh;
}
.playbutton {
  background-color: #2da042;
  color: white;
  border: white 5px solid;
  border-radius: 20px;
  width: 300px;
  height: 150px;
  margin-top: 30vh;
  font-size: 30px;
}
.playbuttondiv {
  display: flex;
  justify-content: center;
}
.field-name {
  width: 100vw;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.field-name-text {
  margin-top: 3rem;
  display: flex;
  justify-content: center;
  align-content: center;
}
.field-name-text-text {
  margin-top: 1rem;
  margin-right: 20px;
}
.field-name-text-text-input {
  margin-left: 11px;
}
.ok-button-div {
  margin-top: 2rem;
  display: flex;
  justify-content: center;
}
.ok-button {
  width: 100px;
  height: 50px;
  background-color: #2da042;
  color: white;
  border: white 5px solid;
  border-radius: 20px;
}
.score-board {
  font-size: 26px;
}
.card-card {
  font-size: 50px;
  text-align: center;
  width: 150px;
  height: 200px;
  border: 2px solid black;
}
.card-card-div {
  display: flex;
  justify-content: space-evenly;
}
.card-card-text {
  margin-top: 55px;
}
.player-score {
  font-size: 30px;
}
.button-choose-player-div {
  display: flex;
  justify-content: center;
}
.button-choose-player-left {
  width: 120px;
  height: 70px;
  color: white;
  border: white 5px solid;
  border-radius: 10px;
  background-color: #2da042;
}
.button-choose-player-right {
  width: 120px;
  height: 70px;
  color: white;
  border: white 5px solid;
  background-color: #b51010;
  border-radius: 10px;
  margin-left: 100px;
}
.center {
  text-align: center;
}
.text-choose {
  font-size: 30px;
}
.button-next {
  width: 120px;
  height: 70px;
  color: white;
  border: white 5px solid;
  border-radius: 10px;
  background-color: #2da042;
}
</style>
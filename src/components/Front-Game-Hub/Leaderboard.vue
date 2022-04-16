<script setup>
import {ref, onBeforeMount} from 'vue'
const dataFetch = ref([])

const getAllProfile= async ()=>{
    const res =await fetch('http://localhost:9000/profile')
    dataFetch.value= await res.json()
}
const dataFetchSortBlackjack = ref([])
const dataBlackjack = ref([])

const sortBlackjack = async () => {
    dataFetchSortBlackjack.value = dataFetch.value.sort((a,b)=>{return b.score.blackjack-a.score.blackjack})
    dataBlackjack.value.push(dataFetchSortBlackjack.value[0])
    dataBlackjack.value.push(dataFetchSortBlackjack.value[1])
    dataBlackjack.value.push(dataFetchSortBlackjack.value[2])
}

const dataFetchSortMatching = ref([])
const dataMatching=ref([])
const sortMatching = async () => {
    dataFetchSortMatching.value = dataFetch.value.sort((a,b)=>{return b.score.matching-a.score.matching})
    dataMatching.value.push(dataFetchSortMatching.value[0])
    dataMatching.value.push(dataFetchSortMatching.value[1])
    dataMatching.value.push(dataFetchSortMatching.value[2])

}
onBeforeMount(async() => {
    await getAllProfile()
    await sortBlackjack()
    await sortMatching()
})
const showBlackjackOrMatching = ref(true)
const changeBlackToMatch = () => {
    showBlackjackOrMatching.value = false
}
const changeMatchToBlack = () => {
    showBlackjackOrMatching.value = true
}
</script>
 
<template>

<div class="leader-board">
    <img src="/images/leaderBoard2.png" height="70" class="img" >
    <div class="select">
        <button @click="changeMatchToBlack" id="blackjack" class="btn">Blackjack</button>
        <button @click="changeBlackToMatch" id="match" class="btn">Matching</button>
    </div>
    <div v-if="showBlackjackOrMatching == true" class="display-score">
        <h1 v-for="(data, index ) in dataBlackjack">
            <a v-if="index+1 == 1"><img src="https://api.iconify.design/noto/1st-place-medal.svg?width=50"></a>
            <a v-if="index+1 == 2"><img src="https://api.iconify.design/noto/2nd-place-medal.svg?width=50"></a>
            <a v-if="index+1 == 3"><img src="https://api.iconify.design/noto/3rd-place-medal.svg?width=50"></a>
            อันดับที่ {{ index+1 }} {{data.displayname}} คะแนน {{data.score.blackjack}}
        </h1>
    </div>
    <div v-if="showBlackjackOrMatching == false" class="display-score">
        <h1 v-for="(data, index ) in dataMatching">
            <a v-if="index+1 == 1"><img src="https://api.iconify.design/noto/1st-place-medal.svg?width=50"></a>
            <a v-if="index+1 == 2"><img src="https://api.iconify.design/noto/2nd-place-medal.svg?width=50"></a>
            <a v-if="index+1 == 3"><img src="https://api.iconify.design/noto/3rd-place-medal.svg?width=50"></a>
            อันดับที่ {{ index+1 }} {{data.displayname}} คะแนน {{data.score.matching}}
        </h1>
    </div>
</div>
</template>
 
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap');

.leader-board{
    background-color: #f1f1f1;
    padding-bottom:50vh;
    font-family: 'Kanit', sans-serif;
}
.display-score{
    text-align: center;

}
.select{
    display:flex;
    justify-content: center;

}
.btn{
    cursor: pointer;
    font-family: 'Kanit', sans-serif;
    font-size: 20px;
    margin-right: 5%;
    margin-left: 5%;
    margin-top: 3%;
    margin-bottom: 2%;
    padding: 14px 28px;
    border-radius: 5px;
}
#blackjack{
    background-color: #0b5345;
    color: white;
}
#blackjack:hover{
    background-color: #4fa35d;
}
#match{
    background-color: #552969;
    color: white;
}
#match:hover{
    background-color: #8d5fa1;
}
.img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 70;
    padding-top: 2%;
}
</style>
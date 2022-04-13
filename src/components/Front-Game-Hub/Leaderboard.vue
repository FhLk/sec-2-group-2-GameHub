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
<div>
    <div class="select">
        <button @click="changeMatchToBlack">Blackjack</button>
        <button @click="changeBlackToMatch">Matching</button>
    </div>
 <div v-if="showBlackjackOrMatching == true" class="display-score">
        <h1 v-for="(data, index ) in dataBlackjack">อันดับที่ {{ index+1 }} {{data.displayname}} คะแนน {{data.score.blackjack}}</h1>
    </div>
    <div v-if="showBlackjackOrMatching == false" class="display-score">
        <h1 v-for="(data, index ) in dataMatching">อันดับที่ {{ index+1 }} {{data.displayname}} {{data.score.matching}}</h1>
    </div>
</div>
</template>
 
<style scoped>
.display-score{
    text-align: center;
}
.select{
    display:flex;
    justify-content: center;
}
</style>
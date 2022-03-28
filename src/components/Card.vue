<script setup>
defineEmits('selectCard')
const props = defineProps({
    matched:{
        type: Boolean,
        default: false
    },
    position:{
        type: Number,
        require: true
    },
    value:{
        type:Number,
        require: true
    },
    visible:{
        type:Boolean,
        default: false
    }

})

</script>
 
<template>
<div class="card" @click="$emit('selectCard',{position: props.position, faceValue:props.value})">
    <div v-if="visible" class="card-face is-front">
        {{value}} - {{position}} - {{matched}}
    </div>
    <div v-else class="card-face is-back">
        Back
    </div>
</div>
</template>
 
<style>
.card{
    border: 5px solid #CCC;
    position: relative;
}
.card-face{
    width: 100%;
    height: 100%;
    position: absolute;
}
.card-face.is-front{
    background-color: red;
    color: white;
}
.card-face.is-back{
    background-color: blue;
    color: white;
}
</style>
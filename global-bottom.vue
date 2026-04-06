<template>
  <div class="aura-bg-global">
    <div class="aura aura-1" :style="pos[0]" />
    <div class="aura aura-2" :style="pos[1]" />
    <div class="aura aura-3" :style="pos[2]" />
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { useNav } from '@slidev/client'

const { currentPage } = useNav()

function randomOffsetUnit() {
  return Math.floor(Math.random() * 100) - 10
}

function randomTransform() {
  return {
    transform: `translate(${randomOffsetUnit()}vw, ${randomOffsetUnit()}vh)`,
  }
}

function randomTriple() {
  return [randomTransform(), randomTransform(), randomTransform()]
}

const pos = ref(randomTriple())

watch(currentPage, () => {
  pos.value = randomTriple()
})

</script>

<style scoped>
.aura-bg-global {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: -1;
  overflow: hidden;
  background: #f4f3ef; /* Off-white theme background */
}

.aura {
  position: absolute;
  border-radius: 9999px;
  filter: blur(120px); /* Larger blur for softer look */
  opacity: 0.6;
  mix-blend-mode: multiply; /* Better for light backgrounds */
  transition: transform 1.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.aura-1 { width: 600px; height: 300px; background: #6dd5ed; } /* Light cyan/blue */
.aura-2 { width: 500px; height: 400px; background: #2193b0; } /* Mid blue */
.aura-3 { width: 700px; height: 250px; background: #0052D4; } /* Dark blue */
</style>

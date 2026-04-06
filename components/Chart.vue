<template>
  <Bar
    :data="chartData"
    :options="chartOptions"
  />
</template>

<script setup>
import { computed } from 'vue'
import { Bar } from 'vue-chartjs'
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
} from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const props = defineProps({
  data: {
    type: Object,
    required: true
  },
  options: {
    type: Object,
    default: () => ({})
  }
})

const chartData = computed(() => props.data)
const chartOptions = computed(() => ({
  responsive: true,
  maintainAspectRatio: false,
  devicePixelRatio: 4, 
  ...props.options
}))
</script>

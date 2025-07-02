<template>
  <div class="analytics-wrapper">
    <button class="back-button" @click="goBack">← Back to Atlas</button>

    <h2 class="page-title">Analytics</h2>
    <div class="tab-bar-wrapper">
      <div class="tab-bar">
        <button class="tab" :class="{ active: activeTab === 'cluster' }">Clusteranalysis</button>
        <button class="tab" :class="{ active: activeTab === 'comparison' }">Comparison by Regions</button>
        <button class="tab" :class="{ active: activeTab === 'time' }">Time course</button>
      </div>
    </div>

    <div class="main-layout">
      <div class="chart-panel">
        <ECharts :option="chartOptions" class="chart" />
        <div class="chart-controls">
          <button class="icon">⏮</button>
          <button class="icon">▶️</button>
          <button class="icon">⏭</button>
          <input type="range" min="0" max="100" class="slider" />
        </div>
      </div>

    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from '#app'
import ECharts from 'vue-echarts'
import { use } from 'echarts/core'
import { ScatterChart } from 'echarts/charts'
import { TooltipComponent, LegendComponent, TitleComponent, GridComponent } from 'echarts/components'
import { CanvasRenderer } from 'echarts/renderers'

use([ScatterChart, TooltipComponent, LegendComponent, TitleComponent, GridComponent, CanvasRenderer])

const router = useRouter()
function goBack() {
  router.push('/atlas')
}

const activeTab = ref('cluster')

const labelStyle = {
  show: true,
  position: 'right',
  distance: 2,
  color: '#9ca3af',
  fontSize: 12
}

const chartOptions = {
  backgroundColor: '#000',
  title: {
    text: 'Clusteranalyse – Hirnaktivität bei Handbewegung',
    left: 'center',
    textStyle: { color: '#fff' }
  },
  tooltip: {
    trigger: 'item',
    formatter: function (params) {
      return `PCA1: ${params.value[0]}<br/>PCA2: ${params.value[1]}`
    }
  },
  legend: {
    data: ['Cluster 1', 'Cluster 2', 'Cluster 3'],
    bottom: 10,
    textStyle: { color: '#fff' }
  },
  xAxis: {
    name: 'PCA 1',
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' },
    splitLine: { lineStyle: { color: '#444' } }
  },
  yAxis: {
    name: 'PCA 2',
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' },
    splitLine: { lineStyle: { color: '#444' } }
  },
  series: [
    {
      name: 'Cluster 1',
      type: 'scatter',
      data: [
        { name: 'Insula (Körperwahrnehmung)', value: [-0.7, 0.25], label: { ...labelStyle } },
        { name: 'Okzipital (visuell)', value: [-0.4, -0.3], label: { ...labelStyle } },
        { name: 'Kleinhirn', value: [-0.1, -0.02], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#facc15' }
    },
    {
      name: 'Cluster 2',
      type: 'scatter',
      data: [
        { name: 'M1 (primär motorisch)', value: [0.6, -0.2], label: { ...labelStyle } },
        { name: 'S1 (somatosensorisch)', value: [0.9, 0.1], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#fb7185' }
    },
    {
      name: 'Cluster 3',
      type: 'scatter',
      data: [
        { name: 'PMC (prämotorisch)', value: [0.1, 0.6], label: { ...labelStyle } },
        { name: 'SMA (supplementär-motorisch)', value: [0.2, 0.15], label: { ...labelStyle } },
        { name: 'PPC (parietal)', value: [-0.2, -0.05], label: { ...labelStyle } },
        { name: 'Präfrontal (Planung)', value: [0.0, -0.35], label: { ...labelStyle } },
        { name: 'Basalganglien', value: [0.0, -0.2], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#38bdf8' }
    }
  ]
}
</script>

<style scoped>
.analytics-wrapper {
  background: #000;
  color: white;
  padding: 40px;
  min-height: 100vh;
  font-family: sans-serif;
}

.back-button {
  position: relative;
  margin-bottom: 20px;
  background-color: #374151;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 8px;
  cursor: pointer;
}

.back-button:hover {
  background-color: #4b5563;
}

.page-title {
  font-size: 24px;
  margin-bottom: 16px;
}

.tab-bar-wrapper {
  display: inline-block;
  padding: 4px;
  background: transparent;
  border: 1px solid white;
  border-radius: 999px;
  margin-bottom: 32px;
}

.tab-bar {
  display: flex;
  gap: 2px;
}

.tab {
  background: transparent;
  border: none;
  color: white;
  padding: 6px 16px;
  border-radius: 999px;
  cursor: pointer;
  font-size: 14px;
}

.tab.active {
  background: white;
  color: black;
}

.main-layout {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 40px;
}

.chart-panel {
  background: #1a1a1a;
  padding: 16px;
  border-radius: 8px;
  flex: 1;
  max-width: 720px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.chart {
  width: 100%;
  height: 480px;
  margin-bottom: 24px;
}

.chart-controls {
  display: flex;
  align-items: center;
  gap: 12px;
}

.icon {
  background: none;
  border: none;
  font-size: 18px;
  color: #fff;
  background-color: #1f2937;
  border-radius: 6px;
  padding: 6px 10px;
  cursor: pointer;
}

.slider {
  flex: 1;
  appearance: none;
  height: 4px;
  background: #9ca3af;
  border-radius: 2px;
  outline: none;
  transition: background 0.2s ease;
}
</style>

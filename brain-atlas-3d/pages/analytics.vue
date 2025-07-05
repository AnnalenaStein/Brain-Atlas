<template>
  <div class="analytics-wrapper">
    <button class="back-button" @click="goBack">← Back to Atlas</button>

    <h2 class="page-title">Analytics</h2>

    <div class="main-layout">
      <div class="left-panel">
        <AnalyticsPanel />
      </div>

      <div class="chart-panel">
        <div class="tab-bar-wrapper">
          <div class="tab-bar">
            <button class="tab" :class="{ active: activeTab === 'cluster' }" @click="activeTab = 'cluster'">Clusteranalysis</button>
            <button class="tab" :class="{ active: activeTab === 'comparison' }" @click="activeTab = 'comparison'">Comparison by Regions</button>
            <button class="tab" :class="{ active: activeTab === 'time' }" @click="activeTab = 'time'">Time course</button>
          </div>
        </div>

        <ECharts :option="chartOptions" class="chart" />
      </div>

      <div class="right-panel">
        <InsightPanel />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from '#app'
import ECharts from 'vue-echarts'
import AnalyticsPanel from '~/components/AnalyticsPanel.vue'
import InsightPanel from '~/components/InsightPanel.vue'

import { use } from 'echarts/core'
import { ScatterChart } from 'echarts/charts'
import { TooltipComponent, LegendComponent, TitleComponent, GridComponent } from 'echarts/components'
import { CanvasRenderer } from 'echarts/renderers'

use([ScatterChart, TooltipComponent, LegendComponent, TitleComponent, GridComponent, CanvasRenderer])

const router = useRouter()
const activeTab = ref('cluster')

function goBack() {
  router.push('/atlas')
}

// Label style – dauerhaft sichtbar
const labelStyle = {
  show: true,
  formatter: (params) => params.name,
  position: 'top',
  distance: 8,
  color: '#9ca3af',
  fontSize: 12
}

const chartOptions = {
  backgroundColor: '#000',
  tooltip: {
    trigger: 'item',
    formatter: (params) => `
      <strong>${params.name}</strong><br/>
      PCA1: ${params.value[0].toFixed(2)}<br/>
      PCA2: ${params.value[1].toFixed(2)}
    `
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
    splitLine: { lineStyle: { color: '#444' } },
    min: -2,
    max: 2
  },
  yAxis: {
    name: 'PCA 2',
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' },
    splitLine: { lineStyle: { color: '#444' } },
    min: -2,
    max: 2
  },
  series: [
    {
      name: 'Cluster 1',
      type: 'scatter',
      data: [
        { name: 'PMC', value: [-1.2, 0.8], label: { ...labelStyle } },
        { name: 'SMA', value: [-1.0, 1.0], label: { ...labelStyle } },
        { name: 'PPC', value: [-0.8, 0.9], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#facc15' }
    },
    {
      name: 'Cluster 2',
      type: 'scatter',
      data: [
        { name: 'M1', value: [0.6, -0.4], label: { ...labelStyle } },
        { name: 'S1', value: [0.8, -0.6], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#fb7185' }
    },
    {
      name: 'Cluster 3',
      type: 'scatter',
      data: [
        { name: 'Präfrontal', value: [-0.2, -1.0], label: { ...labelStyle } },
        { name: 'Basalganglien', value: [0.0, -0.8], label: { ...labelStyle } },
        { name: 'Kleinhirn', value: [0.2, -1.2], label: { ...labelStyle } }
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
  padding: 16px;
  min-height: 100vh;
  font-family: sans-serif;
}

.back-button {
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

.main-layout {
  display: flex;
  align-items: flex-start;
  gap: 16px;
  width: 100%;
}

.left-panel {
  width: 260px;
  flex-shrink: 0;
}

.right-panel {
  width: 316px;
  flex-shrink: 0;
}

.chart-panel {
  flex: 1;
  min-width: 0;
  padding: 16px;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.tab-bar-wrapper {
  display: inline-flex;         /* statt block → schrumpft auf Inhalt */
  align-self: flex-start;       /* bleibt linksbündig */
  margin-bottom: 16px;
  padding: 4px;
  border: 1px solid white;
  border-radius: 999px;
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
  background: #434343;
}

.chart {
  width: 100%;
  height: 640px;
  margin-bottom: 24px;
}
</style>

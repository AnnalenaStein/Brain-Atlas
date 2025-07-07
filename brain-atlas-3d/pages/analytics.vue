<template>
  <HeaderBar />
  <div class="analytics-wrapper">
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
            <button class="add-tab-button" @click="addCustomChart">＋</button>
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
import { ref, computed } from 'vue'
import { useRouter } from '#app'
import ECharts from 'vue-echarts'
import AnalyticsPanel from '~/components/AnalyticsPanel.vue'
import InsightPanel from '~/components/InsightPanel.vue'

import { use } from 'echarts/core'
import { ScatterChart, LineChart } from 'echarts/charts'
import {
  TooltipComponent,
  LegendComponent,
  TitleComponent,
  GridComponent,
  AxisPointerComponent
} from 'echarts/components'
import { CanvasRenderer } from 'echarts/renderers'

use([
  ScatterChart,
  LineChart,
  TooltipComponent,
  LegendComponent,
  TitleComponent,
  GridComponent,
  AxisPointerComponent,
  CanvasRenderer
])

const router = useRouter()
const activeTab = ref('cluster')

function goBack() {
  router.push('/atlas')
}

function addCustomChart() {
  alert('Custom chart hinzufügen – Funktion folgt.')
}

const labelStyle = {
  show: false,
  position: 'top',
  distance: 8,
  color: '#9ca3af',
  fontSize: 12,
  emphasis: {
    show: true
  }
}

const clusterChartOptions = {
  backgroundColor: '#000',
  tooltip: {
    trigger: 'item',
    axisPointer: {
      type: 'cross',
      snap: true,
      triggerOn: 'mousemove|click',
      lineStyle: {
        type: 'dashed',
        color: '#888'
      },
      label: {
        backgroundColor: '#6a7985'
      }
    },
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
    splitLine: {
      lineStyle: {
        color: '#444',
        type: 'dashed'
      }
    },
    min: -2,
    max: 2
  },
  yAxis: {
    name: 'PCA 2',
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' },
    splitLine: {
      lineStyle: {
        color: '#444',
        type: 'dashed'
      }
    },
    min: -2,
    max: 2
  },
  series: [
    {
      name: 'Cluster 1',
      type: 'scatter',
      data: [
        { name: 'Primary Motor Cortex (M1)', value: [-1.2, 0.8], label: { ...labelStyle } },
        { name: 'Supplementary Motor Area (SMA)', value: [-1.0, 1.0], label: { ...labelStyle } },
        { name: 'Premotor Cortex (PMC)', value: [-0.8, 0.9], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#facc15' }
    },
    {
      name: 'Cluster 2',
      type: 'scatter',
      data: [
        { name: 'Primary Somatosensory Cortex (S1)', value: [0.6, -0.4], label: { ...labelStyle } },
        { name: 'Secondary Somatosensory Cortex (S2)', value: [0.8, -0.6], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#fb7185' }
    },
    {
      name: 'Cluster 3',
      type: 'scatter',
      data: [
        { name: 'Prefrontal Cortex', value: [-0.2, -1.0], label: { ...labelStyle } },
        { name: 'Basal Ganglia', value: [0.0, -0.8], label: { ...labelStyle } },
        { name: 'Cerebellum', value: [0.2, -1.2], label: { ...labelStyle } },
        { name: 'Thalamus', value: [0.5, -1.0], label: { ...labelStyle } },
        { name: 'Posterior Parietal Cortex (PPC)', value: [-0.5, -1.2], label: { ...labelStyle } },
        { name: 'Cingulate Motor Area (CMA)', value: [0.6, -1.3], label: { ...labelStyle } }
      ],
      symbolSize: 16,
      itemStyle: { color: '#38bdf8' }
    }
  ]
}

const timeChartOptions = {
  backgroundColor: '#000',
  title: {
    text: 'Simulierter Zeitverlauf – Hirnaktivität bei Handbewegung (1–2s)',
    left: 'center',
    textStyle: { color: '#fff' }
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['M1 (Motorisch)', 'PMC (Prämotorisch)', 'SMA (Supplementär)', 'S1 (Somatosensorisch)', 'Kleinhirn'],
    textStyle: { color: '#fff' },
    top: 30
  },
  xAxis: {
    type: 'category',
    name: 'Zeit (s)',
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' },
    boundaryGap: false,
    data: Array.from({ length: 20 }, (_, i) => (1 + i * 0.05).toFixed(2))
  },
  yAxis: {
    type: 'value',
    name: 'BOLD-Signal (simuliert)',
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' }
  },
  series: [
    { name: 'M1 (Motorisch)', type: 'line', data: Array.from({ length: 20 }, () => Math.random() * 2 - 1), smooth: true },
    { name: 'PMC (Prämotorisch)', type: 'line', data: Array.from({ length: 20 }, () => Math.random() * 2 - 1), smooth: true },
    { name: 'SMA (Supplementär)', type: 'line', data: Array.from({ length: 20 }, () => Math.random() * 2 - 1), smooth: true },
    { name: 'S1 (Somatosensorisch)', type: 'line', data: Array.from({ length: 20 }, () => Math.random() * 2 - 1), smooth: true },
    { name: 'Kleinhirn', type: 'line', data: Array.from({ length: 20 }, () => Math.random() * 2 - 1), smooth: true }
  ]
}

const barChartOptions = {
  backgroundColor: '#000',
  title: {
    text: 'Aktivierungsvergleich nach Region (letzter Zeitpunkt)',
    left: 'center',
    textStyle: { color: '#fff' }
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: { type: 'shadow' }
  },
  legend: { show: false },
  xAxis: {
    type: 'category',
    name: 'Region',
    data: ['M1 (Motorisch)', 'PMC (Prämotorisch)', 'SMA (Supplementär)', 'S1 (Somatosensorisch)', 'Kleinhirn'],
    axisLabel: { color: '#fff', rotate: 30 }
  },
  yAxis: {
    type: 'value',
    name: 'BOLD-Signalstärke (simuliert)',
    axisLabel: { color: '#fff' }
  },
  series: [
    {
      type: 'bar',
      data: [
        { value: -0.55, itemStyle: { color: '#d97706' } },
        { value: -1.0, itemStyle: { color: '#d97706' } },
        { value: -0.9, itemStyle: { color: '#d97706' } },
        { value: -0.85, itemStyle: { color: '#f97316' } },
        { value: -0.65, itemStyle: { color: '#e11d48' } }
      ]
    }
  ]
}


const chartOptions = computed(() => {
  if (activeTab.value === 'time') return timeChartOptions
  if (activeTab.value === 'comparison') return barChartOptions
  return clusterChartOptions
})
</script>

<style scoped>
.analytics-wrapper {
  background: #000;
  color: white;
  padding: 0px;
  min-height: 100vh;
  font-family: sans-serif;
}

/* .page-title {
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 12px;
} */

.main-layout {
  display: flex;
  align-items: flex-start;
  gap: 0px;
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
  padding: 90px 0px 0px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.tab-bar-wrapper {
  margin-bottom: 0px;
  margin-left: 32px;
  padding: 2px;
  border: 1px solid rgb(151, 151, 151);
  border-radius: 999px;
  align-self: flex-start;
}

.tab-bar {
  display: flex;
  gap: 2px;
}

.tab {
  background: transparent;
  border: none;
  color: white;
  padding: 8px 12px;
  border-radius: 999px;
  cursor: pointer;
  font-size: 14px;
  line-height: 1.2;
}

.tab.active {
  background: #434343;
}

.chart {
  width: 105%;
  height: 600px;
  margin-left: -24px;
}
</style>

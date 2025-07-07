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
    
    <Footer />

  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter } from '#app'
import ECharts from 'vue-echarts'
import AnalyticsPanel from '~/components/AnalyticsPanel.vue'
import InsightPanel from '~/components/InsightPanel.vue'
import Footer from '~/components/Footer.vue'

import { use } from 'echarts/core'
import { ScatterChart, LineChart, BarChart } from 'echarts/charts'
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
  BarChart,
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

const regionColorMap = {
  'PMC': '#fef08a',        // sehr hellgelb
  'SMA': '#facc15',        // mittelgelb
  'M1': '#ca8a04',         // dunkelgelb / ocker
  'S1': '#ef4444',         // rot
  'CMA': '#06b6d4',        // kräftiges cyan
  'PPC': '#ec4899',        // pink
  'Cerebellum': '#3b82f6', // kräftiges blau
  'Basal Ganglia': '#8b5cf6', // violett
  'Thalamus': '#ea580c'    // kräftiges orange
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
    nameTextStyle: { color: '#fff', padding: [0, 0, 8, 0] },
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
    nameTextStyle: { color: '#fff', padding: [0, 8, 0, 0] },
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
    text: 'Simulated time course – brain activity during hand movement (1–2s)',
    left: '48',
    textStyle: { color: '#fff' }
  },
  tooltip: {
    trigger: 'axis',
    formatter: function (params) {
      return params.map(p => {
        const color = regionColorMap[p.seriesName] || '#fff'
        return `<span style="display:inline-block;margin-right:6px;border-radius:50%;width:10px;height:10px;background:${color}"></span>
          <strong>${p.seriesName}</strong>: ${p.data.toFixed(2)}`
      }).join('<br/>')
    }
  },
  legend: { show: false },
  xAxis: {
    type: 'category',
    name: 'Time (s)',
    nameLocation: 'middle',
    nameGap: 32,
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' },
    boundaryGap: false,
    data: Array.from({ length: 20 }, (_, i) => (1 + i * 0.05).toFixed(2))
  },
  yAxis: {
    type: 'value',
    name: 'Activation (BOLD)',
    nameLocation: 'middle',
    nameGap: 40,
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' }
  },
  series: ['M1', 'PMC', 'SMA', 'S1', 'Cerebellum'].map((name) => {
    const data = Array.from({ length: 20 }, () => Math.random() * 2 - 1)
    return {
      name,
      type: 'line',
      data,
      smooth: true,
      lineStyle: { color: regionColorMap[name] || '#888' },
      label: { show: false },
      endLabel: {
        show: true,
        formatter: () => name,
        color: regionColorMap[name] || '#fff',
        fontSize: 12,
        distance: 12
      },
      labelLayout: {
        moveOverlap: 'shiftY'
      },
      emphasis: {
        focus: 'series'
      }
    }
  })
}

const barChartOptions = {
  backgroundColor: '#000',
  title: {
    text: 'Region comparison – brain activity during hand movement',
    left: '48',
    textStyle: { color: '#fff' }
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: { type: 'shadow' },
    formatter: function (params) {
      const region = params[0].name
      const value = params[0].value
      const color = regionColorMap[region] || '#fff'
      const roleMap = {
        'PMC': 'Prämotorisch',
        'SMA': 'Prämotorisch',
        'M1': 'Primär motorisch',
        'S1': 'Sensorisch',
        'CMA': 'Motorisch (assoziativ)',
        'PPC': 'Räumlich-planend',
        'Cerebellum': 'Feinmotorik & Koordination',
        'Basal Ganglia': 'Bewegungsselektion',
        'Thalamus': 'Sensorisches Relay'
      }
      const role = roleMap[region] || 'Unbekannt'
      return `<span style="display:inline-block;margin-right:6px;border-radius:50%;width:10px;height:10px;background:${color}"></span>
        <strong>${region}</strong><br/>
        Aktivierung: ${value.toFixed(2)}<br/>
        Funktion: ${role}`
    }
  },
  xAxis: {
    type: 'category',
    data: Object.keys(regionColorMap),
    axisLabel: {
      color: '#fff',
      rotate: 30
    },
    axisLine: { lineStyle: { color: '#888' } }
  },
  yAxis: {
    type: 'value',
    name: 'Avg Activation (BOLD)',
    nameTextStyle: { color: '#fff' },
    axisLabel: { color: '#fff' },
    splitLine: { lineStyle: { color: '#444', type: 'dashed' } }
  },
  series: [
    {
      name: 'Mean Activation',
      type: 'bar',
      data: [1.38, 1.34, 1.29, 1.16, 1.08, 1.04, 0.95, 0.91, 0.87],
      itemStyle: {
        color: function (params) {
          return regionColorMap[params.name] || '#888'
        }
      },
      barWidth: '60%',
      emphasis: {
        focus: 'series'
      }
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
  margin-bottom: 16px;
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

.add-tab-button {
  padding: 0px 8px;
}

.chart {
  width: 98%;
  height: 600px;
  margin-left: 24px;
}
</style>

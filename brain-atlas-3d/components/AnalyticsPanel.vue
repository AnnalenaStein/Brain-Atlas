<template>
  <div class="analytics-panel">
    <div class="section">
      <!-- 🔗 Regionselection -->
      <div class="section-header">
        <span class="section-title">🔗 Regionselection</span>
        <span class="chevron">⌄</span>
      </div>
    </div>

    <hr />

    <!-- ⚙️ Cluster Settings -->
    <div class="section">
      <h3 class="section-title">⚙️ Cluster Settings</h3>

      <div class="form-group">
        <label class="label">Clustering Method</label>
        <select class="dropdown">
          <option>KMeans</option>
          <option>DBSCAN</option>
          <option>Hierarchical</option>
        </select>
      </div>

      <div class="form-group row">
        <label class="label-inline">Number of Clusters</label>
        <input type="number" class="number-input" v-model="clusterCount" min="2" max="10" />
      </div>

      <div class="button-row top-margin">
        <button class="small-button">Comparison</button>
      </div>
    </div>

    <hr />

    <!-- 🔍 Play -->
    <div class="section">
      <h3 class="section-title">🔍 Play</h3>

      <div class="button-row">
        <button class="icon-button">⏮</button>
        <button class="icon-button">▶️</button>
        <button class="icon-button">⏭</button>
      </div>

      <input type="range" class="slider" min="0" max="100" />
    </div>

<hr />

    <!-- 🧪 Threshold Filter -->
    <div class="section">
      <h3 class="section-title">🧪 Threshold Filter</h3>

      <div class="row">
        <label class="label">Activation &lt;</label>
        <input type="number" class="number-input" step="0.1" min="0" max="1" v-model="activationThreshold" />
      </div>

      <input type="range" class="slider" min="0" max="1" step="0.01" v-model="activationThreshold" />

      <label class="label">Time Range</label>
      <div class="range-container">
        <div class="slider-track">
          <div class="slider-range" :style="{ left: percentStart + '%', width: rangeWidth + '%' }" />
        </div>
        <input type="range" :min="min" :max="max" v-model="start" class="thumb thumb-left" />
        <input type="range" :min="min" :max="max" v-model="end" class="thumb thumb-right" />
      </div>

      <div class="row">
        <span class="time-label">{{ formatTime(start) }}</span>
        <span class="time-label">{{ formatTime(end) }}</span>
      </div>
    </div>

<hr />

    <!-- 📤 Export -->
    <div class="section">
      <div class="button-row">
        <button class="export-button">📤 Export</button>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref, computed, watch } from 'vue'

const clusterCount = ref(5)
const activationThreshold = ref(0.5)

const min = 0
const max = 60
const start = ref(5)
const end = ref(20)

const percentStart = computed(() => (start.value / max) * 100)
const percentEnd = computed(() => (end.value / max) * 100)
const rangeWidth = computed(() => percentEnd.value - percentStart.value)

watch([start, end], () => {
  if (start.value > end.value) {
    const temp = start.value
    start.value = end.value
    end.value = temp
  }
})

function formatTime(seconds) {
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`
}
</script>
<style scoped>
.analytics-panel {
  width: 260px;
  padding: 16px;
  background: rgba(81, 81, 81, 0.4);
  color: #fff;
  font-family: Inter, sans-serif;
  border-radius: 12px;
  display: flex;
  flex-direction: column;
}

.section {
  margin-bottom: 24px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.section-title {
  font-size: 14px;
  font-weight: 600;
  margin: 8px;
}

.chevron {
  color: #ccc;
  font-size: 14px;
}

.label, .label-inline {
  color: #dedede;
  font-size: 14px;
}

hr {
  border: 0.1px solid #6a6a6a;
  margin: 0px 0px 8px 0px;
}

.label {
  display: block;
  margin-bottom: 6px;
}

.dropdown,
.number-input {
  background: #1a1a1a;
  color: white;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
  padding: 4px 8px;
}

.dropdown {
  width: 100%;
  height: 32px;
}

.number-input {
  width: 60px;
}

.slider {
  width: 100%;
  height: 4px;
  margin: 8px 0 12px;
}

.button-row {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.icon-button,
.small-button,
.export-button {
  padding: 6px 12px;
  background: #2e2e2e;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 14px;
  cursor: pointer;
}

.export-button {
  background: #3b3b3b;
}

.range-container {
  position: relative;
  height: 36px;
  margin: 12px 0;
}

.slider-track {
  position: absolute;
  top: 16px;
  height: 4px;
  background-color: #444;
  width: 100%;
  border-radius: 2px;
}

.slider-range {
  position: absolute;
  height: 100%;
  background-color: #3b82f6;
  border-radius: 2px;
}

input[type='range'].thumb {
  position: absolute;
  top: 0;
  width: 100%;
  height: 36px;
  background: none;
  pointer-events: none;
  appearance: none;
  z-index: 2;
}

input[type='range'].thumb::-webkit-slider-thumb,
input[type='range'].thumb::-moz-range-thumb {
  pointer-events: all;
  width: 16px;
  height: 16px;
  background: #fff;
  border-radius: 50%;
  border: 2px solid #3b82f6;
  position: relative;
  z-index: 3;
}

.time-label {
  font-size: 12px;
  color: #ccc;
}

.row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
}

.form-group {
  margin-bottom: 16px;
}

.top-margin {
  margin-top: 16px;
}
</style>

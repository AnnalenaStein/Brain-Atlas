<template>
  <div class="back-button">
    <router-link to="/atlas" class="small-button">← Back to Atlas</router-link>
  </div>
  <div class="header-bar">
    <h2 class="title">Analytics</h2>
  </div>

  <div class="control-panel">
    <div class="section">
      <div class="section-title row" style="justify-content: space-between; align-items: center;">
        <span>🔗 Regionselection</span>
        <span style="font-size: 20px; color: var(--text-muted); line-height: 1;">⌄</span>
      </div>
    </div>

    <hr />

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
        <label class="label">Number of Clusters</label>
        <input type="number" class="number-input" v-model="clusterCount" min="2" max="10" />
      </div>
      <div class="button-row">
        <button class="small-button">Comparison</button>
        <button class="small-button">Manupulate</button>
      </div>
    </div>

    <hr />

    <div class="section">
      <h3 class="section-title">🔍 Play</h3>
      <div class="media-buttons">
        <button class="icon-button">⏮</button>
        <button class="icon-button">▶️</button>
        <button class="icon-button">⏭</button>
      </div>
      <input type="range" class="slider" min="0" max="100" />
    </div>

    <hr />

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
      <div class="row time-row">
        <span class="time-label">{{ formatTime(start) }}</span>
        <span class="time-label">{{ formatTime(end) }}</span>
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
.control-panel {
  position: absolute;
  left: 24px;
  top: 144px;
  width: 18vw;
  padding: 16px;
  border-radius: 8px;
  background: var(--bg-dropdown);
  color: var(--text-body);
  font-family: Inter, sans-serif;
  z-index: 1;
}

.header-bar {
  position: absolute;
  top: 80px;
  left: 32px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 8px;
  color: var(--text-heading);
}

.back-button {
  position: absolute;
  top: 64px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
}

.title {
  font-size: 24px;
  font-weight: 600;
  color: var(--text-heading);
}

.section {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 16px;
}

.section-title {
  font-size: 16px;
  font-weight: 520;
  margin-bottom: 4px;
  color: var(--text-subheading);
}

.label {
  font-size: 14px;
  font-weight: 400;
  color: var(--text-label);
}

.small-text {
  font-size: 13px;
  font-weight: 300;
  color: var(--text-muted);
}

.dropdown,
.number-input {
  background: var(--bg-input);
  color: var(--text-body);
  border: 1px solid var(--border-default);
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
  margin: 4px 0 8px;
}

hr {
  border: 0.1px solid var(--border-light);
  margin: 16px 0;
}

.button-row,
.media-buttons {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 16px;
}

.button-row {
  justify-content: left;
}

.small-button {
  padding: 4px 8px;
  background: var(--bg-tag);
  border: none;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 400;
  color: var(--text-heading);
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.small-button:hover {
  background-color: var(--bg-tag-hover);
}

.icon-button {
  font-size: 16px;
  background: none;
  border: none;
  cursor: pointer;
  color: var(--text-heading);
  transition: color 0.2s ease;
}

.icon-button:hover {
  color: #3b82f6;
}

.range-container {
  position: relative;
  height: 36px;
  margin: -8px 0 8px;
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
  background: var(--text-heading);
  border-radius: 50%;
  border: 2px solid #3b82f6;
  position: relative;
  z-index: 3;
}

.time-label {
  font-size: 12px;
  color: var(--text-muted);
}

.time-row {
  margin-top: -24px;
}

.row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
}

.form-group {
  margin-bottom: 4px;
}
</style>

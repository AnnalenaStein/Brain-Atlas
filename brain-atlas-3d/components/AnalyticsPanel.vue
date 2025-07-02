<template>
  <div class="analytics-panel">
    <!-- Region Selection -->
    <section class="section">
      <h3 class="section-title">🧠 Regionselection</h3>
      <input type="text" placeholder="Search by Region" class="search-input" v-model="regionSearch" />

      <div class="region-group" v-for="(items, group) in regionTree" :key="group">
        <div class="group-header" @click="toggleGroup(group)">
          <span>{{ expanded[group] ? '▾' : '▸' }}</span>
          <span>{{ group }}</span>
        </div>
        <ul v-if="expanded[group]" class="region-list">
          <li v-for="item in items" :key="item" class="region-item">
            <span :class="dot(groupColors[group])"></span> {{ item }}
          </li>
        </ul>
      </div>
    </section>

    <!-- Cluster Settings -->
    <section class="section">
      <h3 class="section-title">⚙️ Cluster Settings</h3>
      <label>Clustering Method</label>
      <select v-model="clusterMethod" class="select">
        <option>KMeans</option>
        <option>DBSCAN</option>
        <option>Hierarchical</option>
      </select>

      <label>Number of Clusters</label>
      <input type="range" min="2" max="10" v-model="numClusters" />
      <div class="button-row">
        <button class="btn">Comparison</button>
        <button class="btn">Reset view</button>
      </div>
    </section>

    <!-- Threshold Filter -->
    <section class="section">
      <h3 class="section-title">🧪 Threshold Filter</h3>
      <label>Activation &lt; {{ activation }}</label>
      <input type="range" min="0" max="1" step="0.01" v-model="activation" />

      <label>Time Range</label>
      <div class="time-range">
        <span>00:05</span> – <span>00:20</span>
      </div>

      <button class="btn export">⬇ Export</button>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const regionSearch = ref('')
const clusterMethod = ref('KMeans')
const numClusters = ref(5)
const activation = ref(0.5)

const regionTree = {
  Cerebrum: ['Frontal Lobe', 'Parietal Lobe', 'Temporal Lobe', 'Occipital Lobe'],
  Cerebellum: [],
  'Brain Stem': []
}

const groupColors = {
  Cerebrum: 'purple',
  Cerebellum: 'red',
  'Brain Stem': 'pink'
}

const expanded = ref({
  Cerebrum: true,
  Cerebellum: false,
  'Brain Stem': false
})

function toggleGroup(group) {
  expanded.value[group] = !expanded.value[group]
}

function dot(color) {
  return `dot dot-${color}`
}
</script>

<style scoped>
.analytics-panel {
  width: 280px;
  padding: 20px;
  background-color: #111827;
  color: #d1d5db;
  font-family: sans-serif;
  border-radius: 8px;
}

.section {
  margin-bottom: 24px;
}

.section-title {
  font-weight: 600;
  font-size: 15px;
  margin-bottom: 12px;
}

.search-input,
.select {
  width: 100%;
  padding: 6px 10px;
  border-radius: 6px;
  border: 1px solid #4b5563;
  background-color: #1f2937;
  color: white;
  margin-bottom: 10px;
}

.region-group {
  margin-top: 12px;
}

.group-header {
  cursor: pointer;
  font-size: 14px;
  display: flex;
  align-items: center;
  gap: 6px;
  margin-bottom: 6px;
}

.region-list {
  list-style: none;
  padding-left: 14px;
}

.region-item {
  font-size: 13px;
  margin-bottom: 4px;
  display: flex;
  align-items: center;
  gap: 6px;
}

.button-row {
  display: flex;
  justify-content: space-between;
  margin-top: 12px;
}

.btn {
  background-color: #374151;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 13px;
}

.btn:hover {
  background-color: #4b5563;
}

.btn.export {
  width: 100%;
  margin-top: 10px;
}

.time-range {
  margin: 6px 0;
  font-size: 13px;
  color: #9ca3af;
}

.dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  display: inline-block;
}

.dot-purple { background-color: #a855f7; }
.dot-red { background-color: #ef4444; }
.dot-pink { background-color: #f472b6; }
</style>

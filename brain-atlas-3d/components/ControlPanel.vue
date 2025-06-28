<template>
  <div class="control-panel">
    <!-- Search and Filter -->
    <div class="section">
      <h3>🔍 Search and Filter</h3>
      <label>Edit Activity</label>
      <input type="text" v-model="activity" placeholder="Handmovement" />
      <button class="btn">Filter</button>
    </div>

    <!-- Play -->
    <div class="section">
      <h3>⏯️ Play</h3>
      <div class="play-controls">
        <button>⏮️</button>
        <button>▶️</button>
        <button>⏭️</button>
      </div>
      <input type="range" min="0" max="100" v-model="time" />
    </div>

    <!-- Controls -->
    <div class="section">
      <h3>⚙️ Controls</h3>
      <p>Human Model <span class="eye">👁️</span></p>
      <label>Transparency {{ transparency }}%</label>
      <input type="range" min="0" max="100" v-model="transparency" />
      <div class="button-row">
        <button class="btn">Comparision</button>
        <button class="btn">Reset view</button>
      </div>
    </div>

    <!-- Brain Structure -->
    <div class="section">
      <div class="dropdown-header" @click="toggleBrainStructure">
        <h3>🧠 Brain Structure</h3>
        <span class="arrow">{{ showBrainStructure ? '▾' : '▸' }}</span>
      </div>
      <div v-if="showBrainStructure" class="brain-structure">
        <input type="text" placeholder="Search Region or Area" class="search-input" />
        <ul class="tree">
          <li>
            <div class="tree-item" @click="toggle('cerebrum')">
              <span class="arrow">{{ expanded.cerebrum ? '▾' : '▸' }}</span>
              <span :class="dot('blue')"></span> Cerebrum
            </div>
            <ul v-if="expanded.cerebrum">
              <li class="indent">
                <span class="arrow">▸</span>
                <span :class="dot('purple')"></span> Frontal Lobe
              </li>
              <li class="indent">
                <span class="arrow">▸</span>
                <span :class="dot('purple')"></span> Parietal Lobe
              </li>
              <li class="indent">
                <span class="arrow">▸</span>
                <span :class="dot('orange')"></span> Temporal Lobe
              </li>
              <li class="indent">
                <span class="arrow">▸</span>
                <span :class="dot('yellow')"></span> Occipital Lobe
              </li>
            </ul>
          </li>
          <li>
            <div class="tree-item">
              <span class="arrow">▸</span>
              <span :class="dot('red')"></span> Cerebellum
            </div>
          </li>
          <li>
            <div class="tree-item">
              <span class="arrow">▸</span>
              <span :class="dot('purple')"></span> Brain Stem
            </div>
          </li>
        </ul>
      </div>
    </div>

    <!-- AI -->
    <div class="section">
      <h3>🤖 AI</h3>
      <button class="btn">Detect Patterns</button>
      <button class="btn">Find Similar Activities</button>
      <button class="btn">Highlight Anomalies</button>
    </div>
  </div>

  <!-- Navigation Button -->
  <button class="scroll-fab" @click="goToAnalyticsPage">⬇ Show Analytics</button>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from '#app'

const router = useRouter()

const activity = ref('Handmovement')
const time = ref(50)
const transparency = ref(70)
const showBrainStructure = ref(false)
const expanded = ref({ cerebrum: true })

function toggleBrainStructure() {
  showBrainStructure.value = !showBrainStructure.value
}

function toggle(section) {
  expanded.value[section] = !expanded.value[section]
}

function dot(color) {
  return `dot dot-${color}`
}

function goToAnalyticsPage() {
  router.push('/analytics')
}
</script>

<style scoped>
.control-panel {
  position: fixed;
  top: 0;
  right: 0;
  width: 260px;
  height: 100vh;
  background-color: #1a1a1a;
  color: #d1d5db;
  padding: 20px 16px;
  overflow-y: auto;
  font-family: sans-serif;
  z-index: 999;
  box-shadow: -2px 0 8px rgba(0, 0, 0, 0.3);
}

.section {
  margin-bottom: 24px;
}

h3 {
  font-size: 14px;
  font-weight: 600;
  color: #ffffff;
  margin: 0;
}

.dropdown-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  margin-bottom: 12px;
}

label {
  font-size: 13px;
  color: #9ca3af;
  display: block;
  margin-bottom: 4px;
}

input[type="text"], .search-input {
  width: 100%;
  padding: 6px 10px;
  background-color: #111827;
  border: 1px solid #4b5563;
  border-radius: 6px;
  color: #ffffff;
  margin-bottom: 8px;
}

input[type="range"] {
  width: 100%;
  margin-top: 6px;
}

button.btn {
  background-color: #374151;
  color: #ffffff;
  border: none;
  padding: 6px 12px;
  margin-top: 6px;
  margin-right: 6px;
  border-radius: 8px;
  cursor: pointer;
  font-size: 13px;
}

button.btn:hover {
  background-color: #4b5563;
}

.scroll-fab {
  position: fixed;
  bottom: 24px;
  left: 50%;
  transform: translateX(-50%);
  background-color: #4b5563;
  color: #fff;
  padding: 10px 16px;
  border-radius: 9999px;
  border: none;
  font-size: 14px;
  cursor: pointer;
  z-index: 1000;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

.scroll-fab:hover {
  background-color: #5e6670;
}

.play-controls button {
  background: none;
  border: none;
  color: #d1d5db;
  font-size: 16px;
  margin-right: 8px;
  cursor: pointer;
}

.eye {
  float: right;
}

.button-row {
  display: flex;
  justify-content: space-between;
  margin-top: 8px;
}

.tree {
  list-style: none;
  padding-left: 10px;
}

.tree li {
  margin: 6px 0;
  cursor: default;
}

.tree-item {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
}

.arrow {
  margin-left: auto;
  color: #9ca3af;
  font-size: 12px;
}

.indent {
  padding-left: 20px;
  display: flex;
  align-items: center;
  gap: 8px;
}

.dot {
  display: inline-block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  margin-right: 4px;
  vertical-align: middle;
}

.dot-blue { background-color: #3b82f6; }
.dot-red { background-color: #ef4444; }
.dot-yellow { background-color: #facc15; }
.dot-purple { background-color: #a855f7; }
.dot-orange { background-color: #f97316; }
</style>

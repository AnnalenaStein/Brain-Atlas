<template>
  <div class="control-panel">
    <div class="section">
      <h3 class="section-title">Search and Filter</h3>
      <p class="small-text">Edit Activity</p>
      <input type="text" placeholder="Handmovement" class="input" />
      <div class="button-row">
        <button class="small-button" @click="showFilterMenu = !showFilterMenu">Filter</button>
        <FilterMenu v-if="showFilterMenu" @close="showFilterMenu = false" />
        <button class="small-button">Comparison</button>

      </div>
    </div>

    <hr />

    <div class="section">
      <h3 class="section-title">Play</h3>
      <div class="media-buttons">
        <button class="icon-button">⏮</button>
        <button class="icon-button" aria-label="Play">
          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
            <path d="M8 5v14l11-7z" />
          </svg>
        </button>
        <button class="icon-button">⏭</button>
      </div>
      <input type="range" class="slider" />
      <div class="row time-row" style="margin-top: -8px;">
        <span class="time-label">{{ formatTime(start) }}</span>
        <span class="time-label">{{ formatTime(end) }}</span>
      </div>
    </div>

    <hr />

    <div class="section">
      <h3 class="section-title">Controls</h3>
      <div class="row">
        <span class="label">Human Model</span>
        <span @click="showModel = !showModel">
          <component :is="showModel ? EyeIcon : EyeSlashIcon" class="w-5 h-5" style="color: var(--text-label)" />
        </span>
      </div>
      <div class="row">
        <span class="label">Transparency</span>
        <span class="label">70%</span>
      </div>
      <input type="range" class="slider" />
      <div class="button-column">
        <button class="small-button">Reset view</button>
        <button class="small-button">Hide Controls</button>
        <button class="small-button">Show Explanations</button>
      </div>
    </div>

    <hr />

    <div class="section">
      <div class="section-title row">
        <span>Brain Structure</span>
        <ChevronDownIcon class="w-4 h-4 text-muted" />
      </div>

    <!-- <ul class="tree">
        <li>
          <span class="tree-toggle">▾</span> Cerebrum
          <ul>
            <li>Frontal Lobe</li>
            <li>Parietal Lobe</li>
            <li>Temporal Lobe</li>
            <li>Occipital Lobe</li>
          </ul>
        </li>
      </ul> -->
  </div>
  </div>

  <InsightPanel />

  <div class="header-bar">
    <h2 class="title">Moving the Hand</h2>
    <select class="dropdown">
      <option>Average Brain</option>
      <option>Parkinson’s Disease</option>
      <option>Paraplegic</option>
      <option>Tetraplegic</option>
    </select>
  </div>

  <div class="mode-switch">
    <div class="tab-bar-wrapper">
      <div class="tab-bar">
        <button class="tab active">🧠 3D Model</button>
        <button class="tab">📊 Slices</button>
        <button class="tab">🗺️ Flatmap</button>
      </div>
    </div>
  </div>

  <NuxtLink to="/analytics" class="analytics-button-link">
    <button class="small-button">📈 Analytics</button>
  </NuxtLink>
</template>

<script setup>
const showFilterMenu = ref(false)
import { EyeIcon, EyeSlashIcon } from '@heroicons/vue/24/outline'
import { ChevronDownIcon } from '@heroicons/vue/24/solid'
const showModel = ref(true)
// All logic stays unchanged for now
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
  top: 112px;
  width: 17vw;
  padding: 16px;
  border-radius: 8px;
  background: var(--bg-dropdown);
  color: var(--text-body);
  font-family: Inter, sans-serif;
}

.header-bar {
  position: absolute;
  top: 16px;
  left: 32px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 16px;
  color: var(--text-heading);
}

.header-bar .title {
  font-size: 24px;
  font-weight: 600;
}

.dropdown {
  height: 28px;
  font-size: 14px;
  padding: 2px 20px 2px 12px;
  border-radius: 6px;
  border: 1px solid var(--border-default);
  background: var(--bg-input);
  color: var(--text-heading);
  width: 16vw;
}

.mode-switch {
  position: absolute;
  top: 16px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
}

.tab-bar-wrapper {
  padding: 2px;
  border: 1px solid var(--border-default);
  border-radius: 999px;
  margin-bottom: 32px;
  display: inline-block;
}

.tab-bar {
  display: flex;
  gap: 2px;
}

.tab {
  background: transparent;
  border: none;
  color: var(--text-heading);
  padding: 6px 16px;
  border-radius: 999px;
  cursor: pointer;
  font-size: 14px;
}

.tab.active {
  background: var(--bg-tag);
}

.tab:hover {
  background: var(--bg-tag-hover);
}

.mode-button {
  display: none;
}

.section {
  display: flex;
  flex-direction: column;
  gap: 4px;
  margin-bottom: 0px;
}

.section-title {
  font-size: 16px;
  font-weight: 520;
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

.input {
  height: 32px;
  border: 1px solid var(--border-default);
  border-radius: 8px;
  padding-left: 8px;
  background: var(--bg-input);
  color: var(--text-heading);
  font-size: 14px;
  width: 100%;
  margin-top: 4px;
  margin-bottom: 2px;
}

.button-row,
.media-buttons,
.button-column {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
  margin-top: 6px;
}

.button-column {
  flex-direction: column;
  align-items: flex-start;
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

.media-buttons {
  justify-content: center;
  margin-bottom: 4px;
  margin-top: -4px;
}

.slider {
  width: 100%;
  height: 4px;
  margin: 4px 0 8px 0;
}

.time-label {
  font-size: 12px;
  color: var(--text-muted);
}

.time-row {
  display: flex;
  justify-content: space-between;
  padding: 0 4px;
  margin-top: 0;
}

.row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 4px;
  margin-bottom: 4px;
}

.icon-eye {
  font-size: 16px;
}

.tree {
  list-style: none;
  padding-left: 0;
  font-size: 12px;
}

.tree-toggle {
  margin-right: 4px;
}

hr {
  border: 0.1px solid var(--border-light);
  margin: 16px 0;
}

.analytics-button-link {
  position: absolute;
  bottom: 80px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
}

</style>

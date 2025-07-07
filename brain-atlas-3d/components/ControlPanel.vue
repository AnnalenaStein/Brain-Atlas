<template>
  <div class="control-panel">
    <div class="section">
      <h3 class="section-title">Search and Filter</h3>
      <p class="small-text">Edit Activity</p>
      <input type="text" placeholder="Handmovement" class="input" />
      <div class="button-row">
        <button class="small-button">Filter</button>
        <button class="small-button">Comparison</button>

      </div>
    </div>

    <hr />

    <div class="section">
      <h3 class="section-title">Play</h3>
      <div class="media-buttons">
        <button class="icon-button">⏮️</button>
        <button class="icon-button" @click="emit('play-clicked')">▶️</button>
        <button class="icon-button">⏭️</button>
      </div>
      <input type="range" class="slider" />
    </div>

    <hr />

    <div class="section">
      <h3 class="section-title">Controls</h3>
      <div class="row">
        <span class="label">Human Model</span>
        <span class="icon-eye">👁️</span>
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
      <h3 class="section-title">Brain Structure</h3>
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
const emit = defineEmits(['play-clicked'])
// All logic stays unchanged for now
</script>

<style scoped>.control-panel {
  position: absolute;
  left: 24px;
  top: 112px;
  width: 18vw;
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

.input {
  height: 32px;
  border: 1px solid var(--border-default);
  border-radius: 8px;
  padding-left: 8px;
  background: var(--bg-input);
  color: var(--text-heading);
  font-size: 14px;
  width: 100%;
}

.button-row,
.button-column {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
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
  display: flex;
  justify-content: center;
  gap: 24px;
}

.slider {
  width: 100%;
  height: 4px;
}

.row {
  display: flex;
  justify-content: space-between;
  align-items: center;
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
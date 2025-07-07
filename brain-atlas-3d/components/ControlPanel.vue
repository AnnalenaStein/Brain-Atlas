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
    </div>
  </div>
</template>

<script setup>
const emit = defineEmits(['play-clicked'])
</script>

<style scoped>
.control-panel {
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

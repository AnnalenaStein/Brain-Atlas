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
        <button class="icon-button">▶️</button>
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

  <div class="insight-box">
    <h3 class="section-title">🧠 AI Insight Discovery Assistant</h3>
    <div class="button-row">
      <button class="small-button">Detect Patterns</button>
      <button class="small-button">Find Similar Activities</button>
      <button class="small-button">Highlight Anomalies</button>
    </div>
    <hr />
    <p class="small-text">Ask AI</p>
    <input type="text" class="input" placeholder="Why is there activation in..." />
  </div>

  <div class="header-bar">
    <h2 class="title">Moving the Hand</h2>
    <select class="dropdown">
      <option>Average Brain</option>
    </select>
  </div>

  <div class="header-bar">
    <h2 class="title">Moving the Hand</h2>
    <select class="dropdown">
      <option>Average Brain</option>
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
// All logic stays unchanged for now
</script>

<style scoped>
.control-panel {
  position: absolute;
  right: 16px;
  top: 96px;
  width: 18vw;
  padding: 16px;
  border-radius: 8px;
  background: rgba(81, 81, 81, 0.4);
  color: #fff;
  font-family: Inter, sans-serif;
}

.insight-box {
  position: absolute;
  left: 16px;
  bottom: 32px;
  width: 316px;
  padding: 16px;
  border-radius: 8px;
  background: rgba(81, 81, 81, 0.4);
  color: #fff;
}

.header-bar {
  position: absolute;
  top: 16px;
  left: 16px;
  display: flex;
  align-items: center;
  gap: 12px;
  color: white;
}

.header-bar .title {
  font-size: 18px;
  font-weight: 600;
}

.dropdown {
  height: 28px;
  font-size: 14px;
  padding: 2px 20px 2px 12px;
  border-radius: 6px;
  border: 1px solid #ccc;
  background: #1a1a1a;
  color: white;
  margin-left: 12px;
}

.mode-switch {
  position: absolute;
  top: 16px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
}

.tab-bar-wrapper {
  padding: 4px;
  border: 1px solid white;
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
  color: white;
  padding: 6px 16px;
  border-radius: 999px;
  cursor: pointer;
  font-size: 14px;
}

.tab.active {
  background: #434343;
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
}

.label {
  font-size: 14px;
  font-weight: 400;
  color: #dedede;
}

.small-text {
  font-size: 13px;
  font-weight: 300;
  color: #c9c9c9;
}

.input {
  height: 32px;
  border: 1px solid #c9c9c9;
  border-radius: 8px;
  padding-left: 8px;
  background: transparent;
  color: #fff;
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
  background: #434343;
  border: none;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 400;
  color: #fff;
  cursor: pointer;
}

.icon-button {
  font-size: 16px;
  background: none;
  border: none;
  cursor: pointer;
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
  border: 0.1px solid #6a6a6a;
  margin: 16px 0;
}

.analytics-button-link {
  position: absolute;
  bottom: 24px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
}
</style>
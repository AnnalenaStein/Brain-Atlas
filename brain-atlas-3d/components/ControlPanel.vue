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
      <ul class="tree">
        <li>
          <span class="tree-toggle">▾</span> Cerebrum
          <ul>
            <li>Frontal Lobe</li>
            <li>Parietal Lobe</li>
            <li>Temporal Lobe</li>
            <li>Occipital Lobe</li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup>
// All logic stays unchanged for now
</script>

<style scoped>
.control-panel {
  position: absolute;
  right: 16px;
  top: 96px;
  width: 20vw;
  padding: 16px;
  border-radius: 8px;
  background: rgba(81, 81, 81, 0.4);
  color: #fff;
  font-family: Inter, sans-serif;
}

.section {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-bottom: 16px;
}

.section-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 4px;
}

.label {
  font-size: 16px;
  font-weight: 400;
}

.small-text {
  font-size: 13px;
  font-weight: 300;
}

.input {
  height: 32px;
  border: 1px solid #c9c9c9;
  border-radius: 8px;
  padding-left: 8px;
  background: transparent;
  color: #fff;
  font-size: 14px;
}

.button-row,
.button-column {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.small-button {
  padding: 4px 8px;
  background: #454545;
  border: none;
  border-radius: 4px;
  font-size: 14px;
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
  border: 0.5px solid #969696;
  margin: 16px 0;
}
</style>

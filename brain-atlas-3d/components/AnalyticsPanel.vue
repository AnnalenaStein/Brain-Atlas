<template>
  <div class="analytics-panel">
    <div class="left-section">
      <h3 class="section-title">Search and Filter</h3>
      <p class="label">Edit Activity</p>
      <input type="text" placeholder="Handmovement" class="input" />
      <div class="button-row">
        <button class="small-button">Filter</button>
        <button class="small-button">Comparison</button>
      </div>

      <hr />

      <h3 class="section-title">Time Window</h3>
      <input type="range" class="slider" />
      <div class="row">
        <span class="label">Start</span>
        <span class="label">End</span>
      </div>

      <h3 class="section-title">Threshold</h3>
      <input type="range" class="slider" />
      <div class="row">
        <span class="label">0%</span>
        <span class="label">100%</span>
      </div>

      <h3 class="section-title">Cluster Settings</h3>
      <div class="row">
        <span class="label"># of Clusters</span>
        <input type="number" class="number-input" min="1" max="10" value="3" />
      </div>
      <div class="row">
        <span class="label">Method</span>
        <select class="dropdown">
          <option>KMeans</option>
          <option>DBSCAN</option>
          <option>Hierarchical</option>
        </select>
      </div>

      <div class="button-row">
        <button class="small-button">Reset</button>
        <button class="small-button">Export</button>
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
      <p class="label">Ask AI</p>
      <input type="text" class="input" placeholder="Why is there activation in..." />
    </div>
  </div>
</template>

<script setup>
// Logic will be added later as needed
</script>

<style scoped>
.analytics-panel {
  display: flex;
  justify-content: space-between;
  gap: 24px;
  width: 100%;
}

.left-section {
  width: 260px;
  padding: 16px;
  border-radius: 8px;
  background: rgba(81, 81, 81, 0.4);
  color: #fff;
  font-family: Inter, sans-serif;
}

.insight-box {
  width: 260px;
  padding: 16px;
  border-radius: 8px;
  background: rgba(81, 81, 81, 0.4);
  color: #fff;
}

.section-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 8px;
}

.dropdown {
  height: 32px;
  font-size: 14px;
  padding: 2px 20px 2px 12px;
  border-radius: 6px;
  border: 1px solid #ccc;
  background: #1a1a1a;
  color: white;
  width: 100%;
  margin-bottom: 16px;
}

.slider {
  width: 100%;
  height: 4px;
  margin-bottom: 8px;
}

.row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.button-row {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
  margin-top: 16px;
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

.label {
  font-size: 14px;
  font-weight: 400;
  color: #dedede;
  margin-bottom: 4px;
}

.number-input {
  width: 60px;
  background: #1a1a1a;
  border: 1px solid #ccc;
  color: #fff;
  border-radius: 6px;
  padding: 2px 6px;
  font-size: 14px;
}

hr {
  border: 0.5px solid #6a6a6a;
  margin: 16px 0;
}
</style>

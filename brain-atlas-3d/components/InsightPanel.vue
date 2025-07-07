<template>
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
</template>

<style scoped>
.insight-box {
  position: absolute;
  right: 16px;
  bottom: 80px;
  width: 300px;
  padding: 16px;
  border-radius: 8px;
  background: var(--bg-dropdown);
  color: var(--text-body);
}

.section-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 8px;
  color: var(--text-subheading);
}

.button-row {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
  margin-top: 16px;
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

.label {
  font-size: 14px;
  font-weight: 400;
  color: var(--text-label);
  margin-bottom: 4px;
}

hr {
  border: 0.5px solid var(--border-light);
  margin: 16px 0;
}
</style>

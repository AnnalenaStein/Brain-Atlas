<template>
    <div class="filter-overlay">
      <div class="filter-header">
        <h3 class="title">Filter</h3>
        <button class="close" @click="$emit('close')">✕</button>
      </div>
  
      <hr />
  
      <div class="section">
        <p class="section-title">Visible structures:</p>
        <label><input type="checkbox" /> Cortex</label>
        <label><input type="checkbox" /> Subcortical regions</label>
        <label><input type="checkbox" /> Brainstem</label>
        <label><input type="checkbox" /> Functional areas</label>
      </div>
  
      <hr />
  
      <div class="section">
        <p class="section-title">Show hemisphere:</p>
        <label><input type="checkbox" /> left</label>
        <label><input type="checkbox" /> right</label>
      </div>
  
      <hr />
  
      <div class="section">
        <label><input type="checkbox" /> Hide non-relevant areas</label>
      </div>
  
      <div class="button-row">
        <button class="small-button">Clear all</button>
        <button class="small-button apply" @click="$emit('close')">Apply</button>
      </div>
    </div>
  </template>
  
  <script setup>
  const emit = defineEmits(['close'])
  </script>
  
  <style scoped>
  .filter-overlay {
    position: absolute;
    top: 112px;
    right: 0;
    width: 260px;
    background: rgb(32, 32, 32);
    color: var(--text-body);
    padding: 20px 20px 16px 20px;
    border-radius: 12px;
    box-shadow: 0px 4px 18px rgba(0, 0, 0, 0.5);
    font-family: Inter, sans-serif;
    font-size: 14px;
    z-index: 999;
  }
  
  .filter-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
  }
  
  .title {
    font-size: 16px;
    font-weight: 600;
    color: var(--text-heading);
    margin: 0;
  }
  
  .close {
    background: none;
    border: none;
    color: var(--text-muted);
    font-size: 18px;
    cursor: pointer;
    padding: 0;
    line-height: 1;
  }
  
  hr {
    border: none;
    border-top: 1px solid var(--border-light);
    margin: 16px 0;
  }
  
  .section {
    display: flex;
    flex-direction: column;
    gap: 6px;
  }
  
  .section-title {
    font-size: 14px;
    font-weight: 520;
    color: var(--text-subheading);
    margin-bottom: 4px;
  }
  
  label {
    display: flex;
    align-items: center;
    gap: 6px;
    cursor: pointer;
    color: var(--text-body);
    font-size: 13.5px;
  }
  
  input[type='checkbox'] {
    accent-color: #6366f1;
    transform: scale(1.1);
  }
  
  .button-row {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    gap: 8px;
    flex-wrap: wrap;
  }
  
  /* 👇 exakt gleich wie .small-button in ControlPanel */
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
  
  .apply {
    font-weight: 500;
    background-color: #6366f1;
  }
  </style>
  
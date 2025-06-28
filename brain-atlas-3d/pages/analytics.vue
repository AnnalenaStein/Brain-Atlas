<template>
    <div class="analytics-wrapper">
      <button class="back-button" @click="goBack">← Back to Atlas</button>
  
      <h2 class="page-title">Analytics</h2>
      <div class="tab-bar">
        <button class="tab active">Clusteranalysis</button>
        <button class="tab">Comparison by Regions</button>
        <button class="tab">Time course</button>
      </div>
  
      <div class="main-layout">
        <div class="chart-panel">
          <!-- <img src="/cluster_plot_placeholder.png" alt="Cluster Chart" class="chart-image" /> -->
          <div class="chart-controls">
            <button class="icon">⏮</button>
            <button class="icon">▶️</button>
            <button class="icon">⏭</button>
            <input type="range" min="0" max="100" class="slider" />
          </div>
        </div>
  
        <AnalyticsPanel />
      </div>
    </div>
  </template>
  
  <script setup>
  import AnalyticsPanel from '~/components/AnalyticsPanel.vue'
  import { useRouter } from '#app'
  
  const router = useRouter()
  function goBack() {
    router.push('/atlas')
  }
  </script>
  
  <style scoped>
  .analytics-wrapper {
    background: #000;
    color: white;
    padding: 40px;
    min-height: 100vh;
    font-family: sans-serif;
  }
  
  .back-button {
    position: relative;
    margin-bottom: 20px;
    background-color: #374151;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 8px;
    cursor: pointer;
  }
  
  .back-button:hover {
    background-color: #4b5563;
  }
  
  .page-title {
    font-size: 24px;
    margin-bottom: 16px;
  }
  
  .tab-bar {
    display: flex;
    gap: 8px;
    margin-bottom: 32px;
  }
  
  .tab {
    background: none;
    border: 1px solid #fff;
    color: #fff;
    padding: 6px 12px;
    border-radius: 999px;
    cursor: pointer;
    font-size: 14px;
  }
  
  .tab.active {
    background: #fff;
    color: #000;
  }
  
  .main-layout {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 40px;
  }
  
  .chart-panel {
    background: #fff;
    padding: 16px;
    border-radius: 8px;
    flex: 1;
    max-width: 720px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  
  .chart-image {
    width: 100%;
    display: block;
    margin-bottom: 24px;
  }
  
  .chart-controls {
    display: flex;
    align-items: center;
    gap: 12px;
  }
  
  .icon {
    background: none;
    border: none;
    font-size: 18px;
    color: #fff;
    background-color: #1f2937;
    border-radius: 6px;
    padding: 6px 10px;
    cursor: pointer;
  }
  
  .slider {
    flex: 1;
    appearance: none;
    height: 4px;
    background: #9ca3af;
    border-radius: 2px;
    outline: none;
    transition: background 0.2s ease;
  }
  </style>
  
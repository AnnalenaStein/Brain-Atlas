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
  width: 316px;
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
  
  hr {
    border: 0.5px solid #6a6a6a;
    margin: 16px 0;
  }
  </style>
  
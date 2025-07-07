<template>
    <aside class="sidebar">
      <div class="logo">
        🧠 Brain Atlas
      </div>
  
      <nav class="nav">
        <router-link to="/atlas" class="nav-link" active-class="active">Atlas</router-link>
        <router-link to="/insight-space" class="nav-link" active-class="active">Insight Space</router-link>
        <router-link to="/notes" class="nav-link" active-class="active">Notes</router-link>
      </nav>
  
      <div class="user-info">
        <span class="user-indicator" />
        <span>Dr. Krämer</span>
      </div>
    </aside>
  </template>
  
  <script setup>
  // keine Logik nötig – reines Layout
  </script>
  
  <style scoped>
  .sidebar {
    width: 220px;
    background-color: #121212;
    color: #fff;
    height: 100vh;
    display: flex;
    flex-direction: column;
    padding: 1.5rem;
    box-shadow: inset -1px 0 0 #1e1e1e;
  }
  
  .logo {
    font-size: 1.4rem;
    font-weight: bold;
    margin-bottom: 2rem;
  }
  
  .nav {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    flex-grow: 1;
  }
  
  .nav-link {
    color: #bbb;
    text-decoration: none;
    font-size: 1rem;
    transition: color 0.2s;
  }
  
  .nav-link:hover {
    color: #fff;
  }
  
  .active {
    color: #65bfff;
    font-weight: 600;
  }
  
  .user-info {
    margin-top: auto;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.9rem;
    color: #aaa;
  }
  
  .user-indicator {
    width: 10px;
    height: 10px;
    background-color: #4caf50;
    border-radius: 50%;
  }
  </style>
  
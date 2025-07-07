<template>
    <header class="header-bar">
      <NuxtLink to="/" class="logo">
        <!-- <img src="/icons/brain-logo.svg" alt="Brain Atlas Logo" class="logo-icon" /> -->
        <span class="logo-text">Brain Atlas</span>
      </NuxtLink>
      
      <nav class="nav-links">
        <NuxtLink to="/atlas" class="nav-link" :class="{ active: $route.path === '/atlas' }">Atlas</NuxtLink>
        <NuxtLink to="/insight-space" class="nav-link" :class="{ active: $route.path === '/insight-space' }">Insight Space</NuxtLink>
      </nav>
  
      <div class="user-info">
        <span class="user-dot"></span>
        <span class="username">Dr. Krämer</span>
      </div>
    </header>
  </template>
  
  <script setup>
  // nothing needed here unless dynamic user logic comes in
  </script>

  <style scoped>
.header-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 14px 24px;
  background-color: #1a1a1a;
  color: white;

  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  border-bottom: 1px solid #333;
}
  
  .logo {
    display: flex;
    align-items: center;
    gap: 8px;
    text-decoration: none;
    color: var(--text-heading);
  }
  
  .logo-icon {
    width: 24px;
    height: 24px;
  }
  
  .logo-text {
    font-size: 18px;
    font-weight: bold;
  }
  
  .nav-links {
    display: flex;
    gap: 24px;
  }
  
  .nav-link {
    color: var(--text-muted);
    text-decoration: none;
    font-weight: 500;
  }
  
  .nav-link.active {
    text-decoration: underline;
    color: var(--text-heading);
  }
  
  .user-info {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  
  .user-dot {
    background-color: var(--text-muted);
    width: 16px;
    height: 16px;
    border-radius: 50%;
  }
  
  .username {
    font-weight: 500;
    color: var(--text-subheading);
  }
  </style>
  
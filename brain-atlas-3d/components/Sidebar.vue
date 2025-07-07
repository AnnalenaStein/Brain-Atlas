<template>
    <aside class="w-56 h-screen bg-bg text-white flex flex-col p-6 border-r border-border">
        <NuxtLink to="/" class="logo">
            <img src="/assets/icons/logo2.png" alt="Brain Atlas Logo" class="logo-icon" />
            <span class="logo-text">Brain Atlas</span>
        </NuxtLink>

        <nav class="flex flex-col gap-4 text-label">
            <NuxtLink to="/atlas" class="hover:text-white transition-colors" active-class="text-[#65bfff] font-semibold">
                Atlas
            </NuxtLink>
            <NuxtLink to="/analytics" class="hover:text-white transition-colors" active-class="text-[#65bfff] font-semibold">
                Analytics
            </NuxtLink>
            <NuxtLink to="/InsightSpace" class="hover:text-white transition-colors"
                active-class="text-[#65bfff] font-semibold">
                Insight Space
        </NuxtLink>
        </nav>

        <div class="mt-auto flex items-center gap-2 text-muted text-sm">
            <span class="w-2.5 h-2.5 bg-green-500 rounded-full"></span>
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

.logo-text {
    font-size: 20px;
    font-weight: medium;
    font-family: playfair, serif;
    letter-spacing: 1px;
}

.nav {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    flex-grow: 1;
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
  
<template>
    <div class="flex h-screen bg-bg text-white">
        <Sidebar />
        <HeaderBar />

        <div class="main-wrapper flex flex-col flex-1 p-8">
            <h2 class="text-heading mb-6">Notes</h2>

            <div class="flex gap-6 h-full">
                <!-- Main notes section -->
                <section
                    class="flex-1 bg-[#1a1a1a] rounded-2xl p-6 overflow-y-auto border border-borderLight scrollbar-thin scrollbar-thumb-[#444] scrollbar-track-transparent">
                    <div class="mb-10">
                        <h3 class="text-subheading mb-2">Moving the Hand</h3>
                        <p class="text-subtitle mb-3">Note in <span class="underline text-[#65bfff] cursor-pointer">Motor
                                Region</span></p>
                        <p class="text-body">
                            Hand movement involves a coordinated motor network. Key regions include the primary motor cortex
                            (M1) for initiating movement,
                            the supplementary motor area (SMA) for planning, and the premotor cortex (PMC) for action
                            preparation. The somatosensory
                            cortex provides feedback, while the cerebellum refines timing and precision.
                            <br /><br />
                            In goal-directed tasks like grasping, parietal regions help integrate spatial and visual
                            information. Studies show that
                            disruptions in this network, especially between SMA and M1, are linked to motor disorders such
                            as Parkinson’s.
                        </p>
                    </div>

                    <!-- Repeated note mockups -->
                    <div v-for="i in 10" :key="i" class="mb-10">
                        <p class="text-subtitle mb-2">Note in <span class="underline text-[#65bfff] cursor-pointer">Motor
                                Region</span></p>
                        <p class="text-body">
                            Hand movement involves a coordinated motor network. Key regions include the primary motor cortex
                            (M1)...
                        </p>
                    </div>
                </section>

                <!-- Sidebar notes list -->
                <aside
                    class="w-80 bg-[#161616] p-6 rounded-2xl border border-borderLight overflow-y-auto scrollbar-thin scrollbar-thumb-[#444] scrollbar-track-transparent">
                    <div v-for="i in 10" :key="i" class="mb-6 pb-4 border-b border-borderLight">
                        <h4 class="text-label font-semibold mb-1">Moving the Hand</h4>
                        <p class="text-muted text-sm mb-2">Last viewed: 06.07.2025</p>
                        <button
                            class="bg-[#333] text-white border border-[#666] px-3 py-1 rounded-md text-sm hover:bg-[#444] transition">
                            View Atlas
                        </button>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</template>
  
<script setup>

</script>
 
  
<style scoped>
.main-wrapper {
    margin-top: 50px;
    background-color: var(--bg-app);
    color: var(--text-body);
    font-family: Inter, sans-serif;
}

.notes-layout {
    display: flex;
    background-color: #0a0a0a;
    color: #f5f5f5;
    height: 100vh;
}

.main-content {
    flex: 1;
    padding: 2rem;
    display: flex;
    flex-direction: column;
}

.page-title {
    font-size: 1.8rem;
    font-weight: bold;
    margin-bottom: 1.5rem;
}

.content-area {
    display: flex;
    gap: 2rem;
    height: 100%;
}

::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-thumb {
  background-color: #444;
  border-radius: 4px;
}

.notes-view {
    flex: 3;
    background-color: #1a1a1a;
    border-radius: 12px;
    padding: 1.5rem;
    overflow-y: auto;
    box-shadow: inset 0 0 1px #444;
}

.note {
    margin-bottom: 2rem;
}

.note-title {
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
}

.note-category {
    font-size: 0.9rem;
    color: #9ab;
    margin-bottom: 0.75rem;
}

.note-link {
    color: #65bfff;
    cursor: pointer;
    text-decoration: underline;
}

.note-text {
    font-size: 1rem;
    line-height: 1.6;
    color: #d5d5d5;
}

.note-sidebar {
    flex: 1;
    background-color: #161616;
    padding: 1.5rem;
    border-radius: 12px;
    box-shadow: inset 0 0 1px #333;
    overflow-y: auto;
}

.note-item {
    margin-bottom: 2rem;
    border-bottom: 1px solid #333;
    padding-bottom: 1rem;
}

.note-title-small {
    font-size: 1rem;
    font-weight: 600;
    margin-bottom: 0.25rem;
    color: #fff;
}

.note-meta {
    font-size: 0.85rem;
    color: #aaa;
    margin-bottom: 0.5rem;
}

.view-button {
    background-color: #333;
    color: #fff;
    border: 1px solid #666;
    padding: 0.4rem 0.8rem;
    border-radius: 6px;
    font-size: 0.85rem;
    transition: background 0.2s;
}

.view-button:hover {
    background-color: #444;
}</style>
<template>
    <div class="flex h-100vh bg-bg text-white">
        <HeaderBar />

        <div class="main-wrapper flex flex-col flex-1 p-8">
            <!-- Titel über den Spalten -->
            <div class="grid grid-cols-[20rem_1fr] gap-6 mb-4">
                <h2 class="text-heading">Recent Atlases</h2>
                <h2 class="text-heading">Notes</h2>
         

            <aside
                class="w-80 bg-[#161616] p-6 rounded-2xl border border-borderLight overflow-y-auto scrollbar-thin scrollbar-thumb-[#444] scrollbar-track-transparent">
                <div v-for="atlas in recentAtlases" :key="atlas.title" class="mb-6 pb-4 border-b border-borderLight">
                    <h4 class="text-label font-semibold mb-1">{{ atlas.title }}</h4>
                    <p class="text-muted text-sm mb-2">Last viewed: {{ atlas.lastViewed }}</p>
                    <button
                        class="bg-[#333] text-white border border-[#666] px-3 py-1 rounded-md text-sm hover:bg-[#444] transition">
                        View Atlas
                    </button>
                </div>
            </aside>


            <!-- rechte Spalte: Notes -->
            <section
                class="flex-1 bg-[#1a1a1a] rounded-2xl p-6 overflow-y-auto border border-borderLight scrollbar-thin scrollbar-thumb-[#444] scrollbar-track-transparent">
                <div class="mb-10" v-for="(note, idx) in notes" :key="idx">
                    <h3 class="text-subheading mb-2">{{ note.title }}</h3>
                    <p class="text-subtitle mb-3">
                        Note in
                        <span class="underline text-[#65bfff] cursor-pointer">{{ note.region }}</span>
                    </p>
                    <p class="text-body whitespace-pre-line">{{ note.body }}</p>
                </div>
            </section>
        </div>
    </div>
</div>
</template>
  
  
<script setup>
const notes = [
    {
        title: 'Moving the Hand',
        region: 'Motor Region',
        body: `Hand movement involves a coordinated motor network. Key regions include the primary motor cortex (M1) for initiating movement,
  the supplementary motor area (SMA) for planning, and the premotor cortex (PMC) for action preparation. The somatosensory cortex provides feedback,
  while the cerebellum refines timing and precision.
  
  In goal-directed tasks like grasping, parietal regions help integrate spatial and visual information. Disruptions in this network, especially between SMA and M1,
  are linked to motor disorders such as Parkinson’s.`
    },
    {
        title: 'Visual Processing',
        region: 'Visual Cortex',
        body: `Visual processing involves multiple stages, starting from the retina to the primary visual cortex (V1) and extending to higher-order areas.
  The ventral stream processes object identity, while the dorsal stream handles spatial awareness. Disruptions in these pathways can lead to visual agnosia or neglect syndromes.`
    },
    {
        title: 'Cognitive Control',
        region: 'Prefrontal Cortex',
        body: `The prefrontal cortex (PFC) is crucial for executive functions like decision-making, working memory, and attention control.
  It interacts with the parietal cortex for spatial reasoning and the limbic system for emotional regulation. Damage to the PFC can impair judgment and impulse control,
  leading to conditions like ADHD or frontal lobe syndrome.`
    },
    {
        title: 'Language Processing',
        region: 'Language Regions',
        body: `Language processing involves Broca's area for speech production and Wernicke's area for comprehension.
  The arcuate fasciculus connects these regions, enabling fluent speech. Disruptions can lead to aphasia, affecting communication abilities.
  Neuroimaging studies show that language tasks activate a broader network, including the angular gyrus and supramarginal gyrus.`
    },
    {
        title: 'Memory Encoding',
        region: 'Hippocampus and Surrounding Regions',
        body: `Memory encoding involves the hippocampus for forming new memories and the surrounding cortex for storage.
  The entorhinal cortex acts as a gateway, integrating sensory information. Disruptions in this network can lead to amnesia or Alzheimer’s disease.`
    }
]

const recentAtlases = [
  { title: 'Motor System – Grasping', lastViewed: '06.07.2025' },
  { title: 'Visual Cortex – Object Recognition', lastViewed: '04.07.2025' },
  { title: 'Language Processing – Broca & Wernicke', lastViewed: '02.07.2025' },
  { title: 'Cerebellum – Coordination', lastViewed: '30.06.2025' },
  { title: 'Memory System – Hippocampus', lastViewed: '28.06.2025' },
  { title: 'Somatosensory Map – S1 & S2', lastViewed: '26.06.2025' },
  { title: 'Decision Making – Prefrontal Cortex', lastViewed: '25.06.2025' },
  { title: 'Emotion & Limbic System', lastViewed: '24.06.2025' },
  { title: 'Motor Planning – SMA & PMC', lastViewed: '22.06.2025' },
  { title: 'Thalamic Relay Overview', lastViewed: '20.06.2025' }
]

</script>
  
<style scoped>
.main-wrapper {
    margin-top: 50px;
    background-color: var(--bg-app);
    color: var(--text-body);
    font-family: Inter, sans-serif;
}

.text-heading {
    font-size: 2rem;
    font-weight: 500;
    color: var(--text-heading);
}

.text-subheading {
    font-size: 1.2rem;
    font-weight: 500;
}

.text-subtitle {
    font-size: 0.875rem;
    color: #ccc;
}

.text-body {
    font-size: 0.95rem;
    color: #ddd;
    line-height: 1.6;
}

.text-label {
    font-size: 1rem;
    font-weight: 600;
}

.text-muted {
    color: #999;
}

.scrollbar-thin::-webkit-scrollbar {
    width: 6px;
}

.scrollbar-thin::-webkit-scrollbar-thumb {
    background-color: #444;
    border-radius: 4px;
}
</style>
  
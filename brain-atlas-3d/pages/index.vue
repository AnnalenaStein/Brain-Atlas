<template>
  <div class="flex flex-col items-center justify-center min-h-screen bg-black text-white px-4 relative">
    <h1 class="text-3xl md:text-5xl font-semibold mb-6 text-center">Explore the Brain</h1>

    <div class="w-full max-w-xl mb-4">
      <label class="block text-sm text-gray-400 mb-1" for="activityInput">
        What do you want to explore?
      </label>
      <div class="relative flex items-center">
        <input
          id="activityInput"
          v-model="searchQuery"
          type="text"
          placeholder="e.g. Playing an Instrument or Broca"
          @keyup.enter="handleEnter"
          class="flex-1 px-4 py-2 rounded-md bg-black border border-gray-600 text-white focus:outline-none focus:ring-2 focus:ring-white placeholder-gray-500"
        />

        <!-- Menu Button (three dots) next to input field -->
        <div class="ml-2 relative">
          <button @click="menuOpen = !menuOpen" class="text-white hover:text-gray-300 px-2">
            &#x22EE;
          </button>

          <!-- Dropdown Menu -->
          <div
            v-if="menuOpen"
            class="absolute top-8 right-0 bg-gray-900 border border-gray-700 rounded-md p-4 text-sm w-56 z-50"
          >
            <label class="block text-xs text-gray-400 mb-1">Brain Atlas Type</label>
            <select
              v-model="selectedMode"
              class="w-full px-3 py-1 text-sm rounded-md bg-black border border-gray-700 text-white focus:outline-none focus:ring-1 focus:ring-white mb-4"
            >
              <option disabled value="">Select a mode</option>
              <option value="activity">Activity</option>
              <option value="region">Brain Region</option>
              <option value="connection">Connections</option>
              <option value="semantic">Semantic Map</option>
            </select>

            <button
              @click="uploadDICOM"
              class="text-white underline hover:text-gray-300"
            >
              + Upload DICOM
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="mb-6 w-full max-w-xl text-left">
      <p class="text-sm text-gray-400 mb-2">Popular Examples</p>
      <div class="flex flex-wrap justify-start gap-2">
        <button
          v-for="item in popularActivities"
          :key="item"
          @click="searchQuery = item"
          class="px-3 py-1 rounded bg-gray-800 hover:bg-gray-700 text-white text-sm"
        >
          {{ item }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const searchQuery = ref('')
const selectedMode = ref('')
const menuOpen = ref(false)

const popularActivities = [
  'Mathematics',
  'Talking',
  'Sports',
  'Reading',
  'Playing Chess',
  'Broca',
  'Visual Cortex'
]

const uploadDICOM = () => {
  alert('Upload DICOM functionality coming soon')
}

const handleEnter = (e: KeyboardEvent) => {
  if (e.key === 'Enter' && searchQuery.value.trim()) {
    const query: Record<string, string> = { q: searchQuery.value }
    if (selectedMode.value) query.mode = selectedMode.value
    router.push({ path: '/atlas', query })
  }
}
</script>

<template>
  <HeaderBar />
  <div class="flex flex-col items-center justify-center min-h-screen bg-bg text-base px-4 relative pt-20">
    <h1 class="text-heading mb-8 text-center">Explore the Brain</h1>

    <div class="w-full max-w-xl mb-4">
      <label class="text-label block text-label mb-1" for="activityInput">
        What do you want to explore?
      </label>
      <div class="flex flex-col gap-2">
        <div class="relative flex items-center">
          <input id="activityInput" v-model="searchQuery" type="text" placeholder="Playing an Instrument"
            @keyup.enter="handleEnter"
            class="w-full px-4 py-2 rounded-md focus:bg-[rgba(59,59,59,0.8)] border text-body focus:outline-none focus:ring-1.5 focus:ring-base placeholder-muted" />
        </div>
      </div>
    </div>

    <div class="mb-6 w-full max-w-xl text-left">
      <p class="text-label mb-2">Popular Examples</p>
      <div class="flex flex-wrap justify-start gap-2">
        <button v-for="item in popularActivities" :key="item" @click="searchQuery = item"
          class="px-3 py-1 rounded bg-tag hover:bg-tagHover text-sm text-body">
          {{ item }}
        </button>
      </div>
    </div>

    <button @click="menuOpen = !menuOpen" class="text-label underline hover:text-subtle mb-4">
      More Options
    </button>

    <div v-if="menuOpen" class="w-full max-w-xl bg-dropdown border border-borderLight rounded-md p-4 text-sm mb-8">
      <label class="block text-label mb-1">Brain Atlas Type</label>
      <select v-model="selectedMode"
        class="w-full px-3 py-1 text-sm rounded-md bg-input border border-borderLight text-body focus:outline-none focus:ring-1 focus:ring-base mb-4">
        <option disabled value="">Select a mode</option>
        <option value="activity">Activity</option>
        <option value="region">Brain Region</option>
        <option value="connection">Connections</option>
        <option value="semantic">Semantic Map</option>
      </select>

      <label class="block text-label mb-1">Brain Type</label>
      <select v-model="selectedPerson"
        class="w-full px-3 py-1 text-sm rounded-md bg-input border border-borderLight text-body focus:outline-none focus:ring-1 focus:ring-base">
        <option disabled value="">Select Brain Type</option>
        <option value="average">Average</option>
        <option value="athlete">Athlete</option>
        <option value="alzheimer">Alzheimer</option>
        <option value="artist">Artist</option>
        <option value="custom">Custom Upload</option>
      </select>

      <button @click="uploadDICOM" class="mt-4 text-body underline hover:text-subtle">
        + Upload DICOM
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const searchQuery = ref('')
const selectedMode = ref('')
const selectedPerson = ref('average')
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
    const lowerQuery = searchQuery.value.toLowerCase()

    if (
      lowerQuery.includes('region') ||
      lowerQuery.includes('area') ||
      lowerQuery.includes('zone')
    ) {
      router.push('/Regions')
    } else if (
      lowerQuery.includes('movement') ||
      lowerQuery.includes('activity') ||
      lowerQuery.includes('action') ||
      lowerQuery.includes('task') ||
      lowerQuery.includes('moving')
    ) {
      const query: Record<string, string> = { q: searchQuery.value }
      if (selectedMode.value) query.mode = selectedMode.value
      if (selectedPerson.value) query.person = selectedPerson.value
      router.push({ path: '/atlas', query })
    }
  }
}

</script>
